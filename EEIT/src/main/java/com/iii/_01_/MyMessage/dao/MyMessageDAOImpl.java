package com.iii._01_.MyMessage.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii._01_.MyMessage.bean.MyMessageBean;

@Repository
public class MyMessageDAOImpl implements MyMessageDAO {

	@Autowired
	SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<MyMessageBean> getAllMyMessageByAccount(String account) {

		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("from MyMessageBean where myMessageTo=:account").setParameter("account", account).list();
	}

	@Override
	public MyMessageBean getMyMessageByMyMessageSeqNo(Integer myMessageSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(MyMessageBean.class,myMessageSeqNo);
	}

	@Override
	public void saveMyMessage(MyMessageBean myMessage) {
		Session session = sessionFactory.getCurrentSession();
		session.save(myMessage);
	}

	@Override
	public void deleteMyMessage(MyMessageBean myMessage) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(myMessage);
	}

	@Override
	public void updateMyMessage(MyMessageBean myMessage) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(myMessage);		
	}

}
