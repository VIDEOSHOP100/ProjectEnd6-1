package com.iii._01_.AdviceReport.controller;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.AdviceReport.bean.AdviceReportBean;
import com.iii._01_.AdviceReport.service.AdviceReportService;
import com.iii._01_.Member.bean.MemberBean;
import com.iii._01_.MemberReport.bean.MemberReportBean;
import com.iii._01_.MyMessage.bean.MyMessageBean;
import com.iii._01_.MyMessage.service.MyMessageService;

@Controller
public class AdviceReportController {

	@Autowired
	AdviceReportService adviceReportService;
	
	@Autowired
	MyMessageService myMessageService;
	
	
	@RequestMapping(value= "/MemberCenter/adviceReport" , method=RequestMethod.GET)
	public String getAdviceReport(Map<String,AdviceReportBean>map) {
		map.put("AdviceReportBean",new AdviceReportBean());
		return "MemberCenter/adviceReport";
	}
	
	@RequestMapping(value= "/MemberCenter/adviceReport" , method=RequestMethod.POST)
	public String saveAdviceReport(@ModelAttribute("AdviceReportBean")AdviceReportBean adviceReportBean ,HttpSession session) {
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		String account = mb.getAccount();
		Timestamp adviceTime = new java.sql.Timestamp(System.currentTimeMillis());
			
		adviceReportBean.setAdviceTime(adviceTime);
		adviceReportBean.setAccount(account);
		adviceReportBean.setAdviceStatus("處理中");
		
		adviceReportService.saveAdviceReport(adviceReportBean);
		
		return "redirect:/MemberCenter/adviceReported";
	}
		
	@RequestMapping(value="/MemberCenter/adviceReported",method=RequestMethod.GET )
	public String adviceReported () {
		
		return "/MemberCenter/adviceReported";
	}
	
	@RequestMapping(value = "/getAllAdviceReport", method = RequestMethod.GET)
	public @ResponseBody List<AdviceReportBean> getAllAdviceReport() {
		List<AdviceReportBean> list = adviceReportService.getAllAdviceReport();
		System.out.println("getAllAdviceReport here");
		// Map<String,Object> map = new HashMap<String,Object>();
		// map.put("memberReportList", list);

		return list;
	}
	
	@RequestMapping(value = "/adviceReport/{adviceReportSeqNo}", method = RequestMethod.GET)
	public @ResponseBody AdviceReportBean getadviceReport(
			@PathVariable("adviceReportSeqNo") Integer adviceReportSeqNo) {
		return adviceReportService.getAdviceReportByAdviceReportSeqNo(adviceReportSeqNo);
	}
	
	
	
	@RequestMapping(value = "/adviceReport" , method=RequestMethod.PUT)
	public @ResponseBody void updateadviceReport(@RequestParam("replyContent")String replyContent ,  @RequestParam("adviceReportSeqNo")Integer adviceReportSeqNo ,@RequestParam("account")String account) {
		
		AdviceReportBean arb = adviceReportService.getAdviceReportByAdviceReportSeqNo(adviceReportSeqNo);
		
		Timestamp replyTime = new java.sql.Timestamp(System.currentTimeMillis());
		arb.setReplyTime(replyTime);
		arb.setReplyContent(replyContent);
		arb.setAdviceStatus("已處理");
		adviceReportService.updateAdviceReport(arb);
		
		
		MyMessageBean mmb = new MyMessageBean();
		mmb.setMyMessageFrom("Manager");
		mmb.setMyMessageStatus("unread");
		mmb.setMyMessageTime(replyTime);
		mmb.setMyMessageTo(account);
		mmb.setMyMessageContent(replyContent);
		mmb.setMyMessageTitle("意見回覆");
		
		myMessageService.saveMyMessage(mmb);
				
	}
	
	
	
	
	
}
