package com.iii._01_.Manager.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.Manager.bean.ManagerBean;
import com.iii._01_.Manager.service.ManagerService;
import com.iii._01_.Member.bean.MemberBean;
import com.iii._01_.Member.service.UpdateService;

@Controller
public class ManagerController {

	@Autowired
	ManagerService managerService;

	@Autowired
	UpdateService updateService;
	
//	@ModelAttribute
//	public ManagerBean getManagerBean() {
//		System.out.println("ManagerBean Here");
//		return new ManagerBean();
//	}
	
	@RequestMapping(value = "/managerLogin", method = RequestMethod.GET)
	public String getManagerLogin(Model model) {
		model.addAttribute("ManagerBean" , new ManagerBean());
		return "manager/managerLoginPage";
	}

	@RequestMapping(value = "managerLogin", method = RequestMethod.POST)
	public String addManagerLogin(@ModelAttribute("ManagerBean") ManagerBean mb, HttpSession session) {

		ManagerBean managerBean = managerService.managerLoginCheck(mb.getManagerId(), mb.getManagerPwd());
		Map<String, String> map = new HashMap<String, String>();
		session.setAttribute("ManaError", map);
		if (managerBean != null) {
			session.setAttribute("ManagerLoginOK", managerBean);
			
			
			MemberBean memb = (MemberBean) session.getAttribute("LoginOK");
			if(memb!=null) {
				session.removeAttribute("LoginOK");
			}
			
			return "redirect:backstage";
		} else {
			map.put("error", "帳號或密碼錯誤");
			return "manager/managerLoginPage";
		}

	}
	
	@RequestMapping("/managerLogout")
	public String managerLogout(HttpSession session) {
		session.removeAttribute("ManagerLoginOK");
		return "redirect:" + "/";
	}
	
	
	@RequestMapping(value = "/banMember" ,method=RequestMethod.PUT)
	public @ResponseBody void banMember(@RequestParam("account")String account) throws SQLException{
		
		MemberBean mb = updateService.getMemberBeanByAccount(account);
		
		if(mb.getBan()==false) {
			mb.setBan(true);
		}else {
			mb.setBan(false);
		}
		
		updateService.updateMemberWithoutPhoto(mb);
		
		
	}
	
	
}
