package com.iii._01_.ProductReport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductReportController {

	@RequestMapping("/backstage/productReport")
	public String getProductReport() {
		return "/backstage/productReport";
	}
	
	
}
