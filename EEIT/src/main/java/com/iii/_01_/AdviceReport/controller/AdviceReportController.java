package com.iii._01_.AdviceReport.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iii._01_.AdviceReport.bean.AdviceReportBean;

@Controller
public class AdviceReportController {

	
	
	@RequestMapping("/MemberCenter/adviceReport")
	public String adviceReport(Map<String,AdviceReportBean>map) {
		map.put("AdviceReportBean",new AdviceReportBean());
			
		return "MemberCenter/adviceReport";
	}
	
	
	
	
}
