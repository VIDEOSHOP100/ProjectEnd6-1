package com.iii._01_.webSiteReport.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class WebSiteReportController {

	
	@RequestMapping("getWebSiteReport")
	public @ResponseBody Map<String,Object> getWebSiteReport(){
		
		 Map<String,Object> map = new HashMap<String, Object>();
		 
		 return map;
		
	}
	
	
}
