package com.iii._19_.notificationSystem.model;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii._19_.notificationRecording.model.NotificationRecordingBean;
import com.iii._19_.notificationRecording.model.NotificationRecordingDAO;
import com.iii._19_.subscriptionUploader.model.SubscriptionUploaderBean;
import com.iii._19_.subscriptionUploader.model.SubscriptionUploaderDAO;

@Service
public class NotificationSystemServiceImpl implements NotificationSystemService {

	@Autowired
	NotificationSystemDAO notificationSystemDAO;
	
	@Autowired
	NotificationRecordingDAO notificationRecordingDAO; 
	
	@Autowired
	SubscriptionUploaderDAO subscriptionUploaderDAO;
	
	@Override
	public List<NotificationSystemBean> getReplyCommentVideoByAccount(String account) {
		return notificationSystemDAO.getReplyCommentVideoByAccount(account);
	}

	@Override
	public List<NotificationSystemBean> getAllReplyCommentVideo() {
		return notificationSystemDAO.getAllReplyCommentVideo();
	}

	@Override
	public NotificationSystemBean getNotificationSystemBySeqNo(Integer notificationSeqNo) {
		return notificationSystemDAO.getNotificationSystemBySeqNo(notificationSeqNo);
	}

	@Override
	public int saveNotificationSystem(NotificationSystemBean notificationSystemBean) {
		
		Integer notificationSeqNo = notificationSystemDAO.saveNotificationSystem(notificationSystemBean);
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		List<SubscriptionUploaderBean> SubscriptionUploaderBeanList = subscriptionUploaderDAO.getSubscriptionUploaderByUploaderAccount(notificationSystemBean.getAccount());
		for(SubscriptionUploaderBean subscriptionUploaderBean : SubscriptionUploaderBeanList) {
			NotificationRecordingBean notificationRecordingBean = new NotificationRecordingBean(0, subscriptionUploaderBean.getUploaderAccount(), subscriptionUploaderBean.getAccount(), notificationSeqNo, "unread", now, null,notificationSystemBean.getNotificationArticle());
			Integer notificationRecordingSeqNo = notificationRecordingDAO.saveNotificationRecording(notificationRecordingBean);
		}
		return notificationSeqNo;
		
		
	}

	@Override
	public void updateNotificationSystem(NotificationSystemBean notificationSystemBean) {
		notificationSystemDAO.updateNotificationSystem(notificationSystemBean);
	}

	@Override
	public void deleteNotificationSystem(NotificationSystemBean notificationSystemBean) {
		notificationSystemDAO.deleteNotificationSystem(notificationSystemBean);
	}
	

}
