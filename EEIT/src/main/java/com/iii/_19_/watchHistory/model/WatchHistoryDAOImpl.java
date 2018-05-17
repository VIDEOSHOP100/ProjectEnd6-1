package com.iii._19_.watchHistory.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class WatchHistoryDAOImpl implements WatchHistoryDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public int saveWatchHistory(WatchHistoryBean watchHistoryBean) {
		Session session = sessionFactory.getCurrentSession();
		return (int) session.save(watchHistoryBean);
	}

	@Override
	public List<WatchHistoryBean> getAccountWatchHistory(String account) {
		Session session = sessionFactory.getCurrentSession();
		return session.createNativeQuery("Select * From watchHistory a Where watchVideoDate = (Select Max(b.watchVideoDate) From watchHistory b Where a.videoSeqNo = b.videoSeqNo) and account = :account and watchHistoryStatus = '1' order by watchVideoDate desc").addEntity(WatchHistoryBean.class).setParameter("account", account).setMaxResults(8).list();
	}

	@Override
	public List<WatchHistoryBean> getAllWatchHistory(String account) {
		Session session = sessionFactory.getCurrentSession();
		return  session.createQuery("FROM WatchHistoryBean WHERE account = :account",WatchHistoryBean.class).setParameter("account", account).list();
	}

	@Override
	public List<WatchHistoryBean> getWatchHistory(String account, Integer videoSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM WatchHistoryBean WHERE account = :account and videoSeqNo = :videoSeqNo",WatchHistoryBean.class).setParameter("account", account).setParameter("videoSeqNo", videoSeqNo).list();
	}

	@Override
	public void updateWatchHistory(WatchHistoryBean watchHistoryBean) {
			Session session = sessionFactory.getCurrentSession();
			session.saveOrUpdate(watchHistoryBean);
	}

	@Override
	public void deleteWatchHistory(WatchHistoryBean watchHistoryBean) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(watchHistoryBean);
	}

	@Override
	public WatchHistoryBean getWatchHistoryBySeqNo(Integer watchHistorySeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(WatchHistoryBean.class, watchHistorySeqNo);
	}

	@Override
	public List<WatchHistoryBean> getWatchHistoryByPageNo(String account, Integer pageNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createNativeQuery("Select * From watchHistory a Where watchVideoDate = (Select Max(b.watchVideoDate) From watchHistory b Where a.videoSeqNo = b.videoSeqNo) and account = :account and watchHistoryStatus = '1' order by watchVideoDate desc").addEntity(WatchHistoryBean.class).setParameter("account", account).setFirstResult(pageNo).setMaxResults(8).list();
	}
}
