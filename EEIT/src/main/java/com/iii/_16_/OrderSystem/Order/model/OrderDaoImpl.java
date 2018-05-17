package com.iii._16_.OrderSystem.Order.model;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii._16_.BuyCart.ProCartList.model.ProCartListBean;
import com.iii._16_.FAQ.bean.MemberFAQBean;
@Repository
public class OrderDaoImpl implements OrderDao{
	@Autowired	
	SessionFactory factory;
	@Override
	public OrderBean insert(OrderBean bean) throws SQLException {
		Session session = factory.getCurrentSession();
		session.save(bean);
		return bean;
	}

	@Override
	public OrderBean update(OrderBean order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OrderBean delete(OrderBean order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OrderBean findbyPrimaryKey(Integer order) throws SQLException {
		Session session = factory.getCurrentSession();
		return session.get(OrderBean.class,  order);
	}

	@Override
	public OrderBean findbyProductSeqNo(Integer id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderBean> findbyAccount(String account) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderBean> getALL() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertGetId(OrderBean order) {
		Session session = factory.getCurrentSession();
		session.save(order);
		int id = order.getOrderSeqNo();
		return id;
	}

	@Override
	public OrderBean findbyCartId(Integer id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
	public List<OrderBean> findbyAccountReadyPay(String account,Integer orderstatus) throws SQLException {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM OrderBean WHERE account = :account and orderstatus = :orderstatus",OrderBean.class).setParameter("account", account).setParameter("orderstatus", orderstatus).list();
	}

}
