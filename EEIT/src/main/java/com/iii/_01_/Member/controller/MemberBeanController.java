package com.iii._01_.Member.controller;

import java.util.Map;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.iii._01_.Member.bean.MemberBean;
//所有頁面都要用到的MemberBean
@ControllerAdvice
public class MemberBeanController {
	
	@ModelAttribute("MemberBean")
	public void getMemberBean(Map<String,Object> map) {
		System.out.println("MemberBean here");
//		return new MemberBean();
		map.put("MemberBean", new MemberBean());
	}
	
}
