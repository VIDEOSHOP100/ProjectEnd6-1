package com.iii._19_.messageFile.controller;

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

import com.iii._19_.messageFile.model.MessageFileBean;
import com.iii._19_.messageFile.model.MessageFileService;

@Controller
@RequestMapping("MessageFile")
public class MessageFileController {
	@Autowired
	MessageFileService messageFileService;
	
	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody Map<String,String> saveMessageFile(@ModelAttribute("messageFileBean") MessageFileBean messageFileBean) {
		MultipartFile messageFile = messageFileBean.getMessageFile();
		String originalFileName = messageFile.getOriginalFilename();
		messageFileBean.setMessageFileName(originalFileName);
		// 取出照片封面圖片副檔名
		String extImage = originalFileName.substring(originalFileName.lastIndexOf("."));
		messageFileBean.setMessageFileScore(0);
		messageFileBean.setMessageFileStatus("1");
		messageFileBean.setMessageFileType("normal");
		messageFileBean.setMessageFileOriginalName("");
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		messageFileBean.setMessageFileUploadDate(now);
		messageFileBean.setMessageFilePath("");
		// 照片資料寫入資料庫
		messageFileBean = messageFileService.saveMessageFile(messageFileBean, extImage, messageFile);
		
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("messageFileSeqNo", String.valueOf(messageFileBean.getMessageFileSeqNo()));
		map.put("messageFileName", String.valueOf(messageFileBean.getMessageFileName()));
		return map;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String selectMessageFileBySeqNo() {
		return "OK";
	}

	@RequestMapping(method = RequestMethod.PUT)
	public String updateMessageFile() {
		return "OK";
	}

	@RequestMapping(method = RequestMethod.DELETE)
	public String deleteMessageFile() {
		return "OK";
	}
}
