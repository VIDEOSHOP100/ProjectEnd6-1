package com.iii._19_.videoChat.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iii._19_.videoChat.model.VideoChatBean;

@Controller
public class VideoChatController {
	@RequestMapping(value = "videoChat",method = RequestMethod.GET)
	public String getVideoChatRoom() {
		return "videoChat/videoChat";
	}
	
	@MessageMapping("chatRoom/{firstAccount}/{secondAccount}")
	@SendTo("/target/chatRoom/subscription/{firstAccount}/{secondAccount}")
	public VideoChatBean getVideoChatWebSocket(VideoChatBean videoChatBean) {
		System.out.println(">>getVideoChatWebSocket  ========================     " + videoChatBean);
		return videoChatBean; 
	}
}
