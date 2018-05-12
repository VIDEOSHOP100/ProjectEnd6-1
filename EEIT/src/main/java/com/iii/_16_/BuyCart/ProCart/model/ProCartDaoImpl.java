package com.iii._16_.BuyCart.ProCart.model;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProCartDaoImpl implements ProCartDao{
	@Autowired	
	SessionFactory factory;
	@Override
	public ProCartBean insert(ProCartBean cartbean) throws SQLException {
		Session session = factory.getCurrentSession();
		session.save(cartbean);
		return cartbean;
	}

	@Override
	public ProCartBean update(ProCartBean cartbean) throws SQLException {
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(cartbean);
		return cartbean;
	}

	@Override
	public ProCartBean delete(ProCartBean cartbean) throws SQLException {
		Session session = factory.getCurrentSession();
		ProCartBean temp = session.get(ProCartBean.class, cartbean.getProCartSeqNo());
		if(temp!=null) {
			session.delete(temp);
			return temp;
		}
		return null;
	}

	@Override
	public ProCartBean findbyPrimaryKey(int id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProCartBean> findbyAccount(String account) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProCartBean> getALL() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertGetId(ProCartBean cartbean) {
		// TODO Auto-generated method stub
		return 0;
	}

}
