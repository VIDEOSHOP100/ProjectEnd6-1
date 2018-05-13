package com.iii._19_.messageImage.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class MessageImageDAOImpl implements MessageImageDAO{
	
	@Autowired
	SessionFactory sessionFactory;
	

	@Override
	public Integer saveMessageImage(MessageImageBean messageImageBean) {
		Session session = sessionFactory.getCurrentSession();
		return (Integer)session.save(messageImageBean);
	}

	@Override
	public MessageImageBean selectMessageImageBySeqNo(Integer messageImageSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM MessageImageBean WHERE messageImageSeqNo = :messageImageSeqNo",MessageImageBean.class).setParameter("messageImageSeqNo", messageImageSeqNo).uniqueResult();
	}

	@Override
	public void updateMessageImage(MessageImageBean messageImageBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(messageImageBean);
	}

	@Override
	public void deleteMessageImage(MessageImageBean messageImageBean) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(messageImageBean);
	}

}
