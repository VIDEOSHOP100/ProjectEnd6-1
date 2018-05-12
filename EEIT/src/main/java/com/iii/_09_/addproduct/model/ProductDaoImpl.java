package com.iii._09_.addproduct.model;

import java.sql.SQLException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iii._16_.FAQ.bean.MemberFAQBean;

@Repository
public class ProductDaoImpl implements ProductDao{
	
	@Autowired
	SessionFactory factory;
	
	@Override
	public ProductBean insert(ProductBean prd) throws SQLException{
		Session session = factory.getCurrentSession();
		session.save(prd);
		return prd;

	}

	@Override
	public ProductBean update(ProductBean prd) throws SQLException {
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(prd);
		return prd;
	}

	@Override
	public ProductBean delete(ProductBean prd) throws SQLException {
		Session session = factory.getCurrentSession();
		ProductBean temp = session.get(ProductBean.class,prd.getProductSeqNo());
		if(temp!=null) {
			session.delete(temp);
			return temp;
		}
		return null;
	}
	
	@Override
	public ProductBean findbyPrimaryKey(ProductBean prd) throws SQLException {
		Session session = factory.getCurrentSession();
		return session.get(ProductBean.class,  prd.getProductSeqNo());
	}


	


}
