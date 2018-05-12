package com.iii._19_.newVideo.model;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii._19_.videoManage.model.VideoBean;

@Repository
@Transactional
public class NewVideoDAOImpl implements NewVideoDAO{
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<VideoBean> getAllNewVideos() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM VideoBean WHERE videoStatus = '1' order by videoUploadDate desc",VideoBean.class).setMaxResults(50).list();
	}

}
