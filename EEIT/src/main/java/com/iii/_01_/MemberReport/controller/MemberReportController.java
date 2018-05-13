package com.iii._01_.MemberReport.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iii._01_.MemberReport.bean.MemberReportBean;
import com.iii._01_.MemberReport.service.MemberReportService;

@Controller
public class MemberReportController {

	@Autowired
	MemberReportService memberReportService;
	
	
	
	@RequestMapping("/backstage/memberReport")
	public String getmemberReport(Model model) {
		List<MemberReportBean> list = memberReportService.getAllMemberReport();
		model.addAttribute("MemberReportList",list);
		return "/backstage/memberReport";
	}
	
	
	
}
