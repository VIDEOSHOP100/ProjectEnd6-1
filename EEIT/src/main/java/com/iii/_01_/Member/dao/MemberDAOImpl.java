package com.iii._01_.Member.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii._01_.Member.bean.MemberBean;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public MemberBean getMemberByAccount(String account) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(MemberBean.class, account);

	}

	@Override
	public MemberBean getMemberByEmail(String email) {
		Session session = sessionFactory.getCurrentSession();

		return session.createQuery("from MemberBean where email = :email and googleMark = 0", MemberBean.class)
				.setParameter("email", email).uniqueResult();

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getAllMember() {
		Session session = sessionFactory.getCurrentSession();
		return (List<MemberBean>) session.createQuery("from MemberBean").list();

	}

	@Override
	public MemberBean saveMember(MemberBean bean) throws SQLException {
		Session session = sessionFactory.getCurrentSession();
		session.save(bean);
		return bean;
	}

	@Override
	public void deleteMember(String account) {

		Session session = sessionFactory.getCurrentSession();
		MemberBean bean = session.get(MemberBean.class, account);
		if (bean != null) {
			session.delete(bean);
		}
		return;
	}

	@Override
	public void updateMember(MemberBean bean) throws SQLException {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(bean);
	}

}
