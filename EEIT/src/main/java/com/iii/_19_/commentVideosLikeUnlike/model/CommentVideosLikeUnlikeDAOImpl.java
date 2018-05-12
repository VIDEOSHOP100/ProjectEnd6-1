package com.iii._19_.commentVideosLikeUnlike.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class CommentVideosLikeUnlikeDAOImpl implements CommentVideosLikeUnlikeDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	
	
	@Override
	public List<CommentVideosLikeUnlikeBean> getCommentVideosLikeUnlikeByComment(Integer commentVideosSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM CommentVideosLikeUnlikeBean WHERE commentVideosSeqNo = :commentVideosSeqNo",CommentVideosLikeUnlikeBean.class).setParameter("commentVideosSeqNo", commentVideosSeqNo).list();
	}

	@Override
	public List<CommentVideosLikeUnlikeBean> getAllCommentVideosLikeUnlike() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM CommentVideosLikeUnlikeBean",CommentVideosLikeUnlikeBean.class).list();
		
	}

	@Override
	public CommentVideosLikeUnlikeBean getCommentVideosLikeUnlikeByCommentAndAccount(Integer commentVideosSeqNo,
			String account) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM CommentVideosLikeUnlikeBean WHERE commentVideoSeqNo = :commentVideoSeqNo and account = :account",CommentVideosLikeUnlikeBean.class).setParameter("commentVideoSeqNo", commentVideosSeqNo).setParameter("account", account).uniqueResult();
	}

	@Override
	public CommentVideosLikeUnlikeBean getCommentVideosLikeUnlikeBySeqNo(Integer commentLikeUnlikeSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(CommentVideosLikeUnlikeBean.class, commentLikeUnlikeSeqNo);
	}

	@Override
	public int saveCommentVideosLikeUnlike(CommentVideosLikeUnlikeBean commentVideosLikeUnlikeBean) {
		Session session = sessionFactory.getCurrentSession();
		return (int) session.save(commentVideosLikeUnlikeBean);
	}

	@Override
	public void updateCommentVideosLikeUnlike(CommentVideosLikeUnlikeBean commentVideosLikeUnlikeBean) {
		Session session = sessionFactory.getCurrentSession();
		session.update(commentVideosLikeUnlikeBean);
	}

	@Override
	public void deleteCommentVideosLikeUnlike(CommentVideosLikeUnlikeBean commentVideosLikeUnlikeBean) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(commentVideosLikeUnlikeBean);
	}

}
