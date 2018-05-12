package com.iii._09_.QuesList.model;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class QuesListDaoImpl implements QuesListDao {
	@Autowired	
	SessionFactory factory;
	
	@Override
	public QuesListBean insert(QuesListBean qb) throws SQLException {
		Session session = factory.getCurrentSession();
		session.save(qb);
		return qb;
	}

	@Override
	public QuesListBean update(QuesListBean qb) throws SQLException {
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(qb);
		return qb;
	}

	@Override
	public QuesListBean delete(QuesListBean qb) throws SQLException {
		Session session = factory.getCurrentSession();
		QuesListBean temp = session.get(QuesListBean.class, qb.getQueSeqNo());
		if(temp!=null) {
			session.delete(temp);
			return temp;
		}
		return null;
	}

	@Override
	public QuesListBean findbyPrimaryKey(QuesListBean qb) throws SQLException {
		Session session = factory.getCurrentSession();
		return session.get(QuesListBean.class, qb.getQueSeqNo());
	}

	@Override
	public List<QuesListBean> getALL() throws SQLException {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("from QuesListBean ");
		return (List<QuesListBean>) query.list();
	}
	
	@Override
	public List<QuesListBean> findbyqueSeqNo(int queSeqNo) throws SQLException {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM QuesListBean WHERE queSeqNo = :queSeqNo",QuesListBean.class).setParameter("queSeqNo", queSeqNo).list();
	}

}
