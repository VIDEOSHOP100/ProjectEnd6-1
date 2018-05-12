package com.iii._19_.notificationRecording.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class NotificationRecordingDAOImpl implements NotificationRecordingDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public NotificationRecordingDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public List<NotificationRecordingBean> getNotificationRecordingByAccount(String account) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM NotificationRecordingBean WHERE account = :account",NotificationRecordingBean.class).setParameter("account", account).list();
	}

	@Override
	public List<NotificationRecordingBean> getAllNotificationRecording() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM NotificationRecordingBean",NotificationRecordingBean.class).list();
	}

	@Override
	public NotificationRecordingBean getNotificationRecordingBySeqNo(Integer notificationRecordingSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(NotificationRecordingBean.class, notificationRecordingSeqNo);
	}

	@Override
	public int saveNotificationRecording(NotificationRecordingBean notificationRecordingBean) {
		Session session = sessionFactory.getCurrentSession();
		return (int)session.save(notificationRecordingBean);
	}

	@Override
	public void updateNotificationRecording(NotificationRecordingBean notificationRecordingBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(notificationRecordingBean);
	}

	@Override
	public void deleteNotificationRecording(NotificationRecordingBean notificationRecordingBean) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(notificationRecordingBean);
	}

	@Override
	public List<NotificationRecordingBean> getNotificationRecordingByReceiverAccount(String receiverAccount) {
		Session session = sessionFactory.getCurrentSession();
		return  session.createQuery("FROM NotificationRecordingBean WHERE receiverAccount = :receiverAccount order by notificationDate desc",NotificationRecordingBean.class).setMaxResults(8).setParameter("receiverAccount", receiverAccount).list();
	}

}