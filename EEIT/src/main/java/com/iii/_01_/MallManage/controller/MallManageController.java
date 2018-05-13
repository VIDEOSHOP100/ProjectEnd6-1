package com.iii._01_.MallManage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MallManageController {

	@RequestMapping("/backstage/mallManage")
	public String getMallManage() {
		
		
		return "/backstage/mallManage";
	}
	
}
