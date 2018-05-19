package com.iii._16_.PDF.model;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii._16_.FAQ.bean.MemberFAQBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
@Repository
public class orderPdfDaoImpl implements orderPdfDao {
	@Autowired	
	SessionFactory factory;
	@Override
	public orderPdfBean insert(orderPdfBean odpdf) throws SQLException {
		Session session = factory.getCurrentSession();
		session.save(odpdf);
		return odpdf;
	}

	@Override
	public orderPdfBean update(orderPdfBean odpdf) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public orderPdfBean delete(orderPdfBean odpdf) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public List<orderPdfBean>findbyOrderKey(int orderSeqNo) throws SQLException {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM orderPdfBean WHERE orderSeqNo = :orderSeqNo",orderPdfBean.class).setParameter("orderSeqNo", orderSeqNo).list();
	}

	@Override
	public List<orderPdfBean> getALL() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public orderPdfBean findbyPrimaryKey(int orderSeqNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	

}
