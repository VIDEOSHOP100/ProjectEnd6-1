package com.iii._16_.OrderSystem.Order.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._16_.OrderSystem.Order.model.OrderBean;
import com.iii._16_.OrderSystem.Order.model.OrderService;
import com.iii._16_.OrderSystem.OrderProduct.model.OrderProductService;
import com.iii._16_.PDF.model.PdfProduceService;
import com.iii._16_.PDF.model.orderPdfService;
import com.iii._16_.ProductSale.PayType.model.PayTypeBean;
import com.iii._16_.ProductSale.PayType.model.PayTypeService;

@Controller
@RequestMapping("/orderManage")
public class OrderManageController {
	@Autowired
	private OrderService orderservice;
	@Autowired
	private OrderProductService orderproductservice;
	@Autowired
	private PdfProduceService pdfservice;
	@Autowired
	private orderPdfService orderpdfservice;
	@Autowired
	private PayTypeService payservice;
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping(method=RequestMethod.GET)
	public String myOrder(HttpSession session,Map<String,Object> map) throws SQLException {
		MemberBean member = (MemberBean) session.getAttribute("LoginOK");
		String account = member.getAccount();
		List<OrderBean> allorder = orderservice.findAllByAccount(account);
		
		for(OrderBean onebean : allorder) {
			//將時間取出 轉型成simpleDate
			java.util.Date time = onebean.getOrderTime();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			String timeString = sdf.format(time);
			onebean.setOrderDateTime(timeString);
			
			//將取出付款方式號碼 對應付款方式Table
			int paytype = onebean.getProPayTypeSeqNo();
		    PayTypeBean paybean =  payservice.findbyPrimaryKey(paytype);
		    onebean.setHowToPay(paybean.getPayType());
		    
		    //付款狀態判定
		    int orderStatus = onebean.getOrderStatus();
		    if(orderStatus==1) {
		    	onebean.setTransorderStatus("未付款,未出貨");
		    }else if(orderStatus==2) {
		    	onebean.setTransorderStatus("已付款,未出貨");
		    }else if(orderStatus==3) {
		    	onebean.setTransorderStatus("已付款,已出貨");
		    }else if(orderStatus==4) {
		    	onebean.setTransorderStatus("已付款,已到貨");
		    }
		    
		    
		}
		   
		

		map.put("orderlists", allorder);
		map.put("getMemberBean", member);
		return "OrderSystem/myOrderManage";
	}
	
}
