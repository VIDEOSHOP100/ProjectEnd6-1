package com.iii._16_.OrderSystem.Order.controller;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.hibernate.sql.ordering.antlr.OrderByFragmentRenderer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._16_.BuyCart.ProCartList.model.ProCartListBean;
import com.iii._16_.BuyCart.ProCartList.model.ProCartListService;

import com.iii._16_.OrderSystem.Order.model.OrderBean;
import com.iii._16_.OrderSystem.Order.model.OrderService;
import com.iii._16_.OrderSystem.OrderProduct.model.OrderProductBean;
import com.iii._16_.OrderSystem.OrderProduct.model.OrderProductService;
import com.iii._16_.ProductSale.Product.model.ProductSaleService;

import com.iii._16_.StreetName.model.StreetService;

@Controller
public class OrderController {
	@Autowired
	private ProCartListService procartlistservice;
	@Autowired
	private ProductSaleService productsaleservice;
	@Autowired
	private StreetService streetservice;
	@Autowired
	private OrderService orderservice;
	@Autowired
	private OrderProductService orderproductservice;
	@ModelAttribute
	public void getOrderBean(Map<String, Object> map) {
		OrderBean order = new OrderBean();
		OrderProductBean orderproduct = new OrderProductBean();
		map.put("orderBean", order);
		map.put("OrderProductBean", orderproduct);

	}

	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	public String checkOut(Map<String, Object> map, HttpSession session) throws SQLException {
		System.out.println("checkout");

		// 此方法回傳使用者帳號account Ex.bob放入購物車的物品
		MemberBean memberbean = (MemberBean) session.getAttribute("LoginOK");
		String account = memberbean.getAccount();
		map.put("getMemberBean", memberbean);
		// 先將使用者帳號傳回購物車service方法 用帳號找出所有購物明細
		List<ProCartListBean> list = procartlistservice.getByAccountStatus(account);
		for (ProCartListBean bean : list) {

			bean.setProductbean(productsaleservice.getBySeqNo(bean.getProductSeqNo()));
//			System.out.println("從購物車中撈出bob的購買資訊 = " + bean);
		}
		// 將明細放入Map物件中 由jsp el撈出資料
		map.put("cartlist", list);

		// 準備放入縣市 地區的容器;
		List<String> citylist = new ArrayList<>();

		// 撈出所有縣市名
		List<String> d = streetservice.findcity();
		for (String city : d) {
			citylist.add(city);
		}
		map.put("citylist", citylist);

		return "OrderSystem/checkoutpage";
	}

	@RequestMapping(value="confirmOrder" ,method = RequestMethod.POST)
	public String confirmOrder(@ModelAttribute OrderBean ob, HttpSession session, BindingResult result) throws SQLException {
		 String[] suppressedFields = result.getSuppressedFields();
		 if (suppressedFields.length > 0) {
		 System.out.println("嘗試輸入不允許的欄位");
		 throw new RuntimeException("嘗試輸入不允許的欄位: " +
		 StringUtils.arrayToCommaDelimitedString(suppressedFields));
		 }
		 MemberBean member=(MemberBean)session.getAttribute("LoginOK");

		 OrderBean bean = new OrderBean();
	
		 Timestamp ts = new java.sql.Timestamp(System.currentTimeMillis());
		 ob.setOrderTime(ts);
		 ob.setOrderSeqNo(0);
		 int orderNum =orderservice.insertGetId(ob);	 
		// 先將使用者帳號傳回購物車service方法 用帳號找出所有購物明細
			List<ProCartListBean> list = procartlistservice.getByAccountStatus(member.getAccount());
			List<OrderProductBean> orderproductlist = new ArrayList<>();
			for (ProCartListBean productbean : list) {
				productbean.setProductbean(productsaleservice.getBySeqNo(productbean.getProductSeqNo()));
				OrderProductBean confirmbean = new OrderProductBean(productbean.getProductSeqNo(), productbean.getProductCount(), productbean.getProductbean().getProPrice(), member.getAccount(), orderNum, 0);
				OrderProductBean ddd = orderproductservice.insert(confirmbean);
				orderproductlist.add(ddd);
				
			}
			//成立訂單的帳號  將該帳號購物車內所有物品刪除
			if(orderproductlist.size()!=0) {
			procartlistservice.deleteAllByAccount(member.getAccount());
			//訂單新增成功  
			//將購物車中 使用者搜尋過的商品刪除
			}
		 return "OrderSystem/Success";
	}
	@RequestMapping(value = "/odergetcountry", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getCountryName(String city) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<String> countrylist = new ArrayList<>();
		// 撈出所有地區名
		List<String> d = streetservice.findcountry(city);
		for (String country : d) {
			countrylist.add(country);
		}
		result.put("countrylist", countrylist);
		return result;
	}

	@RequestMapping(value = "/gotoseven", method = RequestMethod.GET)
	public String checkOutToSeven() {
		System.out.println("checkout");

		return "OrderSystem/testtable";
	}
	
	
	
}
