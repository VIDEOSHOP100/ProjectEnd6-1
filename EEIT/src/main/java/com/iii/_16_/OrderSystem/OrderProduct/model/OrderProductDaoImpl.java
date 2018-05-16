package com.iii._16_.OrderSystem.OrderProduct.model;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class OrderProductDaoImpl implements OrderProductDao {
	@Autowired	
	SessionFactory factory;
	@Override
	public OrderProductBean insert(OrderProductBean bean) throws SQLException {
		Session session = factory.getCurrentSession();
		session.save(bean);
		return bean;
	}

	@Override
	public OrderProductBean update(OrderProductBean order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OrderProductBean delete(OrderProductBean order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OrderProductBean findbyPrimaryKey(int order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OrderProductBean findbyProductSeqNo(int id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderProductBean> findbyAccount(String account) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderProductBean> getALL() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertGetId(OrderProductBean order) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public OrderProductBean findbyCartId(int id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
