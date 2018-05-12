package com.iii._19_.videoType.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iii._19_.videoManage.model.VideoBean;
import com.iii._19_.videoType.model.VideoTypeBean;
import com.iii._19_.videoType.model.VideoTypeService;

@Controller
@RequestMapping("videoType")
public class VideoTypeController {
	
	@Autowired
	private VideoTypeService videoTypeService;
	
	@RequestMapping(value = "{videoType}",method=RequestMethod.GET)
	public String getVideoType(@PathVariable String videoType, Map<String, Object> map) {
		List<VideoBean> videoTypeBean = videoTypeService.getOneVideoTypeVideos(videoType);
		map.put("sortedVideos", videoTypeBean);
		map.put("videoType", videoTypeBean.get(0).getVideoType());
		return "videoType/videoOneType";
		
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String getAllVideoTypes(Map<String, Object> map) {
		List<List<VideoBean>> sortedVideos = videoTypeService.getAllVideoType();
		map.put("sortedVideos", sortedVideos);
		return "videoType/videoType";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String saveVideoType(@ModelAttribute VideoTypeBean videoTypeBean) {
		int key = videoTypeService.saveVideoType(videoTypeBean);
		return "OK";
	}
	
	@RequestMapping(method = RequestMethod.PUT)
	public String updateVideoType(@ModelAttribute VideoTypeBean videoTypeBean) {
		videoTypeService.updateVideoType(videoTypeBean);
		return "OK";
	}
	
	@RequestMapping(value = "{videoType}",method = RequestMethod.DELETE)
	public String deleteVideoType(@PathVariable String videoType) {
//		VideoTypeBean videoTypeBean = videoTypeService.getOneVideoType(videoType);
//		videoTypeService.deleteVideoType(videoTypeBean);
		return "OK";
	}
}
