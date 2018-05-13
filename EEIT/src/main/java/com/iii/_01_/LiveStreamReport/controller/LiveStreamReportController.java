package com.iii._01_.LiveStreamReport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LiveStreamReportController {

	@RequestMapping("/backstage/liveStreamReport")
	public String getLiveStreamReport() {
		
		
		return "/backstage/liveStreamReport";
	}
	
	
}
