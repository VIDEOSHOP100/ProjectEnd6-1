package com.iii._01_.AdviceReport.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii._01_.AdviceReport.bean.AdviceReportBean;

@Repository
public class AdviceReportDAOImpl implements AdviceReportDAO{

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void saveAdviceReport(AdviceReportBean adviceReportBean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(adviceReportBean);
	}

	@Override
	public void updateAdviceReport(AdviceReportBean adviceReportBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(adviceReportBean);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AdviceReportBean> getAllAdviceReport() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("from AdviceReportBean").list();
	}

	@Override
	public AdviceReportBean getAdviceReportByAdviceReportSeqNo(Integer AdviceReportSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(AdviceReportBean.class, AdviceReportSeqNo);
	}

	@Override
	public void deleteAdviceReport(AdviceReportBean adviceReportBean) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(adviceReportBean);
		
	}

	
	
	
	
	
	
	
	
}
