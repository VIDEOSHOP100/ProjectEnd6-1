package com.iii._16_.OrderSystem.Order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OrderController {
	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	public String checkOut() {
		System.out.println("checkout");
		
		return "OrderSystem/checkoutpage";
	}
}
