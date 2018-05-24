package com.iii._19_.replyCommentVideo.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public class ReplyCommentVideoDAOImpl implements ReplyCommentVideoDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	
	@Override
	public List<ReplyCommentVideoBean> getReplyCommentVideoByComment(Integer commentVideoSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM ReplyCommentVideoBean WHERE commentVideoSeqNo = :commentVideoSeqNo and replyCommentVideoStatus = '1' order by replyCommentDate desc",ReplyCommentVideoBean.class).setParameter("commentVideoSeqNo", commentVideoSeqNo).list();
	}

	@Override
	public List<ReplyCommentVideoBean> getAllReplyCommentVideo() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM ReplyCommentVideoBean",ReplyCommentVideoBean.class).list();
	}

	@Override
	public List<ReplyCommentVideoBean> getReplyCommentVideoByCommentAndAccount(Integer commentVideoSeqNo,
			String account) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM ReplyCommentVideoBean WHERE commentVideoSeqNo = :commentVideoSeqNo and account = :account and replyCommentVideoStatus = '1'",ReplyCommentVideoBean.class).list();
	}

	@Override
	public ReplyCommentVideoBean getReplyCommentVideoBySeqNo(Integer replyCommentVideoSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM ReplyCommentVideoBean WHERE replyCommentVideoSeqNo = :replyCommentVideoSeqNo  and replyCommentVideoStatus = '1'",ReplyCommentVideoBean.class).setParameter("replyCommentVideoSeqNo", replyCommentVideoSeqNo).uniqueResult();
		
	}

	@Override
	public int saveReplyCommentVideo(ReplyCommentVideoBean replyCommentVideoBean) {
		Session session = sessionFactory.getCurrentSession();
		return (int) session.save(replyCommentVideoBean);
	}

	@Override
	public void updateReplyCommentVideo(ReplyCommentVideoBean replyCommentVideoBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(replyCommentVideoBean);
	}

	@Override
	public void deleteReplyCommentVideo(ReplyCommentVideoBean replyCommentVideoBean) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(replyCommentVideoBean);
	}

}
