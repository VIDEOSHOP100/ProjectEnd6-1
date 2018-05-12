package com.iii._16_.ProductSale.ProductPicture.model;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii._16_.ProductSale.Product.model.ProductSaleBean;

@Repository
public class ProPicDaoImpl implements ProPicDao {
	@Autowired	
	SessionFactory factory;
	@Override
	public ProPicBean insert(ProPicBean propicbean) throws SQLException {
		Session session = factory.getCurrentSession();
		session.save(propicbean);
		return propicbean;
	}
	@Override
	public int insertGetId(ProPicBean propicbean) {
		Session session = factory.getCurrentSession();
		session.save(propicbean);
		int id = propicbean.getPicSeqNo();
		return id;
	}
	@Override
	public ProPicBean update(ProPicBean propicbean) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProPicBean delete(ProPicBean propicbean) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProPicBean findbyPrimaryKey(ProPicBean propicbean) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProPicBean> getALL() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProPicBean> findbyProductSeqNo(int productSeqNo) throws SQLException {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM ProPicBean WHERE productSeqNo = :productSeqNo",ProPicBean.class).setParameter("productSeqNo", productSeqNo).list();
	}
	
	

}
