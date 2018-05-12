package com.iii._01_.Member.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._01_.Member.service.RegisterService;

@Controller
public class RegisterController {

	@Autowired
	RegisterService registerService;

	// @RequestMapping(value = "/register", method = RequestMethod.GET)
	// public String go() {
	// System.out.println(":3");
	// return "top";
	// }

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@ModelAttribute("MemberBean") MemberBean mb, BindingResult result,
			HttpServletRequest request) throws SQLException {

		System.out.println("進入/register");

		HttpSession session = request.getSession();
		String target = (String) session.getAttribute("target");
		target = target.substring(target.lastIndexOf("/EEIT/") + 5);

		Map<String, String> registerErrorMessage = new HashMap<String, String>();
		session.setAttribute("registerErrorMap", registerErrorMessage);

		if (registerService.checkAccountDuplicate(mb.getAccount()) != true) {
			MultipartFile photo = mb.getPhoto();
			String originalPhotoName = photo.getOriginalFilename();
			mb.setPhotoName(originalPhotoName);
			String extPhoto = originalPhotoName.substring(originalPhotoName.lastIndexOf("."));

			registerService.saveMember(mb, extPhoto, photo);
			return "redirect:Register/registerSuccess";
			// 有異常時
		} else {
			registerErrorMessage.put("Duplicate", "帳號重複");
		}
		return "redirect:" + target;
	}

	@RequestMapping("Register/registerSuccess")
	public String registerSuccess() {
		return "Register/registerSuccess";
	}

	@RequestMapping("/checkAccountDuplicate")
	public @ResponseBody Map<String, Boolean> checkAccountDuplicate(@RequestParam("account") String account) {

		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", registerService.checkAccountDuplicate(account));
		return map;
	}
}
