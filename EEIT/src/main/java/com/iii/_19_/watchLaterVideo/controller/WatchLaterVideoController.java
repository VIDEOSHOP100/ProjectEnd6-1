package com.iii._19_.watchLaterVideo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._19_.videoManage.model.VideoBean;
import com.iii._19_.watchLaterVideo.model.WatchLaterVideoBean;
import com.iii._19_.watchLaterVideo.model.WatchLaterVideoService;

@Controller
@RequestMapping("watchLaterVideo")
public class WatchLaterVideoController {

	@Autowired
	private WatchLaterVideoService watchLaterVideoService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getWatchLaterVideoByAccount(HttpSession session, Map<String, Object> map) {
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		List<VideoBean> watchLaterVideo =  watchLaterVideoService.getWatchLaterVideoByAccount(account);
		map.put("watchLaterVideo", watchLaterVideo);
		return "watchLaterVideo/watchLaterVideo";
	}
	@ResponseBody
	@RequestMapping(value = "{videoSeqNo}",method = RequestMethod.GET)
	public Map<String, String> getWatchLaterVideo(@PathVariable("videoSeqNo") Integer videoSeqNo, HttpSession session) {
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		Map<String,String> map = new HashMap<String, String>();
		WatchLaterVideoBean watchLaterVideoBean = watchLaterVideoService.getWatchLaterVideo(account, videoSeqNo);
		if(watchLaterVideoBean != null) {
			if(watchLaterVideoBean.getWatchLaterVideosStatus().equals("1")) {
				map.put("status", "watchLater");
			}else if(watchLaterVideoBean.getWatchLaterVideosStatus().equals("0")) {
				map.put("status", "nonWatchLater");
			}
			return map;
		}
		map.put("status", "nonWatchLater");
		return map;
	}
	
//	@RequestMapping(method = RequestMethod.GET)
	public String getAllWatchLaterVideo() {
		List<WatchLaterVideoBean> watchLaterVideoBeanList = watchLaterVideoService.getAllWatchLaterVideo();
		return  "OK";
	}
	
	
	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody Map<String,String> saveWatchLaterVideo(@RequestBody WatchLaterVideoBean watchLaterVideoBean, HttpSession session) {
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		Map<String,String> returnData = new HashMap<String,String>();
		WatchLaterVideoBean watchLaterVideoBeanOld = watchLaterVideoService.getWatchLaterVideo(account, watchLaterVideoBean.getVideoSeqNo());
		if(watchLaterVideoBeanOld == null) {
			watchLaterVideoBean.setAccount(account);
			int key = watchLaterVideoService.saveWatchLaterVideo(watchLaterVideoBean);
			returnData.put("status", "watchLater");			
		} else if(watchLaterVideoBeanOld != null) {
			if(watchLaterVideoBeanOld.getWatchLaterVideosStatus().equals("1")) {
				watchLaterVideoBeanOld.setWatchLaterVideosStatus("0");
				watchLaterVideoService.updateWatchLaterVideo(watchLaterVideoBeanOld);
				returnData.put("status", "nonWatchLater");			
			}else if(watchLaterVideoBeanOld.getWatchLaterVideosStatus().equals("0")) {
				watchLaterVideoBeanOld.setWatchLaterVideosStatus("1");
				watchLaterVideoService.updateWatchLaterVideo(watchLaterVideoBeanOld);
				returnData.put("status", "watchLater");			
			}
		}
		return returnData; 
		
	}
	
	@RequestMapping(method = RequestMethod.PUT)
	public String updateWatchLaterVideo(@ModelAttribute WatchLaterVideoBean watchLaterVideoBean) {
		watchLaterVideoService.updateWatchLaterVideo(watchLaterVideoBean);
		return "OK";
	}
	
	@RequestMapping(value = "{watchLaterVideoSeqNo}" , method = RequestMethod.DELETE)
	public String deleteWatchLaterVideo(@PathVariable Integer watchLaterVideoSeqNo) {
		WatchLaterVideoBean watchLaterVideoBean = watchLaterVideoService.getWatchLaterVideoBySeqNo(watchLaterVideoSeqNo);
		watchLaterVideoService.deleteWatchLaterVideo(watchLaterVideoBean);
		
		return "OK";
	}
}
