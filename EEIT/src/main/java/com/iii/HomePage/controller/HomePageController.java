package com.iii.HomePage.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iii.HomePage.model.HomePageService;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeService;
import com.iii._19_.videoType.model.VideoTypeService;

@Controller
public class HomePageController {

	@Autowired
	HomePageService homePageService;
	
	@Autowired
	VideoTypeService videoTypeService;
	
	@Autowired
	InputLiveStreamTimeService inputLiveStreamTimeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Map<String, Object> map) {
		map.put("hotVideos", homePageService.getHotVideos());
		map.put("newVideos", homePageService.getNewVideos());
		map.put("sortedVideos", videoTypeService.getAllVideoType());
		map.put("liveStream", inputLiveStreamTimeService.getAllLiveStreams());
		
		return "index";
	}

}
