package com.iii._05_.liveChat.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;



@Repository
@Transactional
public class LiveChatDAOImpl implements LiveChatDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public Integer saveliveChat(LiveChatBean LiveChatBean) {
		Session session = sessionFactory.getCurrentSession();
		return (Integer) session.save(LiveChatBean);
	}

	@Override
	public LiveChatBean selectLiveChatBySeqNo(Integer LiveStreamSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(LiveChatBean.class,LiveStreamSeqNo);
	}

//	@Override
//	public List<LiveChatBean> selectMessageByAccountAndLiveStreamSeqNo(String account, Integer LiveStreamSeqNo) {
//		Session session = sessionFactory.getCurrentSession();
//		return session.createQuery("FROM LiveChatBean WHERE ((account = :account and LiveStreamSeqNo = :LiveStreamSeqNo) or (account = :LiveStreamSeqNo and receiverAccount = :account)) and messageStatus = '1'",MessageBean.class).setParameter("account", account).setParameter("receiverAccount", receiverAccount).list();
//	}

	@Override
	public void updateLiveChat(LiveChatBean LiveChatBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(LiveChatBean);
	}

}
