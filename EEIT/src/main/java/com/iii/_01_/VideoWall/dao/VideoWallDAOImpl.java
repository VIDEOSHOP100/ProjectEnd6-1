package com.iii._01_.VideoWall.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iii._01_.VideoWall.bean.VideoWallBean;

@Repository

public class VideoWallDAOImpl implements VideoWallDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void saveAllVideoWall(List<VideoWallBean> list) {
		Session session = sessionFactory.getCurrentSession();
//		session
		
		
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<VideoWallBean> getAllVideoWall() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("from VideoWallBean").list();
	}

	@Override
	public void deleteAllVideoWall() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "delete VideoWallBean";
		session.createQuery(hql).executeUpdate();
	}
	
	
	
	
	
	
	
	
}
