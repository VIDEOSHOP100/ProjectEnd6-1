package com.iii._01_.HomePageManage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.VideoWall.bean.VideoWallBean;
import com.iii._01_.VideoWall.service.VideoWallService;
import com.iii._19_.videoManage.model.VideoBean;
import com.iii._19_.videoManage.model.VideoManageService;

@Controller
public class HomePageManageController {

	@Autowired
	VideoManageService videoManageService;
	
	@Autowired
	VideoWallService videoWallService;
	
	
	
	@RequestMapping(value = "/getHomePageManage" , method=RequestMethod.GET)
	public @ResponseBody Map<String,Object> getHomePageManage() {
		
		Map<String,Object>map = new HashedMap<String,Object>();
		List<VideoBean>list = videoManageService.getAllVideo();
		
		map.put("VideoBeanList", list);
		
		return map;
	}
	
	@RequestMapping(value="/setVideoWall" , method=RequestMethod.POST)
	public @ResponseBody void setVideoWall(@RequestParam("SeqNoList") List<String>SeqNoList){
		
		List<VideoWallBean> BeanList = new ArrayList<VideoWallBean>();
		
		
		
		System.out.println("收到videoSeqNoList");
		
		String regEx="[^0-9]"; 
		Pattern p = Pattern.compile(regEx);   
		
		
		for(int i = 0 ;i<SeqNoList.size();i++) {
			
			String temp = (SeqNoList.get(i));
			Matcher m = p.matcher(temp);
			BeanList.add(new VideoWallBean(0,Integer.parseInt(m.replaceAll("").trim())));
			
		}
		
		videoWallService.saveAllVideoWall(BeanList);
		
	}
	
	
}
