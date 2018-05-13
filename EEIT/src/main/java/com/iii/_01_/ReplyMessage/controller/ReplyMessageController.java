package com.iii._01_.ReplyMessage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReplyMessageController {
	
	@RequestMapping("/backstage/replyMessage")
	public String replyMessage() {
		return "/backstage/replyMessage";
	}
	
}
