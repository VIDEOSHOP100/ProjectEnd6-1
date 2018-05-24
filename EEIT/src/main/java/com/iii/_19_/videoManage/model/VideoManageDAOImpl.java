package com.iii._19_.videoManage.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class VideoManageDAOImpl implements VideoManageDAO {
	@Autowired
	SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<VideoBean> getAllVideo() {
		Session session = sessionFactory.getCurrentSession();
		List<VideoBean> vblist = session.createQuery("FROM VideoBean WHERE videoStatus = '1'").setMaxResults(20).list();
		return vblist;
	}

	@Override
	public int saveVideo(VideoBean vb) {
		Session session = sessionFactory.getCurrentSession();
		int updateCount = (int) session.save(vb);
		return updateCount;
	}

	@Override
	public VideoBean getVideo(Integer videoSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM VideoBean WHERE videoSeqNo = :videoSeqNo and videoStatus = '1'",VideoBean.class).setParameter("videoSeqNo", videoSeqNo).uniqueResult();
	}
	
	@Override
	public void updateVideo(VideoBean vb) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(vb);
	}

	@Override
	public void deleteVideo(VideoBean vb) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(vb);
	}

	@Override
	public List<VideoBean> getAllVideoByAccount(String account) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM VideoBean WHERE videoStatus = '1' and account = :account order by videoUploadDate desc",VideoBean.class).setParameter("account", account).setMaxResults(8).list();
		
	}

	@Override
	public List<VideoBean> getUserVideoByPageNo(Integer pageNo, String account) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM VideoBean WHERE videoStatus = '1' and account = :account order by videoUploadDate desc", VideoBean.class).setParameter("account" , account).setMaxResults(8).setFirstResult(pageNo).list();
	}

}
