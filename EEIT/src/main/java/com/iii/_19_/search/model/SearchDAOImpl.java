package com.iii._19_.search.model;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
import com.iii._19_.videoManage.model.VideoBean;

@Repository
@Transactional
public class SearchDAOImpl implements SearchDAO{
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<VideoBean> getSearchVideoBean(String queryString) {
		Session session = sessionFactory.getCurrentSession();
		return session.createNativeQuery("Select * from Video where videoTitle like :queryString and videoStatus = '1'").addEntity(VideoBean.class).setParameter("queryString", "%" + queryString + "%").setMaxResults(4).list();
	}

	@Override
	public List<MemberBean> getSearchMemberBean(String queryString) {
		Session session = sessionFactory.getCurrentSession();
		return session.createNativeQuery("Select * from Member where account like :queryString and ban = 0").addEntity(MemberBean.class).setParameter("queryString", "%" + queryString + "%").setMaxResults(4).list();
	}

	@Override
	public List<InputLiveStreamTimeBean> getSearchInputLiveStreamTimeBean(String queryString) {
		Session session = sessionFactory.getCurrentSession();
		return session.createNativeQuery("Select * from LiveStream where streamName like :queryString and liveStatus = '1'").addEntity(InputLiveStreamTimeBean.class).setParameter("queryString", "%" + queryString + "%").setMaxResults(4).list();
	}

	@Override
	public List<ProductSaleBean> getProductSaleBean(String queryString) {
		Session session = sessionFactory.getCurrentSession();
		return session.createNativeQuery("Select * from Product where proName like :queryString and proStatus = 1").addEntity(ProductSaleBean.class).setParameter("queryString", "%" + queryString + "%").setMaxResults(4).list();
	}

	@Override
	public List<VideoBean> getTopFiftySearchVideoBean(String queryString) {
		Session session = sessionFactory.getCurrentSession();
		return session.createNativeQuery("Select * from Video where videoTitle like :queryString and videoStatus = '1'").addEntity(VideoBean.class).setParameter("queryString", "%" + queryString + "%").setMaxResults(50).list();
	}

	@Override
	public List<MemberBean> getTopFiftySearchMemberBean(String queryString) {
		Session session = sessionFactory.getCurrentSession();
		return session.createNativeQuery("Select * from Member where account like :queryString and ban = 0").addEntity(MemberBean.class).setParameter("queryString", "%" + queryString + "%").setMaxResults(50).list();
	}

	@Override
	public List<InputLiveStreamTimeBean> getTopFiftySearchInputLiveStreamTimeBean(String queryString) {
		Session session = sessionFactory.getCurrentSession();
		return session.createNativeQuery("Select * from LiveStream where streamName like :queryString and liveStatus = '1'").addEntity(InputLiveStreamTimeBean.class).setParameter("queryString", "%" + queryString + "%").setMaxResults(50).list();
	}

	@Override
	public List<ProductSaleBean> getTopFiftyProductSaleBean(String queryString) {
		Session session = sessionFactory.getCurrentSession();
		return session.createNativeQuery("Select * from Product where proName like :queryString and proStatus = 1").addEntity(ProductSaleBean.class).setParameter("queryString", "%" + queryString + "%").setMaxResults(50).list();
	}

}
