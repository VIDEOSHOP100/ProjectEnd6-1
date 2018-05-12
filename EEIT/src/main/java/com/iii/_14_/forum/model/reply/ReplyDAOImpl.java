package com.iii._14_.forum.model.reply;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	@Autowired
	SessionFactory factory;
	
	@Override
	public ReplyBean insert(ReplyBean rb) {
		Session session = factory.getCurrentSession();
		ReplyBean temp = session.get(ReplyBean.class, rb.getReplySeqNo());
		if(temp==null) {
			session.save(rb);
			return rb;
		}
		return null;
	}

	@Override
	public ReplyBean update(ReplyBean rb) {
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(rb);
		return rb;
	}

	@Override
	public ReplyBean delete(ReplyBean rb) {
		Session session = factory.getCurrentSession();
		ReplyBean temp = session.get(ReplyBean.class, rb.getReplySeqNo());
		if(temp!=null) {
			session.delete(temp);
			return temp;
		}
		return null;
	}

	@Override
	public ReplyBean findByPk(ReplyBean rb) {
		Session session = factory.getCurrentSession();
		return session.get(ReplyBean.class, rb.getReplySeqNo());
	}

	@Override
	public List<ReplyBean> getAll() {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("from ReplyBean");
		return (List<ReplyBean>) query.list();
	}

}
