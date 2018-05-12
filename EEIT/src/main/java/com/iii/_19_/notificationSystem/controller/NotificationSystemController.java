package com.iii._19_.notificationSystem.controller;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iii._19_.notificationRecording.model.NotificationRecordingBean;
import com.iii._19_.notificationRecording.model.NotificationRecordingService;
import com.iii._19_.notificationSystem.model.NotificationSystemBean;
import com.iii._19_.notificationSystem.model.NotificationSystemService;

@Controller
public class NotificationSystemController {
	private SimpMessagingTemplate template;

	@Autowired
	public NotificationSystemController(SimpMessagingTemplate template) {
		this.template = template;
	}
	@Autowired
	NotificationSystemService notificationSystemService;
	
	@Autowired
	NotificationRecordingService notificationRecordingService;
	
	@MessageMapping("notificationSystem/{uploaderAccount}")
	@SendTo("/target/notification/subscription/{uploaderAccount}")
	public NotificationSystemBean broadcastNotification(
			NotificationSystemBean notificationSystemBean,
			@DestinationVariable("uploaderAccount") String uploaderAccount) {
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		notificationSystemBean.setNotificationStatus("1");
		notificationSystemBean.setNotificationDate(now);
		int notificationSeqNo = notificationSystemService.saveNotificationSystem(notificationSystemBean);
//		List<NotificationRecordingBean> notificationRecordingBeanList = notificationRecordingService.getNotificationRecordingByAccount(uploaderAccount);
//		for(NotificationRecordingBean notificationRecordingBean :  notificationRecordingBeanList) {
//			notificationRecordingBean.setAccount(account);
//			notificationRecordingBean.setNotificationRecordingStatus("unread");
//			notifi
//			
//		}
		notificationSystemBean.setNotificationSeqNo(notificationSeqNo);
		notificationSystemBean.setAccount(uploaderAccount);
		System.out.println(notificationSystemBean);
		return notificationSystemBean;
	}
	
	@RequestMapping(value = "NotificationSystem/{account}",method=RequestMethod.GET)
	public String getReplyCommentVideoByAccount(@PathVariable("account") String account) {
		List<NotificationSystemBean> notificationSystemBeanList = notificationSystemService.getReplyCommentVideoByAccount(account);
		return "OK";
	}

	@RequestMapping(value = "NotificationSystem",method=RequestMethod.GET)
	public String getAllReplyCommentVideo() {
		List<NotificationSystemBean> notificationSystemBeanList = notificationSystemService.getAllReplyCommentVideo();
		return "OK";
	}

//	@RequestMapping(value = "{notificationSeqNo}",method=RequestMethod.GET)
	public String getNotificationSystemBySeqNo(@PathVariable("notificationSeqNo") Integer notificationSeqNo) {
		NotificationSystemBean notificationSystemBean = notificationSystemService.getNotificationSystemBySeqNo(notificationSeqNo);
		return "OK";
	}

	@RequestMapping(value = "NotificationSystem",method=RequestMethod.POST)
	public String saveNotificationSystem(@ModelAttribute NotificationSystemBean notificationSystemBean) {
		Integer key = notificationSystemService.saveNotificationSystem(notificationSystemBean);
		return "OK";
	}

	@RequestMapping(value = "NotificationSystem",method=RequestMethod.PUT)
	public String updateNotificationSystem(@ModelAttribute NotificationSystemBean notificationSystemBean) {
		notificationSystemService.updateNotificationSystem(notificationSystemBean);
		return "OK";
	}

	@RequestMapping(value = "NotificationSystem/{notificationSeqNo}", method=RequestMethod.DELETE)
	public String deleteNotificationSystem(@PathVariable("notificationSeqNo") Integer notificationSeqNo) {
		NotificationSystemBean notificationSystemBean = notificationSystemService.getNotificationSystemBySeqNo(notificationSeqNo);
		notificationSystemService.deleteNotificationSystem(notificationSystemBean);
		return "OK";
	}

}

