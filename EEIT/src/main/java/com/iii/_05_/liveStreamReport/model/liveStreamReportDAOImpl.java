package com.iii._05_.liveStreamReport.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class liveStreamReportDAOImpl implements liveStreamReportDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<liveStreamReportBean> getAllReport() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM liveStreamReportBean", liveStreamReportBean.class).list();
	}

	@Override
	public List<liveStreamReportBean> getAllReportBySeqNo(Integer liveStreamReportSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM liveStreamReportBean WHERE liveStreamReportSeqNo = :liveStreamReportSeqNo", liveStreamReportBean.class).setParameter("liveStreamReportSeqNo", liveStreamReportSeqNo)
				.list();
	}

	@Override
	public liveStreamReportBean getOneReportBySeqNo(Integer liveStreamReportSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM liveStreamReportBean WHERE liveStreamReportSeqNo = :liveStreamReportSeqNo", liveStreamReportBean.class).setParameter("liveStreamReportSeqNo", liveStreamReportSeqNo).uniqueResult();
	}

	@Override
	public List<liveStreamReportBean> getReportByToAccount(String accountTo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM liveStreamReportBean WHERE accountTo = :accountTo", liveStreamReportBean.class).setParameter("accountTo", accountTo)
				.list();
	}

	@Override
	public List<liveStreamReportBean> getReportByFromAccount(String accountFrom) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM liveStreamReportBean WHERE accountFrom = :accountFrom", liveStreamReportBean.class).setParameter("accountFrom", accountFrom)
				.list();
	}

	@Override
	public int saveliveStreamReport(liveStreamReportBean liveStreamReportBean) {
		Session session = sessionFactory.getCurrentSession();
		return (int) session.save(liveStreamReportBean);
	}

	@Override
	public void updateliveStreamReport(liveStreamReportBean liveStreamReportBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(liveStreamReportBean);
	}

	@Override
	public void deleteliveStreamReport(liveStreamReportBean liveStreamReportBean) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(liveStreamReportBean);
	}

}
