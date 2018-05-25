package com.iii._01_.HomePageManage;

import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomePageManageController {

	@RequestMapping(value = "/getHomePageManage" , method=RequestMethod.GET)
	public @ResponseBody Map<String,Object> getHomePageManage() {
		
		Map<String,Object>map = new HashedMap<String,Object>();
		
		
		
		
		
		
		
		return map;
	}
}
