package com.iii._19_.newVideo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iii._19_.newVideo.model.NewVideoService;
import com.iii._19_.videoManage.model.VideoBean;

@Controller
@RequestMapping("newVideo")
public class NewVideoController {
	
	@Autowired
	NewVideoService newVideoService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String getAllNewVideos(Map<String,Object> map) {
		List<VideoBean> videoBeanList = newVideoService.getAllNewVideos();
		map.put("newVideos", videoBeanList);
		
		return "newVideo/newVideo";
	}
}
