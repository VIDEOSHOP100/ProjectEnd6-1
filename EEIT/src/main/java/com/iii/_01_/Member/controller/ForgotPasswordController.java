package com.iii._01_.Member.controller;

import java.sql.SQLException;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.iii._01_.Member.service.ForgotPasswordService;
import com.iii._01_.Member.service.LoginService;

@Controller
public class ForgotPasswordController {

	@Autowired
	LoginService loginService;

	@Autowired
	ForgotPasswordService forgotPasswordService;

	
	
	@RequestMapping(value = "MemberCenter/forgotPassword", method = RequestMethod.GET)
	public String forgotPassword() {
		return "/MemberCenter/forgotPassword";
	}

	
	
	@RequestMapping(value = "MemberCenter/forgotPassword", method = RequestMethod.POST)
	public String resetPassword(@RequestParam("email") String email, Model model) throws SQLException, MessagingException {

		forgotPasswordService.updateNsendNewPassword(email);

		model.addAttribute("message", "新的密碼已經寄送到您的email內，登入後請盡速修改");

		return "/MemberCenter/sendNewPassword";
	}

}
