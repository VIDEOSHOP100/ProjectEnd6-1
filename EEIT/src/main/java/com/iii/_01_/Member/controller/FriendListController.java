package com.iii._01_.Member.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iii._01_.Friend.bean.FriendBean;
import com.iii._01_.Friend.service.FriendService;
import com.iii._01_.Member.bean.MemberBean;

@Controller
public class FriendListController {

	@Autowired
	FriendService friendService;
	
	@RequestMapping("/MemberCenter/myFriendList")
	public String getMyFriendList(Map<String,List<FriendBean>>map ,HttpSession session) {
		
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		
		String account = mb.getAccount();
		
		List<FriendBean> list = (friendService.getFriendByOneAccount(account));
		
		map.put("myFriendList",list);
				
		return "MemberCenter/myFriendList";
		
	}
	
	
	
}
