package com.iii._16_.ProductHot.model;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii._16_.FAQ.bean.MemberFAQBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
@Repository
public class ProductHotDaoImpl implements ProductHotDao{
	@Autowired	
	SessionFactory factory;
	@Override
	public ProductHotBean insert(ProductHotBean hotbean) throws SQLException {
		Session session = factory.getCurrentSession();
		session.save(hotbean);
		return hotbean;
	}

	@Override
	public ProductHotBean update(ProductHotBean hotbean) throws SQLException {
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(hotbean);
		return hotbean;
	}

	@Override
	public ProductHotBean delete(ProductHotBean hotbean) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductHotBean findbyPrimaryKey(int seqno) throws SQLException {
		Session session = factory.getCurrentSession();
		return session.get(ProductHotBean.class,  seqno);
	
	}

	@Override
	public List<ProductHotBean> getALL() throws SQLException {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("from ProductHotBean ");
		return (List<ProductHotBean>) query.list();
	}
	

	@Override
	public List<ProductHotBean> getAllByStatus(Integer status) {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM ProductHotBean WHERE productStatus = :productStatus",ProductHotBean.class).setParameter("productStatus", status).list();
	}
	
}
