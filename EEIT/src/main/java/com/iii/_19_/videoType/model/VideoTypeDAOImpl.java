package com.iii._19_.videoType.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iii._19_.videoManage.model.VideoBean;

@Repository
@Transactional
public class VideoTypeDAOImpl implements VideoTypeDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	
	@Override
	public List<VideoTypeBean> getAllVideoType() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM VideoTypeBean WHERE sortedVideosStatus = '1'",VideoTypeBean.class).list();
		
	}

	@Override
	public List<VideoBean> getVideoType(String videoType) {
		Session session = sessionFactory.getCurrentSession();
		
		return session.createQuery("FROM VideoBean WHERE videoStatus = '1' and videoType = :videoType",VideoBean.class).setParameter("videoType", videoType).setMaxResults(8).list();
	}

	@Override
	public int saveVideoType(VideoTypeBean videoTypeBean) {
		Session session = sessionFactory.getCurrentSession();
		return (int)session.save(videoTypeBean);
	}

	@Override
	public void updateVideoType(VideoTypeBean videoTypeBean) {
		Session session = sessionFactory.getCurrentSession();
		session.update(videoTypeBean);
	}

	@Override
	public void deleteVideoType(VideoTypeBean videoTypeBean) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(videoTypeBean);
	}

	@Override
	public List<VideoBean> getOneVideoTypeVideos(String videoType) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM VideoBean WHERE videoStatus = '1' and videoType = :videoType",VideoBean.class).setParameter("videoType", videoType).list();
	}

}
