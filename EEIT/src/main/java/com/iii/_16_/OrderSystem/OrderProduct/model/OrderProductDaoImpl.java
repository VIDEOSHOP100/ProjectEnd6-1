package com.iii._16_.OrderSystem.OrderProduct.model;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii._16_.ProductSale.Product.model.ProductSaleBean;


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
	public OrderProductBean update(OrderProductBean orderpro) throws SQLException {
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(orderpro);
		return orderpro;
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
	public List<OrderProductBean> findbyOrderSeqNo(Integer orderSeqNo) throws SQLException {
			Session session = factory.getCurrentSession();
			return session.createQuery("FROM OrderProductBean WHERE orderSeqNo = :orderSeqNo",OrderProductBean.class).setParameter("orderSeqNo", orderSeqNo).list();
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
