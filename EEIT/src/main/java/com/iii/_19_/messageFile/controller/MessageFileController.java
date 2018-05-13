package com.iii._19_.messageFile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iii._19_.messageFile.model.MessageFileService;

@Controller
@RequestMapping("MessageFile")
public class MessageFileController {
	@Autowired
	MessageFileService messageFileService;
	
	@RequestMapping(method = RequestMethod.POST)
	public String saveMessageFile() {
		return "OK";
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
