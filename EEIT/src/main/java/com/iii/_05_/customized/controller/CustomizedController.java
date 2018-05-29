package com.iii._05_.customized.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.iii._01_.AdviceReport.bean.AdviceReportBean;
import com.iii._01_.Member.bean.MemberBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeService;
import com.iii._05_.customized.model.CustomizedBean;
import com.iii._05_.customized.model.CustomizedService;


@Controller
public class CustomizedController {

	
	@Autowired
	CustomizedService CustomizedService;
	@Autowired
	InputLiveStreamTimeService InputLiveStreamTimeService;
	
	

	
	@RequestMapping(value = "/CustomizedGet/{account}", method = RequestMethod.GET)
	public @ResponseBody List<CustomizedBean> getAllAdviceReport(@PathVariable("account") String account) {

		List<CustomizedBean> list = CustomizedService.getAllByAccount(account);

		return list;
	}
	
	
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
		
		InputLiveStreamTimeBean InputLiveStreamTimeBean= InputLiveStreamTimeService.getLiveStreamsByAccount(account);
		
		Integer Seq = InputLiveStreamTimeBean.getLiveStreamSeqNo();
		
		MultipartFile photo = cb.getPhoto();
		String originalPhotoName = photo.getOriginalFilename();
		cb.setCustomizedPic(originalPhotoName);
		String extPhoto = originalPhotoName.substring(originalPhotoName.lastIndexOf("."));
		
		cb.setCustomizedStatus(customizedStatus);
		cb.setCustomizedTime(customizedTime);
		cb.setAccount(account);
		cb.setSortNum(0);
//		cb.setCustomizedPic(originalPhotoName);
//		 cb = new CustomizedBean(0,  customizedPic, customizedTitle, customizedTime,
//				customizedDesc,customizedStatus,account);

		CustomizedService.saveCustomized(cb ,extPhoto ,photo);

		return "redirect:"+"/LiveStream/"+Seq;
	}
	
//	@RequestMapping(value = "/sortable",method = RequestMethod.PUT)
//	public @ResponseBody Map<String,String> updateLiveStream(
////			@RequestParam("liveStreamSeqNo") Integer liveStreamSeqNo,
////			@RequestParam("LiveStreamHistorySeqNo") Integer LiveStreamHistorySeqNo,
//			@RequestParam("sortNum") Integer[] sortNum,
//			HttpSession session
//			) {
//		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
//		String account = memberBean.getAccount();
//		
//		System.out.println("=============================================");
//		System.out.println(sortNum);
//		
//		Map<String, String> map = new HashMap<String,String>();
//		map.put("status", "success");
//		return map;
//	}
	
	
	
	
	
	
}
