package com.iii._01_.Member.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iii._01_.Friend.service.FriendService;
import com.iii._01_.Member.bean.MemberBean;
import com.iii._01_.Member.service.MemberCenterService;
import com.iii._01_.MemberReport.bean.MemberReportBean;
import com.iii._01_.MyMessage.bean.MyMessageBean;

@Controller
public class MemberCenterController {

	@Autowired
	MemberCenterService memberCenterService;
	@Autowired
	FriendService friendService;
	
	@ModelAttribute
	public void getMemberReportBean(Map<String , Object> map) {
		System.out.println("MemberReportBean here");
		map.put("MemberReportBean", new MemberReportBean());
	}
	
	@RequestMapping("/MemberCenter")
	public String memberCenter() {
		return "MemberCenter/MemberCenter";
	}
	
//	@RequestMapping("/profile/{account}")
	public String profile(@PathVariable("account")String othersideaccount , Model model ,HttpSession session) {
		
		MemberBean bean = memberCenterService.getProfile(othersideaccount);
		model.addAttribute("otherside", bean);
		
		
		if (session.getAttribute("LoginOK")!=null) {
			MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
			String myAccount = memberBean.getAccount();
			Integer friendstatus = friendService.getFriendStatus(myAccount, othersideaccount);
			if(friendstatus==null)friendstatus=0;
			model.addAttribute("friendstatus", friendstatus);
			model.addAttribute("MyMessageBean", new MyMessageBean());
		}
		return "MemberCenter/profile";
	}
	
	@RequestMapping(value = "/adviceReport" , method=RequestMethod.GET)
	public String getAdviceReport(Model model) {
		
		
		
		
		return "/MemberCenter/adviceReport";
	}
	
	
}