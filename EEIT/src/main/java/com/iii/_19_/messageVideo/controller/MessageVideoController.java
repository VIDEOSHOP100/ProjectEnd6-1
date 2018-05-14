package com.iii._19_.messageVideo.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.iii._19_.messageVideo.model.MessageVideoBean;
import com.iii._19_.messageVideo.model.MessageVideoService;

@Controller
@RequestMapping("MessageVideo")
public class MessageVideoController {
	@Autowired
	MessageVideoService messageVideoService;
	
	
	
	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody Map<String,String> saveMessageVideo(@ModelAttribute("messageVideoBean") MessageVideoBean messageVideoBean) {
		MultipartFile messageImage = messageVideoBean.getMessageVideo();
		String originalImageName = messageImage.getOriginalFilename();
		messageVideoBean.setMessageVideoOriginalName(originalImageName);
		// 取出照片封面圖片副檔名
		String extImage = originalImageName.substring(originalImageName.lastIndexOf("."));
		messageVideoBean.setMessageVideoScore(0);
		messageVideoBean.setMessageVideoStatus("1");
		messageVideoBean.setMessageVideoType("normal");
		messageVideoBean.setMessageVideoPath("");
		messageVideoBean.setMessageVideoName("");
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		messageVideoBean.setMessageVideoUploadDate(now);
		// 照片資料寫入資料庫
		messageVideoBean = messageVideoService.saveMessageVideo(messageVideoBean, extImage, messageImage);
		
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("messageVideoSeqNo", String.valueOf(messageVideoBean.getMessageVideoSeqNo()));
		return map;
	}

	
	@RequestMapping(method = RequestMethod.GET)
	public String selectMessageVideoBySeqNo() {
		return "OK";
	}

	
	@RequestMapping(method = RequestMethod.PUT)
	public String updateMessageVideo() {
		return "OK";
	}

	
	@RequestMapping(method = RequestMethod.DELETE)
	public String deleteMessageVideo() {
		return "OK";
	}
}
