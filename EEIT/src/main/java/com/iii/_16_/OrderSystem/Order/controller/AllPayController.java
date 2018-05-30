package com.iii._16_.OrderSystem.Order.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._16_.OrderSystem.Order.model.OrderBean;
import com.iii._16_.OrderSystem.Order.model.OrderService;
import com.iii._16_.OrderSystem.OrderProduct.model.OrderProductBean;
import com.iii._16_.OrderSystem.OrderProduct.model.OrderProductService;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleService;

import allPay.payment.integration.AllInOne;
import allPay.payment.integration.domain.AioCheckOutALL;
import allPay.payment.integration.domain.InvoiceObj;
import allPay.payment.integration.exception.AllPayException;





@Controller
@RequestMapping("/allpay")
public class AllPayController {
	
	@Autowired
	private OrderService orderservice;
	@Autowired
	private OrderProductService orderproductservice;
	@Autowired
	private ProductSaleService productsaleservice;
	@RequestMapping(value="/checkout/{orderSeqNo}",method=RequestMethod.POST,produces="text/html;charset=UTF-8")
	public @ResponseBody String checkOutAllPay(HttpSession session,@PathVariable("orderSeqNo") Integer orderSeqNo) throws SQLException {
		
		System.out.println("allapy");
		MemberBean member = (MemberBean) session.getAttribute("LoginOK");
		String account = member.getAccount();
		AllInOne all = new AllInOne("");
		AioCheckOutALL aio = new AioCheckOutALL();
		InvoiceObj invoice = new InvoiceObj();
		//不指定付款方式 用null
		invoice=null;
		//設定訂單編號,20碼.可自訂
		aio.setMerchantTradeNo(UUID.randomUUID().toString().replace("-", "").substring(0, 20));
		//帳號+取得BEAN
		OrderBean order = orderservice.findByorderSeqNo(orderSeqNo);
		List<OrderProductBean> productlist = orderproductservice.getByorderSeqNo(orderSeqNo);
		String proName = null;
		String proPrice = null;
		String proTotalName = "";
		Long proTotalPrice = 0L;
		for(OrderProductBean orderproductbean :productlist) {
			ProductSaleBean realproduct = productsaleservice.getBySeqNo(orderproductbean.getProductSeqNo());
			proName = realproduct.getProName()+"#";
		    proPrice = String.valueOf(orderproductbean.getProductPrice());
		    proTotalName = proTotalName+proName;
		    proTotalPrice = proTotalPrice + orderproductbean.getProductTotal();
//			Date date = new Date();
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
//	 		aio.setMerchantTradeDate(sdf.format(date));	
	 		// 顯示付款成功的頁面（預設
	 		// 付款成功後轉跳的頁面
			}
		// 商品名稱＋單價＋數量
//		System.out.println(proTotalName);
		aio.setItemName(proTotalName);
		// 交易金額
		
		aio.setTotalAmount(String.valueOf(proTotalPrice));
		// 交易描述
		aio.setTradeDesc("工");
		aio.setHoldTradeAMT("0");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
 		aio.setMerchantTradeDate(sdf.format(date));	
		aio.setReturnURL("https://developers.opay.tw/AioMock/MerchantReturnUrl");
//		aio.setClientBackURL("http://localhost:8080/EEIT/goMarketHomePage");
		aio.setClientBackURL("https://livemarket.southeastasia.cloudapp.azure.com:8443/EEIT/goMarketHomePage");
//		aio.setOrderResultURL("http://localhost:8080/EEIT/goMarketHomePage");
//		aio.setOrderResultURL("https://eeitdemo10005.southeastasia.cloudapp.azure.com:8443/EEIT/goMarketHomePage");
				try {
					String html = all.aioCheckOut(aio, invoice);
					
					order.setOrderStatus(2);
					orderservice.update(order);
					return html;
				} catch (AllPayException e) {
					throw new Error(e.getNewExceptionMessage());
				}
			
			}
	
	@RequestMapping(value="/getAllPayOrder",method=RequestMethod.POST,produces="text/html;charset=UTF-8")
	public String getAllPayOrder(HttpServletRequest request,Map<String,String> map) {

		
		return "OrderSystem/allorder";
	}
}
