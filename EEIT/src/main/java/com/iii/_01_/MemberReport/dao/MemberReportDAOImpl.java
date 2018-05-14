package com.iii._01_.MemberReport.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii._01_.MemberReport.bean.MemberReportBean;

@Repository
public class MemberReportDAOImpl implements MemberReportDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	
	@Override
	public MemberReportBean getMemberReportBeanByMemberReportSeqNo(Integer MemberReportSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(MemberReportBean.class , MemberReportSeqNo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberReportBean> getAllMemberReportBean() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("from MemberReportBean").list();
	}

	@Override
	public void saveMemberReportBean(MemberReportBean memberReportBean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(memberReportBean);
	}

	@Override
	public void updateMemberReportBean(MemberReportBean memberReportBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(memberReportBean);
	}

	@Override
	public void deleteMemberReportBean(Integer MemberReportSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(MemberReportSeqNo);
	}

}
