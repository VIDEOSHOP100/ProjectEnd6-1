package com.iii._19_.videoReport.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._19_.videoManage.model.VideoBean;
import com.iii._19_.videoManage.model.VideoManageService;
import com.iii._19_.videoReport.model.VideoReportBean;
import com.iii._19_.videoReport.model.VideoReportService;

@Controller
@RequestMapping("VideoReport")
public class VideoReportController {

	@Autowired
	VideoReportService VideoReportService;
	
	@Autowired
	VideoManageService videoManageService;
	
	@RequestMapping(value = "ban/{videoSeqNo}", method = RequestMethod.GET)
	public @ResponseBody Map<String,String> banVideo(@PathVariable("videoSeqNo") Integer videoSeqNo) {
		VideoBean videoBean = videoManageService.getVideo(videoSeqNo);
		videoBean.setVideoStatus("0");
		videoManageService.updateVideo(videoBean);
		Map<String,String> map = new HashMap<String,String>();
		map.put("Status", "OK");
		return map;
	}
	
	@RequestMapping(method = RequestMethod.PUT)
	public @ResponseBody Map<String,String> updateSubscriptionUploader(
			@RequestParam("uploaderAccount") String uploaderAccount,
			@RequestParam("subscriptionUploaderStatus") String subscriptionUploaderStatus,
			HttpSession session
			) {
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
//		SubscriptionUploaderBean subscriptionUploaderBean = subscriptionUploaderService.getSubscriptionUploader(account, uploaderAccount);
//		subscriptionUploaderBean.setSubscriptionUploaderStatus(subscriptionUploaderStatus);
//		subscriptionUploaderService.updateSubscriptionUploader(subscriptionUploaderBean);
		Map<String,String> map = new HashMap<String ,String>();
		map.put("status", "success");
		return map;
	}

	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody String saveSubscriptionUploader(
			@ModelAttribute("videoReportBean") VideoReportBean videoReportBean,
			HttpSession session
			) {
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = null;
		if(memberBean != null) {
			account = memberBean.getAccount();
		}else if(memberBean == null) {
			account = "visitor";
		}
		videoReportBean.setVideoTitle(videoManageService.getVideo(videoReportBean.getVideoSeqNo()).getVideoTitle());
		videoReportBean.setAccount(account);
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		videoReportBean.setVideoReportDate(now);
		videoReportBean.setVideoReportStatus("pending");
		System.out.println(videoReportBean);
		Integer key = VideoReportService.saveVideoReport(videoReportBean);
		
//		SubscriptionUploaderBean subscriptionUploaderBean = subscriptionUploaderService.getSubscriptionUploader(account, uploaderAccount);
//		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
//		if(subscriptionUploaderBean == null) {
//			subscriptionUploaderBean = new SubscriptionUploaderBean(0, account, uploaderAccount, "subscription", now, 0);
//			subscriptionUploaderService.saveSubscriptionUploader(subscriptionUploaderBean);
//		}else if(subscriptionUploaderBean != null) {
//			subscriptionUploaderBean.setSubscriptionUploaderStatus("subscription");
//			subscriptionUploaderService.updateSubscriptionUploader(subscriptionUploaderBean);
//		}
		return "OK";
	}

	@RequestMapping(value = "{subscriptionUploaderSeqNo}", method = RequestMethod.DELETE)
	public String deleteSubscriptionUploader(
			@PathVariable("subscriptionUploaderSeqNo") Integer subscriptionUplaoderSeqNo) {

		return "OK";
	}

	@RequestMapping(value = "{subscriptionUploaderSeqNo}", method = RequestMethod.GET)
	public String getSubscriptionUploader(
			@PathVariable("subscriptionUploaderSeqNo") Integer subscripitonUploaderSeqNo) {

		return "OK";
	}

	@RequestMapping(method = RequestMethod.GET)
	public String getAllSubscriptionUploader(HttpSession session, Map<String, Object> map) {
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
//		List<MemberBean> memberBeanList = subscriptionUploaderService.getAllSubscriptionUploader(account);
		
//		map.put("subscriptionUploader", memberBeanList);
		return "subscriptionUploader/subscriptionUploader";
	}
}
