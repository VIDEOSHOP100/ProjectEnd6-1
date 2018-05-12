package com.iii._01_.Friend.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.Friend.bean.FriendBean;
import com.iii._01_.Friend.service.FriendService;
import com.iii._01_.Member.bean.MemberBean;

@Controller
@RequestMapping("/addfriend")
public class FriendController {

	@Autowired
	FriendService friendService;
	
	@RequestMapping(method=RequestMethod.PUT)
	public @ResponseBody Map<String,String> updateAddFriend(
			@RequestParam("othersideaccount")String othersideaccount,
			@RequestParam("friendStatus")Integer friendStatus,
			HttpSession session
			) {
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		FriendBean fb = friendService.getFriendBeanByBothAccount(account, othersideaccount);
		fb.setFriendStatus(friendStatus);
		friendService.updateFriendRequest(fb);
		Map<String,String> map = new HashMap<String ,String>();
		map.put("status", "success");
		return map;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public @ResponseBody String saveAddFriend(
			@RequestParam("othersideaccount")String othersideaccount,
			@RequestParam("friendStatus")Integer friendStatus,
			HttpSession session
			) {
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		FriendBean fb = friendService.getFriendBeanByBothAccount(account, othersideaccount);
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		
		if(fb ==null) {
			fb = new FriendBean(0, account, othersideaccount, now, friendStatus);
			friendService.saveFriendRequest(fb);	
		}else {
			fb.setFriendStatus(friendStatus);
			friendService.updateFriendRequest(fb);
		}
		
		return "";
	}
	
	
	
}


