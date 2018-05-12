package com.iii._19_.notificationSystem.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public class NotificationSystemDAOImpl implements NotificationSystemDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<NotificationSystemBean> getReplyCommentVideoByAccount(String account) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM NotificationSystemBean WHERE account = :account",NotificationSystemBean.class).setParameter("account", account).list();
	}

	@Override
	public List<NotificationSystemBean> getAllReplyCommentVideo() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM NotificationSystemBean",NotificationSystemBean.class).list();
		
	}

	@Override
	public NotificationSystemBean getNotificationSystemBySeqNo(Integer notificationSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(NotificationSystemBean.class, notificationSeqNo);
	}

	@Override
	public int saveNotificationSystem(NotificationSystemBean notificationSystemBean) {
		Session sesssion = sessionFactory.getCurrentSession();
		return (int) sesssion.save(notificationSystemBean);
	}

	@Override
	public void updateNotificationSystem(NotificationSystemBean notificationSystemBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(notificationSystemBean);
		
	}

	@Override
	public void deleteNotificationSystem(NotificationSystemBean notificationSystemBean) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(notificationSystemBean);
	}

}

