package com.iii._19_.watchHistory.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._19_.videoManage.model.VideoBean;
import com.iii._19_.watchHistory.model.WatchHistoryBean;
import com.iii._19_.watchHistory.model.WatchHistoryService;

@Controller
@RequestMapping("watchHistory")
public class WatchHistoryController {
	
	@Autowired
	WatchHistoryService watchHistoryService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String getUserWatchHistory(Map<String, Object> map, HttpSession session) {
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		List<VideoBean> watchHistoryVideoBeanList =  watchHistoryService.getAccountWatchHistory(account);
		map.put("watchHistory", watchHistoryVideoBeanList);
		return "watchHistory/watchHistory";
	}
	
	@RequestMapping(value="page/{pageNo}", method=RequestMethod.GET)
	public @ResponseBody Map<String,Object> getWatchHistoryByPageNo(@PathVariable("pageNo") Integer pageNo, HttpSession session){
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		Map<String,Object> map = new HashMap<String,Object>();
		List<VideoBean> videoBeanList = watchHistoryService.getWatchHistoryByPageNo(account, pageNo);
		map.put("videoBeanList", videoBeanList);
		return map;
	}
	
	@RequestMapping(value="{account}/{videoSeqNo}", method=RequestMethod.GET)
	public String getWatchHistory(@PathVariable("account") String account, @PathVariable("videoSeqNo") Integer videoSeqNo) {
		List<WatchHistoryBean> watchHistoryBeanList = watchHistoryService.getWatchHistory(account,videoSeqNo);
		return "OK";
	}
	
//	@RequestMapping(value = "{account}" , method=RequestMethod.GET)
	public String getAllWatchHistory(@PathVariable("account") String account) {
		List<WatchHistoryBean> watchHistoryList= watchHistoryService.getAllWatchHistory(account);
		return "OK";
	}
	
	@RequestMapping(method = RequestMethod.PUT)
	public @ResponseBody Map<String,String> updateWatchHistory(
			@RequestParam("videoSeqNo") Integer videoSeqNo,
			@RequestParam("watchHistoryStatus") String watchHistoryStatus,
			HttpSession session
			) {
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		List<WatchHistoryBean> watchHistoryBeanList = watchHistoryService.getWatchHistory(account, videoSeqNo);
		for(WatchHistoryBean watchHistoryBean : watchHistoryBeanList) {
			watchHistoryBean.setWatchHistoryStatus(watchHistoryStatus);
			watchHistoryService.updateWatchHistory(watchHistoryBean);
		}
		Map<String, String> map = new HashMap<String,String>();
		map.put("status", "success");
		return map;
	}
	
	@RequestMapping(value = "{watchHistorySeqNo}" ,method = RequestMethod.DELETE)
	public String deleteWatchHistory(@PathVariable Integer watchHistorySeqNo) {
		WatchHistoryBean watchHistoryBean = watchHistoryService.getWatchHistoryBySeqNo(watchHistorySeqNo);
		
		
		watchHistoryService.deleteWatchHistory(watchHistoryBean);
		return "OK";
	}
}
