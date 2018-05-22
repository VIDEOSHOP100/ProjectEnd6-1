package com.iii._01_.Backstage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iii._01_.Manager.bean.ManagerBean;
import com.iii._01_.Member.bean.MemberBean;

@Controller
@RequestMapping("/backstage")
public class BackstageController {

	@RequestMapping("")
	public String backstage(HttpSession session, Model model) {

		ManagerBean mb = (ManagerBean) session.getAttribute("ManagerLoginOK");

		if (mb != null) {
			return "backstage/backstage";
		} else {

			
			return "redirect:managerLogin";
		}

	}

}
