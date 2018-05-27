package com.iii._05_.Bid.model;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iii._05_.InputLiveStreamTime.model.AllViewBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;
@Transactional
@Repository
public class BidDAOImpl implements BidDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public BidBean getBidByAuctionSeqNoBidprice(Integer auctionSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		
		return session.createQuery("FROM BidBean WHERE auctionSeqNo = :auctionSeqNo order by bidPrice desc", BidBean.class).setParameter("auctionSeqNo", auctionSeqNo).setMaxResults(1).uniqueResult();
	}

	
	@Override
	public List<BidBean> getBidByAuctionSeqNo(Integer auctionSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		
		return  session.createQuery("FROM BidBean WHERE auctionSeqNo = :auctionSeqNo",BidBean.class).setParameter("auctionSeqNo", auctionSeqNo).list();
	}

	@Override
	public List<BidBean> getBidByBidSeqNo(Integer bidSeqNo) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM BidBean WHERE bidSeqNo = :bidSeqNo",BidBean.class).setParameter("bidSeqNo", bidSeqNo).list();
	}

	@Override
	public List<BidBean> getAllBid() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM BidBean",BidBean.class).list();
	}

	@Override
	public int saveBid(BidBean BidBean) {
		Session session = sessionFactory.getCurrentSession();
		return (int) session.save(BidBean);
	}

	@Override
	public void updateBid(BidBean BidBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(BidBean);
	}

	@Override
	public void deleteBid(BidBean BidBean) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(BidBean);
	}

	@Override
	public List<AllBidBean> getAllBidByDay() {
		Session session = sessionFactory.getCurrentSession();
		return session.createNativeQuery("select day(bidtime) as day ,MAX(bidPrice)as maxPrice from Bid group by day(bidtime)").addEntity(AllBidBean.class)
					.list();
	}
	
	@Override
	public List<AllOrderCountBean> getAllorderQuantity() {
		Session session = sessionFactory.getCurrentSession();
		return session.createNativeQuery("select day(orderTime) as day ,COUNT(orderSeqNo) as orderQuantity from OrderList group by day(orderTime)").addEntity(AllOrderCountBean.class)
					.list();
	}
	
	
}
