package com.iii._14_.forum.model.comment;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAOImpl implements CommentDAO{
	@Autowired
	SessionFactory factory;
	
	@Override
	public CommentBean insert(CommentBean cb) {
		Session session = factory.getCurrentSession();
		CommentBean temp = session.get(CommentBean.class, cb.getCommentSeqNo());
		if(temp==null) {
			session.save(cb);
			return cb;
		}
		return null;
	}

	@Override
	public CommentBean update(CommentBean cb) {
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(cb);
		return cb;
	}

	@Override
	public CommentBean delete(CommentBean cb) {
		Session session = factory.getCurrentSession();
		CommentBean temp = session.get(CommentBean.class, cb.getCommentSeqNo());
		if(temp!=null) {
			session.delete(temp);
			return temp;
		}
		return null;
	}

	@Override
	public CommentBean findByPk(CommentBean cb) {
		Session session = factory.getCurrentSession();
		return session.get(CommentBean.class, cb.getArticleSeqNo());
	}

	@Override
	public List<CommentBean> getComment() {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("from CommentBean");
		return (List<CommentBean>) query.list();
	}

}
