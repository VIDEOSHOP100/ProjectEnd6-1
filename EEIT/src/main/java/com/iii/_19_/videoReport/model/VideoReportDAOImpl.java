package com.iii._19_.videoReport.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public class VideoReportDAOImpl implements VideoReportDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<VideoReportBean> getVideoReportByAccountAndVideoSeqNo(String account, Integer videoSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM VideoReportBean WHERE account = :account and videoSeqNo",VideoReportBean.class).setParameter("account", account).setParameter("videoSeqNo",videoSeqNo).list();
	}

	@Override
	public List<VideoReportBean> getAllVideoReport() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM VideoReportBean",VideoReportBean.class).list();
	}

	@Override
	public List<VideoReportBean> getAllPendingVideoReport() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM VideoReportBean WHERE videoReportStatus  = 'pending",VideoReportBean.class).list();
	}

	@Override
	public List<VideoReportBean> getAllVideoReport(String account) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM VideoReportBean WHERE account = :account",VideoReportBean.class).setParameter("account", account).list();
	}

	@Override
	public Integer saveVideoReport(VideoReportBean videoReportBean) {
		Session session = sessionFactory.getCurrentSession();
		return (Integer)session.save(videoReportBean);
	}

	@Override
	public void updateVideoReport(VideoReportBean videoReportBean) {
		Session session = sessionFactory.getCurrentSession();
		session.update(videoReportBean);
	}

	@Override
	public void deleteVideoReport(VideoReportBean videoReportBean) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(videoReportBean);
	}

}
