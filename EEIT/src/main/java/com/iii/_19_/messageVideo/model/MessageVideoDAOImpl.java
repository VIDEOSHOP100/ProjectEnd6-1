package com.iii._19_.messageVideo.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class MessageVideoDAOImpl implements MessageVideoDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public Integer saveMessageVideo(MessageVideoBean messageVideoBean) {
		Session session = sessionFactory.getCurrentSession();
		return (Integer)session.save(messageVideoBean);
	}

	@Override
	public MessageVideoBean selectMessageVideoBySeqNo(Integer messageVideoSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM MessageVideoBean WHERE messageVideoSeqNo = :messageVideoSeqNo and messageVideoStatus = '1'",MessageVideoBean.class).setParameter("messageVideoSeqNo", messageVideoSeqNo).uniqueResult();
	}

	@Override
	public void updateMessageVideo(MessageVideoBean messageVideoBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(messageVideoBean);
	}

	@Override
	public void deleteMessageVideo(MessageVideoBean messageVideoBean) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(messageVideoBean);
	}



}

