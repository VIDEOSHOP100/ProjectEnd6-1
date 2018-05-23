package com.iii._01_.HomePageManage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomePageManageController {

	@RequestMapping(value = "/getHomePageManage" , method=RequestMethod.GET)
	public @ResponseBody String getHomePageManage() {
		return "";
	}
}
