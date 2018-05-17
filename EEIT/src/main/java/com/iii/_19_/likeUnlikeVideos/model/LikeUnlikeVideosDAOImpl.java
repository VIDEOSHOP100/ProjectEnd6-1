package com.iii._19_.likeUnlikeVideos.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iii._19_.videoManage.model.VideoBean;

@Repository
@Transactional
public class LikeUnlikeVideosDAOImpl implements LikeUnlikeVideosDAO {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public LikeUnlikeVideosBean getLikeUnlikeVideos(String account, Integer videoSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM LikeUnlikeVideosBean WHERE account = :account and videoSeqNo = :videoSeqNo",LikeUnlikeVideosBean.class).setParameter("account", account).setParameter("videoSeqNo", videoSeqNo).uniqueResult();
	}

	@Override
	public List<VideoBean> getUserAllLikeVideos(String account) {
		Session session = sessionFactory.getCurrentSession();
		return session.createNativeQuery("select v.videoSeqNo" + 
				"      ,v.VideoFileName" + 
				"      ,v.account" + 
				"      ,v.videoDescription" + 
				"      ,v.videoFilePath" + 
				"      ,v.videoImageFileName" + 
				"      ,v.videoImageFilePath" + 
				"      ,v.videoLikes" + 
				"      ,v.videoStatus" + 
				"      ,v.videoTitle" + 
				"      ,v.videoType" + 
				"      ,v.videoUnlikes" + 
				"      ,v.videoUploadDate" + 
				"      ,v.videoUplodaerListType" + 
				"      ,v.videoViews FROM LikeUnlikeVideos l join Video v on l.videoSeqNo = v.videoSeqNo where LikeUnlikeVideosStatus = 'like' and l.account = :account").setParameter("account", account).setMaxResults(18).addEntity("v",VideoBean.class).list();
		
	}

	@Override
	public int saveLikeUnlikeVideos(LikeUnlikeVideosBean likeUnlikeVideosBean) {
		Session session = sessionFactory.getCurrentSession();
		return (int)session.save(likeUnlikeVideosBean);
	}

	@Override
	public void updateLikeUnlikeVideos(LikeUnlikeVideosBean likeUnlikeVideosBean) {
		Session session = sessionFactory.getCurrentSession();
		session.update(likeUnlikeVideosBean);
	}

	@Override
	public void deleteLikeUnlikeVideos(LikeUnlikeVideosBean likeUnlikeVideosBean) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(likeUnlikeVideosBean);
	}
	
	
}
