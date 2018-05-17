package com.iii._19_.subscriptionUploader.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._19_.subscriptionUploader.model.SubscriptionUploaderBean;
import com.iii._19_.subscriptionUploader.model.SubscriptionUploaderService;

@Controller
@RequestMapping("subscriptionUploader")
public class SubscriptionUploaderController {

	@Autowired
	SubscriptionUploaderService subscriptionUploaderService;
	
	@RequestMapping(value = "page/{pageNo}" ,method=RequestMethod.GET)
	public @ResponseBody Map<String, Object>  getSubscriptionUploaderByPageNo(HttpSession session,@PathVariable("pageNo") Integer pageNo){
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		List<MemberBean> memberBeanList = subscriptionUploaderService.getSubscriptionUploaderByPageNo(account, pageNo);
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("memberBeanList", memberBeanList);
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
		SubscriptionUploaderBean subscriptionUploaderBean = subscriptionUploaderService.getSubscriptionUploader(account, uploaderAccount);
		subscriptionUploaderBean.setSubscriptionUploaderStatus(subscriptionUploaderStatus);
		subscriptionUploaderService.updateSubscriptionUploader(subscriptionUploaderBean);
		Map<String,String> map = new HashMap<String ,String>();
		map.put("status", "success");
		return map;
	}

	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody String saveSubscriptionUploader(
			@RequestParam("uploaderAccount") String uploaderAccount,
			@RequestParam("subscriptionUploaderStatus") String subscriptionUploaderStatus,
			HttpSession session
			) {
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		SubscriptionUploaderBean subscriptionUploaderBean = subscriptionUploaderService.getSubscriptionUploader(account, uploaderAccount);
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		if(subscriptionUploaderBean == null) {
			subscriptionUploaderBean = new SubscriptionUploaderBean(0, account, uploaderAccount, "subscription", now, 0);
			subscriptionUploaderService.saveSubscriptionUploader(subscriptionUploaderBean);
		}else if(subscriptionUploaderBean != null) {
			subscriptionUploaderBean.setSubscriptionUploaderStatus("subscription");
			subscriptionUploaderService.updateSubscriptionUploader(subscriptionUploaderBean);
		}
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
		List<MemberBean> memberBeanList = subscriptionUploaderService.getAllSubscriptionUploader(account);
		
		map.put("subscriptionUploader", memberBeanList);
		return "subscriptionUploader/subscriptionUploader";
	}

	
	@RequestMapping(value = "JSON/{senderAccount}",method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> getAllSubscriptionUploaderJson(HttpSession session,@PathVariable("senderAccount") String account) {
		List<MemberBean> memberBeanList = subscriptionUploaderService.getAllSubscriptionUploader(account);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("allSubscriptionUploaderBeanList", memberBeanList);
		return map;
	}
}
