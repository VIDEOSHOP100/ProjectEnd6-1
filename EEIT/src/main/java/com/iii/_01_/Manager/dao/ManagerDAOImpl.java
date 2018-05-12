package com.iii._01_.Manager.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii._01_.Manager.bean.ManagerBean;


@Repository
public class ManagerDAOImpl implements ManagerDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public ManagerBean getManagerById(String ManagerId) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(ManagerBean.class, ManagerId);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ManagerBean> getAllManager() {
		Session session = sessionFactory.getCurrentSession();
		return (List<ManagerBean>) session.createQuery("from Manager").list();
	}

	@Override
	public ManagerBean saveMember(ManagerBean bean) throws SQLException {
		Session session = sessionFactory.getCurrentSession();
		session.save(bean);
		return bean;
	}

	@Override
	public void deleteManager(String ManagerId) {
		Session session = sessionFactory.getCurrentSession();
		ManagerBean bean = session.get(ManagerBean.class, ManagerId);
		if (bean != null) {
			session.delete(bean);
		}
	}

	@Override
	public void updateManager(ManagerBean bean) throws SQLException {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(bean);
	}

}
