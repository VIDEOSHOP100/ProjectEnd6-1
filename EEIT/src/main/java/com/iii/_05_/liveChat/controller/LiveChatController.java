package com.iii._05_.liveChat.controller;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeService;
import com.iii._05_.liveChat.model.LiveChatBean;
import com.iii._05_.liveChat.model.LiveChatService;
import com.iii._19_.messageSystem.model.MessageBean;

@Controller
public class LiveChatController {

	@Autowired
	LiveChatService LiveChatService;
	
	@Autowired
	InputLiveStreamTimeService InputLiveStreamTimeService;
	
	
	@MessageMapping("livechat/{liveStreamSeqNo}")
	@SendTo("/target/livechat/subscription/{liveStreamSeqNo}")
	public LiveChatBean liveStreamChat(LiveChatBean LiveChatBean,
			@DestinationVariable("liveStreamSeqNo") Integer liveStreamSeqNo
//			@DestinationVariable("account") String account
			) {
		System.out.println("----------------------------------------------------------------");
		System.out.println(liveStreamSeqNo);
//		System.out.println(account);
		System.out.println("----------------------------------------------------------------");
		System.out.println("broadcastMessage");
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		LiveChatBean.setLiveChatDate(now);
		LiveChatBean.setLiveChatStatus("1");
		LiveChatBean.setLiveChatType("1");
		LiveChatBean.setLiveStreamSeqNo(liveStreamSeqNo);
//		InputLiveStreamTimeBean getseq = InputLiveStreamTimeService.getLiveStreamsByAccount(account);
//		System.out.println("before = " + LiveChatBean);
		LiveChatService.saveliveChat(LiveChatBean);

//		System.out.println("after = " + messageBean);
		return LiveChatBean;
	}
}
