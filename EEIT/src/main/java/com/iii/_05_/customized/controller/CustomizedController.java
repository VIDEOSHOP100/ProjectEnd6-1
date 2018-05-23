package com.iii._05_.customized.controller;

import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._05_.customized.model.CustomizedBean;
import com.iii._05_.customized.model.CustomizedService;


@Controller
public class CustomizedController {

	
	@Autowired
	CustomizedService CustomizedService;
	
	
	
	@RequestMapping(value = "/CustomizedControl", method = RequestMethod.POST)
	public String saveCustomized(@ModelAttribute("CustomizedBean") CustomizedBean cb,
			HttpServletRequest request,Map<String, Object> map,
			HttpSession session) {

		String target = (String) session.getAttribute("target");
		target = target.substring(target.lastIndexOf("/EEIT/") + 5);
		
		
		MemberBean memberForm = (MemberBean) session.getAttribute("LoginOK");
		String account = memberForm.getAccount();
		Timestamp customizedTime = new java.sql.Timestamp(System.currentTimeMillis());
		Integer customizedStatus = 1;
		
		MultipartFile photo = cb.getPhoto();
		String originalPhotoName = photo.getOriginalFilename();
		cb.setCustomizedPic(originalPhotoName);
		String extPhoto = originalPhotoName.substring(originalPhotoName.lastIndexOf("."));
		
		cb.setCustomizedStatus(customizedStatus);
		cb.setCustomizedTime(customizedTime);
		cb.setAccount(account);
//		cb.setCustomizedPic(originalPhotoName);
//		 cb = new CustomizedBean(0,  customizedPic, customizedTitle, customizedTime,
//				customizedDesc,customizedStatus,account);

		CustomizedService.saveCustomized(cb ,extPhoto ,photo);

		return "redirect:"+target;
	}
}
