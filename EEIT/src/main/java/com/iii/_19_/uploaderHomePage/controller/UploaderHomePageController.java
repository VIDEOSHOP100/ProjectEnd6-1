package com.iii._19_.uploaderHomePage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.Friend.service.FriendService;
import com.iii._01_.Member.bean.MemberBean;
import com.iii._01_.Member.service.MemberCenterService;
import com.iii._01_.MyMessage.bean.MyMessageBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
import com.iii._19_.uploaderHomePage.model.UploaderHomePageService;
import com.iii._19_.videoManage.model.VideoBean;
import com.iii._19_.videoManage.model.VideoManageService;

@Controller
//@RequestMapping("uploaderHomePage")
public class UploaderHomePageController {
	
	@Autowired
	VideoManageService videoManageService;
	
	@Autowired
	UploaderHomePageService uploaderHomePageService; 
	
	@Autowired
	MemberCenterService memberCenterService;
	
	@Autowired
	FriendService friendService;
	
	@RequestMapping(value="profile/{uploaderAccount}",method = RequestMethod.GET)
	public String getUserHomePage(@PathVariable("uploaderAccount") String uploaderAccount, HttpSession session, Map<String,Object> map) {
//		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
//		String account = memberBean.getAccount();
		MemberBean bean = memberCenterService.getProfile(uploaderAccount);
		map.put("otherside", bean);
		
		
		if (session.getAttribute("LoginOK")!=null) {
			MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
			String myAccount = memberBean.getAccount();
			Integer friendstatus = friendService.getFriendStatus(myAccount, uploaderAccount);
			if(friendstatus==null)friendstatus=0;
			map.put("friendstatus", friendstatus);
			map.put("MyMessageBean", new MyMessageBean());
		}
		List<VideoBean> videoBeanList = uploaderHomePageService.getUserTopTwelveVideos(uploaderAccount);
		List<InputLiveStreamTimeBean> inputLiveStreamTimeBeanList =  uploaderHomePageService.getUserTopTwelveLiveStream(uploaderAccount);
		List<ProductSaleBean> productSaleBeanList = uploaderHomePageService.getUserTopTwelveProducts(uploaderAccount);
		map.put("videoBeanList", videoBeanList);
		map.put("uploaderAccount", uploaderAccount);
		map.put("inputLiveStreamTimeBeanList", inputLiveStreamTimeBeanList);
		map.put("productSaleBeanList", productSaleBeanList);
		return "uploaderHomePage/uploaderHomePage";
	}
	
	@RequestMapping(value="uploaderHomePage/{uploaderAccount}/type/{type}",method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> getUserSubPage(@PathVariable("uploaderAccount") String uploaderAccount,@PathVariable("type") String type, HttpSession session) {
//		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
//		String account = memberBean.getAccount();
		Map<String, Object> map = new HashMap<String, Object>();
		if(type.equals("homePage")) {
			List<ProductSaleBean> pageResultProduct = uploaderHomePageService.getUserTopTwelveProducts(uploaderAccount);
			List<VideoBean> pageResultVideo = uploaderHomePageService.getUserTopTwelveVideos(uploaderAccount);
			List<InputLiveStreamTimeBean> pageResultLiveStream =  uploaderHomePageService.getUserTopTwelveLiveStream(uploaderAccount);
			map.put("pageResultProduct", pageResultProduct);
			map.put("pageResultVideo", pageResultVideo);
			map.put("pageResultLiveStream", pageResultLiveStream);
		}else if(type.equals("product")) {
			List<ProductSaleBean> pageResult = uploaderHomePageService.getUserAllProducts(uploaderAccount);
			map.put("pageResult", pageResult);
		}else if(type.equals("video")) {
			List<VideoBean> pageResult= videoManageService.getAllVideoByAccount(uploaderAccount);
			map.put("pageResult", pageResult);
		}else if(type.equals("detail")) {
//			MemberBean pageResult = uploaderHomePageService.getUserDetail(uploaderAccount);
//			map.put("pageResult", pageResult);
		}else if(type.equals("livestream")) {
			List<InputLiveStreamTimeBean> pageResult = uploaderHomePageService.getUserAllLiveStream(uploaderAccount);
			map.put("pageResult", pageResult);
		}
		List<ArrayList<Integer>> a  = new ArrayList<ArrayList<Integer>>();
		return map;
	}
}
