package com.iii.HomePage.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iii._19_.videoManage.model.VideoBean;
import com.iii._19_.videoType.model.VideoTypeBean;

@Repository
@Transactional
public class HomePageDAOImpl implements HomePageDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<VideoBean> getHotVideos() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM VideoBean where videoStatus = '1' order by videoViews desc", VideoBean.class).setMaxResults(12)
				.list();
	}

	@Override
	public List<VideoBean> getNewVideos() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM VideoBean where videoStatus = '1' order by videoUploadDate desc", VideoBean.class).setMaxResults(12)
				.list();
	}

	@Override
	public List<List<VideoBean>> getSortedVideos() {
		List<List<VideoBean>> sortedVideoBean = new ArrayList<List<VideoBean>>();
		Session session = sessionFactory.getCurrentSession();
		List<VideoTypeBean> videoTypeList = session.createQuery("FROM VideoTypeBean", VideoTypeBean.class).list();
		for (VideoTypeBean videoTypeBean : videoTypeList) {
			String videoType = videoTypeBean.getVideoType();
			List<VideoBean> vblist = new ArrayList<>();
			vblist = session.createQuery("FROM VideoBean where videoType = :videoType ",VideoBean.class).setParameter("videoType", videoType).setMaxResults(12).list();
			sortedVideoBean.add(vblist);
		}
		return sortedVideoBean;
	}

}
