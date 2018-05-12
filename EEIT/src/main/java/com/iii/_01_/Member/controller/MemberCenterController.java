package com.iii._01_.Member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iii._01_.Friend.service.FriendService;
import com.iii._01_.Member.bean.MemberBean;
import com.iii._01_.Member.service.MemberCenterService;

@Controller
public class MemberCenterController {

	@Autowired
	MemberCenterService memberCenterService;
	@Autowired
	FriendService friendService;
	
	@RequestMapping("/MemberCenter")
	public String memberCenter() {
		return "MemberCenter/MemberCenter";
	}
	
	@RequestMapping("/profile/{account}")
	public String profile(@PathVariable("account")String othersideaccount , Model model ,HttpSession session) {
		
		MemberBean bean = memberCenterService.getProfile(othersideaccount);
		model.addAttribute("otherside", bean);
		
		
		if (session.getAttribute("LoginOK")!=null) {
			MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
			String myAccount = memberBean.getAccount();
			Integer friendstatus = friendService.getFriendStatus(myAccount, othersideaccount);
			if(friendstatus==null)friendstatus=0;
			model.addAttribute("friendstatus", friendstatus);
		}
		return "MemberCenter/profile";
	}
	

	
}
