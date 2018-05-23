package com.iii._01_.backVideoReport.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.MemberReport.bean.MemberReportBean;
import com.iii._19_.videoReport.model.VideoReportBean;
import com.iii._19_.videoReport.model.VideoReportService;



@Controller
public class BackVideoReportController {

	
//	------------------------------後台用--------------------------------
	
	@Autowired
	VideoReportService videoReportService;
	
	
	@RequestMapping(value = "/getAllVideoReport" ,method=RequestMethod.GET)
	public @ResponseBody Map<String,Object> getAllVideoReport(){
		
		Map<String,Object> map = new HashMap<String,Object>();
		List<VideoReportBean>list = videoReportService.getAllVideoReport();
		map.put("VideoReportList", list);
		
		return map;
	}
	
	
	@RequestMapping(value = "/getVideoReport/{VideoReportSeqNo}", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> getVideoReport(
			@PathVariable("VideoReportSeqNo") Integer VideoReportSeqNo) {
			Map<String,Object> map = new HashMap<String,Object>();
			
			VideoReportBean vrb = videoReportService.getVideoReportByVideoReportSeqNo(VideoReportSeqNo);
			
			map.put("VideoReport", vrb);
				
		
		return map;
	}

	@RequestMapping(value = "/replyVideoReport" , method=RequestMethod.PUT)
	public @ResponseBody void updateVideoReport(@RequestParam("videoReportReply")String videoReportReply ,  @RequestParam("videoReportSeqNo")Integer videoReportSeqNo) {
		
		VideoReportBean vrb = videoReportService.getVideoReportByVideoReportSeqNo(videoReportSeqNo);
		
		Timestamp replyTime = new java.sql.Timestamp(System.currentTimeMillis());
		vrb.setVideoReportDate(replyTime);
		vrb.setVideoReportReply(videoReportReply);
		vrb.setVideoReportStatus("Finished");
		videoReportService.updateVideoReport(vrb);;
		
	}
	
	
	
	
}
