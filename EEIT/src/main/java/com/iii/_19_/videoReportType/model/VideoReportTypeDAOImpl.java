package com.iii._19_.videoReportType.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public class VideoReportTypeDAOImpl implements VideoReportTypeDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<VideoReportTypeBean> getAllVideoReportType() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM VideoReportTypeBean",VideoReportTypeBean.class).list();
	}

	@Override
	public Integer saveVideoReportType(VideoReportTypeBean videoReportTypeBean) {
		Session session = sessionFactory.getCurrentSession();
		return (Integer) session.save(videoReportTypeBean);
	}

	@Override
	public void updateVideoReportType(VideoReportTypeBean videoReportTypeBean) {
		Session session = sessionFactory.getCurrentSession();
		session.update(videoReportTypeBean);
	}

	@Override
	public void deleteVideoReportType(VideoReportTypeBean videoReportTypeBean) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(videoReportTypeBean);
	}

}

