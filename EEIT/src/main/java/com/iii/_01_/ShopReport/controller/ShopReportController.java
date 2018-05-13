package com.iii._01_.ShopReport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShopReportController {

	@RequestMapping("/backstage/shopReport")
	public String getShopReport(){
		
		return "/backstage/shopReport";
	}
	
}
