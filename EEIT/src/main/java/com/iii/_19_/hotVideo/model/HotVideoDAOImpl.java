package com.iii._19_.hotVideo.model;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii._19_.videoManage.model.VideoBean;


@Transactional
@Repository
public class HotVideoDAOImpl implements HotVideoDAO{

	@Autowired
	SessionFactory sessionFactory;
	
	
	@Override
	public List<VideoBean> getAllHotVideo() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM VideoBean WHERE videoStatus = '1' order by videoViews desc",VideoBean.class).setMaxResults(50).list();
	}

}
