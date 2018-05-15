package com.iii._16_.OrderSystem.Order.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._16_.BuyCart.ProCartList.model.ProCartListBean;
import com.iii._16_.BuyCart.ProCartList.model.ProCartListService;
import com.iii._16_.ProductSale.Product.model.ProductSaleService;
import com.iii._16_.StreetName.model.StreetBean;
import com.iii._16_.StreetName.model.StreetService;

@Controller
public class OrderController {
	@Autowired
	private ProCartListService procartlistservice;
	@Autowired
	private ProductSaleService productsaleservice;
	@Autowired
	private StreetService streetservice;
	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	public String checkOut(Map<String, Object> map, HttpSession session) throws SQLException {
		System.out.println("checkout");
		
		//此方法回傳使用者帳號account  Ex.bob放入購物車的物品
		MemberBean memberbean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberbean.getAccount();
		map.put("getMemberBean", memberbean);
		//先將使用者帳號傳回購物車service方法  用帳號找出所有購物明細		
		List<ProCartListBean> list = procartlistservice.getByAccountStatus(account);
		for(ProCartListBean bean :list) {
			
			bean.setProductbean(productsaleservice.getBySeqNo(bean.getProductSeqNo()));
			System.out.println("從購物車中撈出bob的購買資訊 = "+ bean);
		}
		//將明細放入Map物件中 由jsp el撈出資料
		map.put("cartlist", list);
		
		//準備放入縣市 地區的容器;
		List<String> citylist = new ArrayList<>();

		//撈出所有縣市名
		List<String> d= streetservice.findcity();
		for(String city : d){
			citylist.add(city);
		}
		map.put("citylist",citylist);
		
		return "OrderSystem/checkoutpage";
	}
	
	
	@RequestMapping(value = "/odergetcountry", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> getCountryName(String city) {
		Map<String,Object> result = new HashMap<String,Object>();
		List<String> countrylist = new ArrayList<>();
		//撈出所有地區名
		List<String> d= streetservice.findcountry(city);
		for(String country : d){
			countrylist.add(country);
		}
		result.put("countrylist",countrylist);
		return result;
	}
	
	
	@RequestMapping(value = "/gotoseven", method = RequestMethod.GET)
	public String checkOutToSeven() {
		System.out.println("checkout");
		
		return "OrderSystem/testtable";
	}
}
