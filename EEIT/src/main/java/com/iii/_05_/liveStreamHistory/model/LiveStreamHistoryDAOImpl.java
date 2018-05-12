package com.iii._05_.liveStreamHistory.model;

import java.util.List;
import com.iii._05_.liveStreamHistory.model.LiveStreamHistoryBean;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
@Repository
@Transactional
public class LiveStreamHistoryDAOImpl implements LiveStreamHistoryDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public int saveLiveStreamHistory(LiveStreamHistoryBean LiveStreamHistoryBean) {
		Session session = sessionFactory.getCurrentSession();
		return (int) session.save(LiveStreamHistoryBean);
	}

	@Override
	public List<Integer> getAccountLiveStreamHistory(String account) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("select DISTINCT LiveStreamSeqNo FROM LiveStreamHistoryBean where account = :account and LiveStreamHistoryStatus = '1'",Integer.class).setParameter("account", account).list();
	}

	@Override
	public List<LiveStreamHistoryBean> getAllLiveStreamHistory(String account) {
		Session session = sessionFactory.getCurrentSession();
		return  session.createQuery("FROM LiveStreamHistoryBean WHERE account = :account",LiveStreamHistoryBean.class).setParameter("account", account).list();
	}

	@Override
	public List<LiveStreamHistoryBean> getLiveStreamHistory(String account, Integer LiveStreamHistorySeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM LiveStreamHistoryBean WHERE account = :account and LiveStreamHistorySeqNo = :LiveStreamHistorySeqNo",LiveStreamHistoryBean.class).setParameter("account", account).setParameter("LiveStreamHistorySeqNo", LiveStreamHistorySeqNo).list();
	}

	@Override
	public void updateLiveStreamHistory(LiveStreamHistoryBean LiveStreamHistoryBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(LiveStreamHistoryBean);
	}

	@Override
	public void deleteLiveStreamHistory(LiveStreamHistoryBean LiveStreamHistoryBean) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(LiveStreamHistoryBean);
	}

	@Override
	public LiveStreamHistoryBean getLiveStreamHistoryBySeqNo(Integer LiveStreamHistorySeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(LiveStreamHistoryBean.class, LiveStreamHistorySeqNo);
	}

}
