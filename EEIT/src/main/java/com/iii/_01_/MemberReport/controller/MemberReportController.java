package com.iii._01_.MemberReport.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._01_.MemberReport.bean.MemberReportBean;
import com.iii._01_.MemberReport.service.MemberReportService;

@Controller
public class MemberReportController {

	@Autowired
	MemberReportService memberReportService;

	@RequestMapping(value = "/memberReport", method = RequestMethod.POST)
	public @ResponseBody String saveMemberReport(@RequestParam("accountTo") String accountTo,
			@RequestParam("reportTitle") String reportTitle, @RequestParam("reportContent") String reportContent,
			HttpSession session) {

		MemberBean memberForm = (MemberBean) session.getAttribute("LoginOK");
		String accountFrom = memberForm.getAccount();
		Timestamp reportTime = new java.sql.Timestamp(System.currentTimeMillis());
		String reportStatus = "處理中";
		MemberReportBean mrb = new MemberReportBean(0, accountFrom, accountTo, reportTitle, reportContent, reportTime,
				null, null, reportStatus, null, null);

		memberReportService.saveMemberReportBean(mrb);

		return "";
	}

	@RequestMapping(value = "/getAllMemberReport", method = RequestMethod.GET)
	public @ResponseBody List<MemberReportBean> getAllMemberReport() {
		List<MemberReportBean> list = memberReportService.getAllMemberReport();
		System.out.println("getAllMemberReport here");
		// Map<String,Object> map = new HashMap<String,Object>();
		// map.put("memberReportList", list);

		return list;
	}

	@RequestMapping(value = "/memberReport/{memberReportSeqNo}", method = RequestMethod.GET)
	public @ResponseBody MemberReportBean getMemberReport(
			@PathVariable("memberReportSeqNo") Integer memberReportSeqNo) {
		return memberReportService.getMemberReportBeanBymemberReportSeqNo(memberReportSeqNo);
	}

	@RequestMapping(value = "/memberReport" , method=RequestMethod.PUT)
	public @ResponseBody void updatememberReport(@RequestParam("replyContent")String replyContent ,  @RequestParam("memberReportSeqNo")Integer memberReportSeqNo) {
		
		MemberReportBean mrb = memberReportService.getMemberReportBeanBymemberReportSeqNo(memberReportSeqNo);
		
		Timestamp replyTime = new java.sql.Timestamp(System.currentTimeMillis());
		mrb.setReplyTime(replyTime);
		mrb.setReplyContent(replyContent);
		mrb.setReportStatus("已處理");
		memberReportService.updateMemberReportBean(mrb);
		
	}
	
	
}
