package com.iii._19_.watchLaterVideo.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iii._19_.videoManage.model.VideoBean;


@Repository
@Transactional
public class WatchLaterVideoDAOImpl implements WatchLaterVideoDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public int saveWatchLaterVideo(WatchLaterVideoBean watchLaterVideoBean) {
		Session session = sessionFactory.getCurrentSession();
		return (int) session.save(watchLaterVideoBean);
	}

	@Override
	public void updateWatchLaterVideo(WatchLaterVideoBean watchLaterVideoBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(watchLaterVideoBean);
	}

	@Override
	public void deleteWatchLaterVideo(WatchLaterVideoBean watchLaterVideoBean) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(watchLaterVideoBean);
	}

	@Override
	public WatchLaterVideoBean getWatchLaterVideo(String account, Integer videoSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		
		return session.createQuery("FROM WatchLaterVideoBean WHERE account = :account and videoSeqNo = :videoSeqNo",WatchLaterVideoBean.class).setParameter("account", account).setParameter("videoSeqNo", videoSeqNo).uniqueResult();
		
	}

	@Override
	public List<VideoBean> getWatchLaterVideoByAccount(String account) {
		Session session = sessionFactory.getCurrentSession();
		return session.createNativeQuery("  select  v.videoSeqNo" + 
				"      ,v.videoTitle" + 
				"      ,v.videoDescription" + 
				"      ,v.videoType" + 
				"      ,v.videoUplodaerListType" + 
				"      ,v.videoUploadDate" + 
				"      ,v.videoLikes" + 
				"      ,v.videoUnlikes" + 
				"      ,v.videoViews" + 
				"      ,v.videoStatus" + 
				"      ,v.videoFilePath" + 
				"      ,v.VideoFileName" + 
				"      ,v.videoImageFilePath" + 
				"      ,v.videoImageFileName" + 
				"      ,v.account from WatchLaterVideo w join Video v on w.videoSeqNo = v.videoSeqNo where w.watchLaterVideosStatus = '1' and w.account = :account order by w.watchLaterVideoDate desc ").setParameter("account", account).addEntity("v",VideoBean.class).list();
		
	}

	@Override
	public List<WatchLaterVideoBean> getAllWatchLaterVideo() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM WatchLaterVideoBean",WatchLaterVideoBean.class).list();
	}

	@Override
	public WatchLaterVideoBean getWatchLaterVideoBySeqNo(Integer watchLaterVideoSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(WatchLaterVideoBean.class, watchLaterVideoSeqNo);
				
	}

}
