package com.iii._19_.hotVideo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iii._19_.hotVideo.model.HotVideoService;
import com.iii._19_.videoManage.model.VideoBean;

@Controller
@RequestMapping("hotVideo")
public class HotVideoController {
	
	@Autowired
	HotVideoService hotVideoService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getAllHotVideo(Map<String, Object> map) {
		List<VideoBean> hotVideoBeanList = hotVideoService.getAllHotVideo();
		map.put("hotVideos", hotVideoBeanList);
		
		
		return "hotVideo/hotVideo";
	}
}
