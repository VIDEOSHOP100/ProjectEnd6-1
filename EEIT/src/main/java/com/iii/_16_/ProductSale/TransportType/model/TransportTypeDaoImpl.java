package com.iii._16_.ProductSale.TransportType.model;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
@Repository
public class TransportTypeDaoImpl implements TransportTypeDao {
	@Autowired	
	SessionFactory factory;
	@Override
	public TransportTypeBean insert(TransportTypeBean ship) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TransportTypeBean update(TransportTypeBean ship) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TransportTypeBean delete(TransportTypeBean ship) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TransportTypeBean findbyPrimaryKey(int shipNum) throws SQLException {
		Session session = factory.getCurrentSession();
		TransportTypeBean bean = session.get(TransportTypeBean.class, shipNum);
		return bean;
	}

	@Override
	public List<TransportTypeBean> getALL() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
