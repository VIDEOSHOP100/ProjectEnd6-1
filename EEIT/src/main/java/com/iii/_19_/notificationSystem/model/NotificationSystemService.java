package com.iii._19_.notificationSystem.model;

import java.util.List;

public interface NotificationSystemService {
	public List<NotificationSystemBean> getReplyCommentVideoByAccount(String account);
	
	public List<NotificationSystemBean> getAllReplyCommentVideo();
	
	public NotificationSystemBean getNotificationSystemBySeqNo(Integer notificationSeqNo);
	
	public int saveNotificationSystem(NotificationSystemBean notificationSystemBean);
	
	public void updateNotificationSystem(NotificationSystemBean notificationSystemBean);
	
	public void deleteNotificationSystem(NotificationSystemBean notificationSystemBean);
}
