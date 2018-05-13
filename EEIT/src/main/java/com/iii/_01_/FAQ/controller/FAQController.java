package com.iii._01_.FAQ.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FAQController {

	@RequestMapping("/backstage/FAQ")
	public String FAQ() {
		
		return "/backstage/FAQ";
	}
	
}
