package com.iii._19_.messageSystem.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iii._01_.Member.bean.MemberBean;

@Repository
@Transactional
public class MessageSystemDAOImpl implements MessageSystemDAO{
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public Integer saveMessage(MessageBean messageBean) {
		Session session = sessionFactory.getCurrentSession();
		return (Integer) session.save(messageBean);
	}

	@Override
	public MessageBean selectMessageBySeqNo(Integer messageSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(MessageBean.class, messageSeqNo);
		
	}

	@Override
	public List<MessageBean> selectMessageByAccountAndReceiverAccount(String account, String receiverAccount) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM MessageBean WHERE ((account = :account and receiverAccount = :receiverAccount) or (account = :receiverAccount and receiverAccount = :account)) and messageStatus = '1'",MessageBean.class).setParameter("account", account).setParameter("receiverAccount", receiverAccount).list();
	}

	@Override
	public void updateMessage(MessageBean messageBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(messageBean);
	}

}
