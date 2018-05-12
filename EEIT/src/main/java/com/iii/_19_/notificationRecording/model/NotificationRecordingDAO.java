package com.iii._19_.notificationRecording.model;

import java.util.List;

public interface NotificationRecordingDAO {
	public List<NotificationRecordingBean> getNotificationRecordingByAccount(String account);
	
	public List<NotificationRecordingBean> getNotificationRecordingByReceiverAccount(String receiverAccount);
	
	public List<NotificationRecordingBean> getAllNotificationRecording();
	
	public NotificationRecordingBean getNotificationRecordingBySeqNo(Integer notificationRecordingSeqNo);
	
	public int saveNotificationRecording(NotificationRecordingBean notificationRecordingBean);
	
	public void updateNotificationRecording(NotificationRecordingBean notificationRecordingBean);
	
	public void deleteNotificationRecording(NotificationRecordingBean notificationRecordingBean);
}
