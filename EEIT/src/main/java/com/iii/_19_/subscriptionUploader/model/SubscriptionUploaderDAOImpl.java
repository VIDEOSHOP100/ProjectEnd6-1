package com.iii._19_.subscriptionUploader.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iii._01_.Member.bean.MemberBean;

@Repository
@Transactional
public class SubscriptionUploaderDAOImpl implements SubscriptionUploaderDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public SubscriptionUploaderBean getSubscriptionUploader(String account, String uploaderAccount) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery(
				"FROM SubscriptionUploaderBean WHERE account = :account and uploaderAccount = :uploaderAccount and subscriptionUploaderStatus = 'subscription'",
				SubscriptionUploaderBean.class).setParameter("account", account)
				.setParameter("uploaderAccount", uploaderAccount).uniqueResult();
	}

	@Override
	public List<MemberBean> getAllSubscriptionUploader(String account) {
		Session session = sessionFactory.getCurrentSession();
		return session.createNativeQuery(" select member.memberSeqNo" + 
				"      ,member.account" + 
				"      ,member.password" + 
				"      ,member.nickname" + 
				"      ,member.firstname" + 
				"      ,member.lastname" + 
				"      ,member.gender" + 
				"      ,member.email" + 
				"      ,member.address" + 
				"      ,member.birthday" + 
				"      ,member.photoPath" + 
				"      ,member.photoName" + 
				"      ,member.phone" + 
				"      ,member.registerdate" + 
				"      ,member.lastlogin" + 
				"      ,member.subscription,member.ban,member.googleMark from SubscriptionUploader subscriptionUploader join Member member on member.account = subscriptionUploader.uploaderAccount WHERE subscriptionUploader.account = :account and subscriptionUploaderStatus = 'subscription'").setMaxResults(10).setParameter("account", account).addEntity("member",MemberBean.class).list();
		
	}

	@Override
	public Integer saveSubscriptionUploader(SubscriptionUploaderBean subscriptionUploaderBean) {
		Session session = sessionFactory.getCurrentSession();
		return (Integer) session.save(subscriptionUploaderBean);
	}

	@Override
	public void updateSubscriptionUploader(SubscriptionUploaderBean subscriptionUploaderBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(subscriptionUploaderBean);
	}

	@Override
	public void deleteSubscriptionUploader(SubscriptionUploaderBean subscriptionUploaderBean) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(subscriptionUploaderBean);
	}

	@Override
	public List<SubscriptionUploaderBean> getSubscriptionUploaderByUploaderAccount(String uploaderAccount) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM SubscriptionUploaderBean WHERE uploaderAccount = :uploaderAccount",SubscriptionUploaderBean.class).setParameter("uploaderAccount", uploaderAccount).list();
		
	}

	@Override
	public List<MemberBean> getSubscriptionUploaderByPageNo(String account, Integer pageNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createNativeQuery(" select member.memberSeqNo" + 
				"      ,member.account" + 
				"      ,member.password" + 
				"      ,member.nickname" + 
				"      ,member.firstname" + 
				"      ,member.lastname" + 
				"      ,member.gender" + 
				"      ,member.email" + 
				"      ,member.address" + 
				"      ,member.birthday" + 
				"      ,member.photoPath" + 
				"      ,member.photoName" + 
				"      ,member.phone" + 
				"      ,member.registerdate" + 
				"      ,member.lastlogin" + 
				"      ,member.subscription,member.ban,member.googleMark from SubscriptionUploader subscriptionUploader join Member member on member.account = subscriptionUploader.uploaderAccount WHERE subscriptionUploader.account = :account and subscriptionUploaderStatus = 'subscription'").setMaxResults(10).setFirstResult(pageNo).setParameter("account", account).addEntity("member",MemberBean.class).list();
	}

}
