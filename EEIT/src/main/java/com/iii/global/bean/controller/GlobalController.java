package com.iii.global.bean.controller;

import java.util.Map;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.iii._19_.messageFile.model.MessageFileBean;
import com.iii._19_.messageImage.model.MessageImageBean;

@ControllerAdvice
public class GlobalController {
	@ModelAttribute
	public void getAttribute(Map<String,Object> map) {
		map.put("messageImageBean", new MessageImageBean());
		map.put("messageFileBean", new MessageFileBean());
		
	}
}
