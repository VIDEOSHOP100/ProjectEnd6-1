package com.iii._19_.uploaderHomePage.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
import com.iii._19_.videoManage.model.VideoBean;

@Repository
@Transactional
public class UploaderHomePageDAOImpl implements UploaderHomePageDAO {
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<VideoBean> getUserAllVideos(String uploaderAccount) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM VideoBean WHERE videoStatus = '1' and account = :uploaderAccount",VideoBean.class).setParameter("uploaderAccount", uploaderAccount).list();
	}

	@Override
	public List<ProductSaleBean> getUserAllProducts(String uploaderAccount) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM ProductSaleBean WHERE proStatus = 1 and account = :uploaderAccount",ProductSaleBean.class).setParameter("uploaderAccount", uploaderAccount).list();
	}

	@Override
	public List<InputLiveStreamTimeBean> getUserAllLiveStream(String uploaderAccount) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM InputLiveStreamTimeBean WHERE liveStatus = '1' and account = :uploaderAccount", InputLiveStreamTimeBean.class).setParameter("uploaderAccount", uploaderAccount).list();
	}

	@Override
	public MemberBean getUserDetail(String uploaderAccount) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM MemberBean WHERE ban = 0 and account = :uploaderAccount", MemberBean.class).setParameter("uploaderAccount", uploaderAccount).uniqueResult();
	}

	@Override
	public List<VideoBean> getUserTopTwelveVideos(String uploaderAccount) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM VideoBean WHERE videoStatus = '1' and account = :uploaderAccount order by videoViews",VideoBean.class).setParameter("uploaderAccount", uploaderAccount).setMaxResults(12).list();
	}

	@Override
	public List<ProductSaleBean> getUserTopTwelveProducts(String uploaderAccount) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM ProductSaleBean WHERE proStatus = 1 and account = :uploaderAccount",ProductSaleBean.class).setParameter("uploaderAccount", uploaderAccount).setMaxResults(12).list();
	}

	@Override
	public List<InputLiveStreamTimeBean> getUserTopTwelveLiveStream(String uploaderAccount) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM InputLiveStreamTimeBean WHERE liveStatus = '1' and account = :uploaderAccount order by liveStreamView", InputLiveStreamTimeBean.class).setParameter("uploaderAccount", uploaderAccount).setMaxResults(12).list();
	}

}
