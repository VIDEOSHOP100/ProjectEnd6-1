package com.iii._01_.HomePageManage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomePageManageController {

	@RequestMapping("/backstage/homePageManage")
	public String getHomePageManage() {
		
		return "/backstage/homePageManage";
	}
}
