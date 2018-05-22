package com.iii._05_.customized.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;


@Repository
public class CustomizedDAOImpl implements CustomizedDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<CustomizedBean> getAllByAccount(String account) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM CustomizedBean WHERE account = :account",CustomizedBean.class).setParameter("account", account).list();
	}

	@Override
	public int saveCustomized(CustomizedBean CustomizedBean) {
		Session session = sessionFactory.getCurrentSession();
		return (int) session.save(CustomizedBean);
	}

	@Override
	public void updateCustomized(CustomizedBean CustomizedBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(CustomizedBean);
	}

	@Override
	public void deleteCustomized(CustomizedBean CustomizedBean) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(CustomizedBean);
	}

	@Override
	public CustomizedBean getCustomizedBySeqNo(int customizedSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		CustomizedBean cb = null;
		cb = session.get(CustomizedBean.class, customizedSeqNo);
		return cb;
	}

}
