package com.iii._05_.auctionEnd.model;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class AuctionEndDAOImpl implements AuctionEndDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<AuctionEndBean> getProductSeqByAccountSeqNo(String account, Integer auctionEndSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM AuctionEndBean WHERE account = :account and auctionEndSeqNo = :auctionEndSeqNo",AuctionEndBean.class).setParameter("account", account).setParameter("auctionEndSeqNo", auctionEndSeqNo).list();
	}

	@Override
	public List<AuctionEndBean> getAuctionEndByAuctionSeqNo(Integer auctionEndSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM AuctionEndBean WHERE auctionEndSeqNo = :auctionEndSeqNo",AuctionEndBean.class).setParameter("auctionEndSeqNo", auctionEndSeqNo).list();
	}

	@Override
	public AuctionEndBean getAuctionEndByProductSeqNo(Integer productSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM AuctionEndBean WHERE productSeqNo = :productSeqNo",AuctionEndBean.class).setParameter("productSeqNo", productSeqNo).uniqueResult();
	}

	@Override
	public List<AuctionEndBean> getAllAuctionEnd() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM AuctionEndBean",AuctionEndBean.class).list();
	}

	@Override
	public List<AuctionEndBean> getAuctionEndByAccount(String account) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM AuctionEndBean WHERE account = :account",AuctionEndBean.class).setParameter("account", account).list();
	}

	@Override
	public int saveAuctionEnd(AuctionEndBean AuctionEndBean) {
		Session session = sessionFactory.getCurrentSession();
		return (int) session.save(AuctionEndBean);
	}

	@Override
	public void updateAuctionEnd(AuctionEndBean AuctionEndBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(AuctionEndBean);
	}

	@Override
	public void deleteAuctionEnd(AuctionEndBean AuctionEndBean) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(AuctionEndBean);
	}

}
