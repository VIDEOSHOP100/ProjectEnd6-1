package com.iii._01_.MyMessage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._01_.MyMessage.bean.MyMessageBean;
import com.iii._01_.MyMessage.service.MyMessageService;

@Controller
public class MyMessageController {

	@Autowired
	MyMessageService myMessageService;
	
	@RequestMapping(value = "/MemberCenter/myMessage" , method=RequestMethod.GET)
	public String myMessagePage(Map<String,List<MyMessageBean>> map , HttpSession session) {
		
			MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
			String account = mb.getAccount();
		
			List<MyMessageBean>list = myMessageService.getAllMyMessage(account);
			
			map.put("MyMessageList", list);
			
		
		
		
		return "/MemberCenter/myMessage";
		
	}
	
	
	@RequestMapping(value= "getMyMessage/{myMessageSeqNo}", method=RequestMethod.GET)
	public @ResponseBody Map<String,Object> getMyMessage(@PathVariable("myMessageSeqNo")Integer myMessageSeqNo){
	
		Map<String,Object>map = new HashMap<String,Object>();
		
		MyMessageBean mmb = myMessageService.getMyMessageByMyMessageSeqNo(myMessageSeqNo);
		map.put("myMessage", mmb);
		
		mmb.setMyMessageStatus("read");
		myMessageService.updateMyMessage(mmb);
		return map;
	}
	
	
	
	
	
}
