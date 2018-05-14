package com.iii._19_.messageFile.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class MessageFileDAOImpl implements MessageFileDAO{
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public Integer saveMessageFile(MessageFileBean messageFileBean) {
		Session session = sessionFactory.getCurrentSession();
		return (Integer)session.save(messageFileBean);
		
	}

	@Override
	public MessageFileBean selectMessageFileBySeqNo(Integer messageFileSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM MessageFileBean WHERE messageFileSeqNo = :messageFileSeqNo and messageFileStatus = '1'",MessageFileBean.class).setParameter("messageFileSeqNo", messageFileSeqNo).uniqueResult();
	}

	@Override
	public void updateMessageFile(MessageFileBean messageFileBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(messageFileBean);
	}

	@Override
	public void deleteMessageFile(MessageFileBean messageFileBean) {
		Session session = sessionFactory.getCurrentSession();
		session.update(messageFileBean);
	}

}
