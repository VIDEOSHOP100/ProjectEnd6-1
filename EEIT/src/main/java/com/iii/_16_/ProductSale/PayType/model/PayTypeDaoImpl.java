package com.iii._16_.ProductSale.PayType.model;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class PayTypeDaoImpl implements PayTypeDao{
	@Autowired	
	SessionFactory factory;
	@Override
	public PayTypeBean insert(PayTypeBean pay) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PayTypeBean update(PayTypeBean pay) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PayTypeBean delete(PayTypeBean pay) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PayTypeBean findbyPrimaryKey(int payNum) throws SQLException {
		Session session = factory.getCurrentSession();
		PayTypeBean bean = session.get(PayTypeBean.class, payNum);
		return bean;
	}

	@Override
	public List<PayTypeBean> getALL() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
