package com.iii._01_.ShopReport.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii._01_.ShopReport.bean.ShopReportBean;

@Repository
public class ShopReportDAOImpl implements ShopReportDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	
	@Override
	public ShopReportBean getShopReportBeanByShopReportSeqNo(Integer ShopReportSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(ShopReportBean.class , ShopReportSeqNo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ShopReportBean> getAllShopReportBean() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("from ShopReportBean").list();
	}

	@Override
	public void saveShopReportBean(ShopReportBean ShopReportBean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(ShopReportBean);
	}

	@Override
	public void updateShopReportBean(ShopReportBean ShopReportBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(ShopReportBean);
	}

	@Override
	public void deleteShopReportBean(Integer ShopReportSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(ShopReportSeqNo);
	}

}
