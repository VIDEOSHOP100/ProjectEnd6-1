package com.iii._01_.Friend.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii._01_.Friend.bean.FriendBean;
import com.iii._01_.Member.bean.MemberBean;

@Repository
public class FriendDAOImpl implements FriendDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void saveFriendRequest(FriendBean fb) {
		Session session = sessionFactory.getCurrentSession();
		session.save(fb);
	}

	@Override
	public void updateFriendRequest(FriendBean fb) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(fb);
	}

	@Override
	public Integer getFriendStatus(String account1, String account2) {
		Session session = sessionFactory.getCurrentSession();
		FriendBean fb = session
				.createQuery("from FriendBean where friendsend =:account1 and friendto = :account2", FriendBean.class)
				.setParameter("account1", account1).setParameter("account2", account2).uniqueResult();
		if(fb!=null) {
			return fb.getFriendStatus();
			
		}else {
			return null;
		}
		
	}

	@Override
	public void deleteFriendRequest(FriendBean fb) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(fb);
	}

	@Override
	public FriendBean getFriendBeanByBothAccount(String account1, String account2) {

		Session session = sessionFactory.getCurrentSession();
		return session
				.createQuery("from FriendBean where friendsend=:account1 and friendto=:account2", FriendBean.class)
				.setParameter("account1", account1).setParameter("account2", account2).uniqueResult();
	}

	@Override
	public List<FriendBean> getFriendByOneAccountSend(String account) {
		Session session = sessionFactory.getCurrentSession();
		List<FriendBean> friendBeanList = session.createNativeQuery("select * from Friend where friendsend = :account and friendStatus = '1'").setParameter("account", account).addEntity(FriendBean.class).list();
		return friendBeanList;
	}
	@Override
	public List<FriendBean> getFriendByOneAccountTo(String account) {
		Session session = sessionFactory.getCurrentSession();
		List<FriendBean> friendBeanList = session.createNativeQuery("select * from Friend where friendto = :account and friendStatus = '1'").setParameter("account", account).addEntity(FriendBean.class).list();
		return friendBeanList;
	}

}
