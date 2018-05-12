package com.iii._05_.AuctionItemSelect.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;
@Repository
public class AuctionItemSelectDAOImpl implements AuctionItemSelectDAO {
	@Autowired
	SessionFactory sessionFactory;
	

	@Override
	public List<AuctionItemSelectBean> getProductSeqByAccountSeqNo(String account, Integer auctionSeqNo) {
			Session session = sessionFactory.getCurrentSession();
			return session.createQuery("FROM AuctionItemSelectBean WHERE account = :account and auctionSeqNo = :auctionSeqNo",AuctionItemSelectBean.class).setParameter("account", account).setParameter("auctionSeqNo", auctionSeqNo).list();
	}
	
	@Override
	public List<AuctionItemSelectBean> getAuctionByAuctionSeqNo(Integer auctionSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM AuctionItemSelectBean WHERE auctionSeqNo = :auctionSeqNo",AuctionItemSelectBean.class).setParameter("auctionSeqNo", auctionSeqNo).list();
	}

	@Override
	public List<AuctionItemSelectBean> getAuctionByProductSeqNo(Integer productSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM AuctionItemSelectBean WHERE productSeqNo = :productSeqNo",AuctionItemSelectBean.class).setParameter("productSeqNo", productSeqNo).list();
	}

	@Override
	public List<AuctionItemSelectBean> getAllLiveAuction() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM AuctionItemSelectBean",AuctionItemSelectBean.class).list();
	}

	@Override
	public List<AuctionItemSelectBean> getAuctionByAccount(String account) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM AuctionItemSelectBean WHERE account = :account",AuctionItemSelectBean.class).setParameter("account", account).list();
	}

	@Override
	public int saveAuction(AuctionItemSelectBean AuctionItemSelectBean) {
		Session session = sessionFactory.getCurrentSession();
		return (int) session.save(AuctionItemSelectBean);
	}

	@Override
	public void updateAuction(AuctionItemSelectBean AuctionItemSelectBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(AuctionItemSelectBean);
	}

	@Override
	public void deleteAuction(AuctionItemSelectBean AuctionItemSelectBean) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(AuctionItemSelectBean);
	}

	



}
