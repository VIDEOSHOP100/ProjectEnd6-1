package com.iii._16_.BuyCart.ProCart.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._16_.BuyCart.ProCart.model.ProCartBean;
import com.iii._16_.BuyCart.ProCart.model.ProCartService;
import com.iii._16_.BuyCart.ProCartList.model.ProCartListBean;


@Controller
@RequestMapping("/hereisurcart")
public class ProCartController {
	
	@Autowired
	private ProCartService procartservice;
	
	@ModelAttribute
	public void getCartBean(Map<String, Object> map) {
		ProCartBean cartbean = new ProCartBean();
		map.put("ProCartBean", cartbean);
	}
	
	
	@RequestMapping(value="/",method = RequestMethod.GET)
	public String addThisOneInCart(@PathVariable("productid") Integer id,
			@ModelAttribute("MemberBean") MemberBean mb,
			@ModelAttribute("ProCartListBean") ProCartListBean cartlistb,
			Map<String,Object> map,HttpSession session) {
			
			return "Cart/CartProductList";
	}
}
