package com.iii._19_.messageImage.controller;

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

import com.iii._19_.messageImage.model.MessageImageBean;
import com.iii._19_.messageImage.model.MessageImageService;




@Controller
@RequestMapping("MessageImage")
public class MessageImageController {
	
	@Autowired
	MessageImageService messageImageService;
	
	
	
	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody Map<String,String> saveMessageImage(@ModelAttribute("messageImageBean") MessageImageBean messageImageBean) {
		MultipartFile messageImage = messageImageBean.getMessageImage();
		String originalImageName = messageImage.getOriginalFilename();
		messageImageBean.setMessageImageFileName(originalImageName);
		// 取出照片封面圖片副檔名
		String extImage = originalImageName.substring(originalImageName.lastIndexOf("."));
		messageImageBean.setMessageImageScore(0);
		messageImageBean.setMessageImageStatus("1");
		messageImageBean.setMessageImageType("normal");
		messageImageBean.setMessageImageFilePath("");
		messageImageBean.setMessageImageName("");
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		messageImageBean.setMessageImageUploadDate(now);
		// 照片資料寫入資料庫
		messageImageBean = messageImageService.saveMessageImage(messageImageBean, extImage, messageImage);
		
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("messageImageSeqNo", String.valueOf(messageImageBean.getMessageImageSeqNo()));
		return map;
	}

	
	@RequestMapping(method = RequestMethod.GET)
	public String selectMessageImageBySeqNo() {
		return "OK";
	}

	
	@RequestMapping(method = RequestMethod.PUT)
	public String updateMessageImage() {
		return "OK";
	}

	
	@RequestMapping(method = RequestMethod.DELETE)
	public String deleteMessageImage() {
		return "OK";
	}
}
