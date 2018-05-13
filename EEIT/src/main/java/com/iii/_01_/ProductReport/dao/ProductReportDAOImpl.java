package com.iii._01_.ProductReport.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii._01_.ProductReport.bean.ProductReportBean;

@Repository
public class ProductReportDAOImpl implements ProductReportDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	
	@Override
	public ProductReportBean getProductReportBeanByProductReportSeqNo(Integer ProductReportSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(ProductReportBean.class , ProductReportSeqNo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductReportBean> getAllProductReportBean() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("from ProductReportBean").list();
	}

	@Override
	public void saveProductReportBean(ProductReportBean ProductReportBean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(ProductReportBean);
	}

	@Override
	public void updateProductReportBean(ProductReportBean ProductReportBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(ProductReportBean);
	}

	@Override
	public void deleteProductReportBean(Integer ProductReportSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(ProductReportSeqNo);
	}

}
