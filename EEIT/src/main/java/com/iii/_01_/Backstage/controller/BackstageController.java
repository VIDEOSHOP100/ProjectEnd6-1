package com.iii._01_.Backstage.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iii._01_.Manager.bean.ManagerBean;
import com.iii._01_.Member.bean.MemberBean;
import com.iii._16_.ProductHot.model.ProductHotBean;

@Controller
@RequestMapping("/backstage")
public class BackstageController {
	@ModelAttribute//商城管理使用的bean;
	public void getHotBean(Map<String, Object> map) {
		ProductHotBean hotbean = new ProductHotBean();
		map.put("ProductHotBean", hotbean);
	}
	@ModelAttribute//商城管理使用的bean for del;
	public void delHotBean(Map<String, Object> map) {
		ProductHotBean hotbean = new ProductHotBean();
		map.put("DelHotBean", hotbean);
	}
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
