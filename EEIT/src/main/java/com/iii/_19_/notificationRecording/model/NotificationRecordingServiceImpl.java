package com.iii._19_.notificationRecording.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NotificationRecordingServiceImpl implements NotificationRecordingService {
	@Autowired
	NotificationRecordingDAO notificationRecordingDAO;
	
	@Override
	public List<NotificationRecordingBean> getNotificationRecordingByAccount(String account) {
		return notificationRecordingDAO.getNotificationRecordingByAccount(account);
	}

	@Override
	public List<NotificationRecordingBean> getAllNotificationRecording() {
		return notificationRecordingDAO.getAllNotificationRecording();
	}

	@Override
	public NotificationRecordingBean getNotificationRecordingBySeqNo(Integer notificationRecordingSeqNo) {
		return notificationRecordingDAO.getNotificationRecordingBySeqNo(notificationRecordingSeqNo);
	}

	@Override
	public int saveNotificationRecording(NotificationRecordingBean notificationRecordingBean) {
		return notificationRecordingDAO.saveNotificationRecording(notificationRecordingBean);
	}

	@Override
	public void updateNotificationRecording(NotificationRecordingBean notificationRecordingBean) {
		notificationRecordingDAO.updateNotificationRecording(notificationRecordingBean);
	}

	@Override
	public void deleteNotificationRecording(NotificationRecordingBean notificationRecordingBean) {
		notificationRecordingDAO.deleteNotificationRecording(notificationRecordingBean);
	}

	@Override
	public List<NotificationRecordingBean> getNotificationRecordingByReceiverAccount(String receiverAccount) {
		return notificationRecordingDAO.getNotificationRecordingByReceiverAccount(receiverAccount);
	}

	

}
