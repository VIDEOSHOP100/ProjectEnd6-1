package com.iii._19_.uploaderHomePage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._19_.videoManage.model.VideoBean;
import com.iii._19_.videoManage.model.VideoManageService;

@Controller
@RequestMapping("uploaderHomePage")
public class UploaderHomePageController {
	
	@Autowired
	VideoManageService videoManageService;
	
	@RequestMapping(value="{uploaderAccount}",method = RequestMethod.GET)
	public String getUserLikeVideos(@PathVariable("uploaderAccount") String uploaderAccount, HttpSession session, Map<String,Object> map) {
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		List<VideoBean> videoBeanList= videoManageService.getAllVideoByAccount(account);
		map.put("uploaderVideos", videoBeanList);
		return "uploaderHomePage/uploaderHomePage";
	}
	
	
}
