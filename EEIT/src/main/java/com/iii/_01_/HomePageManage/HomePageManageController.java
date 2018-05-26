package com.iii._01_.HomePageManage;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._19_.videoManage.model.VideoBean;
import com.iii._19_.videoManage.model.VideoManageService;

@Controller
public class HomePageManageController {

	@Autowired
	VideoManageService videoManageService;
	
	
	@RequestMapping(value = "/getHomePageManage" , method=RequestMethod.GET)
	public @ResponseBody Map<String,Object> getHomePageManage() {
		
		Map<String,Object>map = new HashedMap<String,Object>();
		List<VideoBean>list = videoManageService.getAllVideo();
		
		map.put("VideoBeanList", list);
		
		return map;
	}
	
	@RequestMapping(value="/setVideoWall" , method=RequestMethod.POST)
	public @ResponseBody void setVideoWall(@RequestBody List<Integer>list){
			
		
		
		
		
		
	}
	
	
}
