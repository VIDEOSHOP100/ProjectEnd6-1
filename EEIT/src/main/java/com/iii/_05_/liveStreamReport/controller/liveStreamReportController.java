package com.iii._05_.liveStreamReport.controller;

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
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeService;
import com.iii._05_.liveStreamReport.model.liveStreamReportBean;
import com.iii._05_.liveStreamReport.model.liveStreamReportService;




@Controller
public class liveStreamReportController {
	
@Autowired
liveStreamReportService liveStreamReportService;

@Autowired
InputLiveStreamTimeService InputLiveStreamTimeService;
	//空白檢舉表
@RequestMapping(value = "/LiveStreamReport", method = RequestMethod.POST)
public @ResponseBody String saveLiveStreamReport(
		@RequestParam("accountTo") String accountTo,
		@RequestParam("reportTitle") String reportTitle, 
		@RequestParam("reportContent") String reportContent,
		@RequestParam("reportType") Integer reportType,
		HttpSession session) {

	MemberBean memberForm = (MemberBean) session.getAttribute("LoginOK");
	String accountFrom = memberForm.getAccount();
	Timestamp reportTime = new java.sql.Timestamp(System.currentTimeMillis());
	String reportStatus = "處理中";
	liveStreamReportBean lrb = new liveStreamReportBean(0, accountFrom, accountTo, reportTitle, reportContent, reportTime,
			reportStatus, null, null,reportType);

	liveStreamReportService.saveliveStreamReport(lrb);

	return "";
}
	
	//傳送所有檢舉
	@RequestMapping(value = "/getAllLiveStreamReport", method = RequestMethod.GET)
	public @ResponseBody List<liveStreamReportBean> getAllReport() {
		List<liveStreamReportBean> list = liveStreamReportService.getAllReport();
		
		// Map<String,Object> map = new HashMap<String,Object>();
		// map.put("memberReportList", list);

		return list;
	}
	//傳SEQNO回來拿BEAN資料
	@RequestMapping(value = "/liveStreamReport/{liveStreamReportSeqNo}", method = RequestMethod.GET)
	public @ResponseBody liveStreamReportBean getliveStreamReport(
			@PathVariable("liveStreamReportSeqNo") Integer liveStreamReportSeqNo) {
		return liveStreamReportService.getOneReportBySeqNo(liveStreamReportSeqNo);
	}
	
	//回復檢舉
	@RequestMapping(value = "/replyliveStreamReport" , method=RequestMethod.PUT)
	public @ResponseBody void updateliveSteamReport(@RequestParam("replyContent")String replyContent ,  @RequestParam("liveStreamReportSeqNo")Integer liveStreamReportSeqNo) {
		
		liveStreamReportBean lrb = liveStreamReportService.getOneReportBySeqNo(liveStreamReportSeqNo);
		
		Timestamp replyTime = new java.sql.Timestamp(System.currentTimeMillis());
		lrb.setReplyTime(replyTime);
		lrb.setReplyContent(replyContent);
		lrb.setReportStatus("已處理");
		liveStreamReportService.updateliveStreamReport(lrb);
		
	}
}
