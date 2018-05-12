package com.iii._19_.commentVideos.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public class CommentVideosDAOImpl implements CommentVideosDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<CommentVideosBean> getCommentVideosByVideo(Integer videoSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM CommentVideosBean WHERE videoSeqNo = :videoSeqNo order by commentDate desc",CommentVideosBean.class).setParameter("videoSeqNo", videoSeqNo).list();
	}
	
	@Override
	public List<CommentVideosBean> getAllCommentVideos() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM CommentVideosBean",CommentVideosBean.class).list();
	}

	@Override
	public List<CommentVideosBean> getCommentVideosByVideoAndAccount(Integer videoSeqNo, String account) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM CommentVideosBean WHERE videoSeqNo = :videoSeqNo and account = :account", CommentVideosBean.class).setParameter("videoSeqNo", videoSeqNo).setParameter("account", account).list();
		
	}

	@Override
	public CommentVideosBean getCommentVideosBySeqNo(Integer commentVideoSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(CommentVideosBean.class, commentVideoSeqNo);
	}

	@Override
	public int saveCommentVideos(CommentVideosBean commentVideosBean) {
		Session session = sessionFactory.getCurrentSession();
		return (int) session.save(commentVideosBean);
	}

	@Override
	public void updateCommentVideos(CommentVideosBean commentVideosBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(commentVideosBean);
	}

	@Override
	public void deleteCommentsVideos(CommentVideosBean commentVideosBeans) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(commentVideosBeans);
	}

}
