package com.iii._19_.replyCommentVideoLikeUnlike.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iii._19_.commentVideosLikeUnlike.model.CommentVideosLikeUnlikeBean;

@Repository
@Transactional
public class ReplyCommentVideoLikeUnlikeDAOImpl implements ReplyCommentVideoLikeUnlikeDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<ReplyCommentVideoLikeUnlikeBean> getReplyCommentVideoLikeUnlikeByReplyComment(
			Integer replyCommentVideosSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM ReplyCommentVideoLikeUnlikeBean WHERE replyCommentVideosSeqNo = :replyCommentVideosSeqNo",ReplyCommentVideoLikeUnlikeBean.class).list();
	}

	@Override
	public List<ReplyCommentVideoLikeUnlikeBean> getAllReplyCommentVideoLikeUnlike() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM ReplyCommentVideoLikeUnlikeBean",ReplyCommentVideoLikeUnlikeBean.class).list();
	}

	@Override
	public ReplyCommentVideoLikeUnlikeBean getReplyCommentVideoLikeUnlikeByReplyCommentAndAccount(
			Integer replyCommentVideoSeqNo, String account) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM ReplyCommentVideoLikeUnlikeBean WHERE replyCommentVideoSeqNo = :replyCommentVideoSeqNo and account = :account",ReplyCommentVideoLikeUnlikeBean.class).setParameter("replyCommentVideoSeqNo", replyCommentVideoSeqNo).setParameter("account", account).uniqueResult();
	}

	@Override
	public ReplyCommentVideoLikeUnlikeBean getReplyCommentVideosLikeUnlikeBySeqNo(
			Integer replyCommentVideoLikeUnlikeSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(ReplyCommentVideoLikeUnlikeBean.class, replyCommentVideoLikeUnlikeSeqNo);
	}

	@Override
	public int saveReplyCommentVideoLikeUnlike(ReplyCommentVideoLikeUnlikeBean replyCommentVideoLikeUnlikeBean) {
		Session session = sessionFactory.getCurrentSession();
		return (int) session.save(replyCommentVideoLikeUnlikeBean);
	}

	@Override
	public void updateReplyCommentVideoLikeUnlike(ReplyCommentVideoLikeUnlikeBean replyCommentVideoLikeUnlikeBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(replyCommentVideoLikeUnlikeBean);
	}

	@Override
	public void deleteReplyCommentVideoLikeUnlike(ReplyCommentVideoLikeUnlikeBean replyCommentVideoLikeUnlikeBean) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(replyCommentVideoLikeUnlikeBean);
	}

}
