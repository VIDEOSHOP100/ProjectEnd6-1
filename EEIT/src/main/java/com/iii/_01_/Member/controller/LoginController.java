package com.iii._01_.Member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.Friend.bean.FriendBean;
import com.iii._01_.Friend.service.FriendService;
import com.iii._01_.Member.bean.MemberBean;
import com.iii._01_.Member.service.LoginService;
import com.iii._19_.notificationRecording.model.NotificationRecordingBean;
import com.iii._19_.notificationRecording.model.NotificationRecordingService;

//@SessionAttributes("LoginOK")
@Controller
public class LoginController {

	@Autowired
	LoginService loginService;

	@Autowired
	FriendService friendService;

	@Autowired
	NotificationRecordingService notificationRecordingService;

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("LoginOK");
		session.removeAttribute("target");

		return "redirect:" + "/";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("MemberBean") MemberBean mb, BindingResult result, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String target = (String) session.getAttribute("target");
		target = target.substring(target.lastIndexOf("/EEIT/") + 5);
		Map<String, String> errorMessageMap = new HashMap<String, String>();
		session.setAttribute("ErrorMessageKey", errorMessageMap);
		MemberBean bean = loginService.checkIDPassword(mb.getAccount(), mb.getPassword());
		if (bean != null) {
			bean = loginService.updateLastLogin(bean);
			session.setAttribute("LoginOK", bean);
			String account = bean.getAccount();
			List<FriendBean> friendBeanList = friendService.getFriendByOneAccount(account);
			session.setAttribute("friendBeanList", friendBeanList);
			// List<NotificationRecordingBean> notificationRecordingBeanList =
			// notificationRecordingService.getNotificationRecordingByReceiverAccount(account);
			// session.setAttribute("notificationRecordingBeanList",
			// notificationRecordingBeanList);
			if(target.equals("/loginPage")) {
				return "index";
			}
		} else {
			errorMessageMap.put("error", "帳號或密碼錯誤!");
		}
		return "redirect:" + target;
	}

	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public Map<String, Boolean> loginCheck(HttpServletRequest request) {

		Map<String, Boolean> map = new HashMap<String, Boolean>();

		HttpSession session = request.getSession();

		if (session.getAttribute("LoginOK") != null) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}

		return map;
	}

	@RequestMapping("/loginPage")
	public String loginPage() {

		return "MemberCenter/loginPage";

	}

	@RequestMapping("/checkAccPwd")
	public @ResponseBody Map<String,Boolean> checkAccPwd(@RequestParam("logAcc")String logAcc , @RequestParam("logPwd")String logPwd ){
		Map<String,Boolean> map = new HashMap<String,Boolean>();
		
		if(loginService.checkIDPassword(logAcc, logPwd)!=null) {
			map.put("loginCheck", true);
		}else{
			map.put("loginCheck", false);
		};
		
		return map;
	}
	
	
}
