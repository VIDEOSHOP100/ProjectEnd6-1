package com.iii._05_.Bid.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class BidServiceImpl implements BidService {

	@Autowired
	BidDAO BidDAO;
	@Transactional
	@Override
	public List<BidBean> getBidByAuctionSeqNo(Integer auctionSeqNo) {
		
		return BidDAO.getBidByAuctionSeqNo(auctionSeqNo);
	}
	@Transactional
	@Override
	public List<BidBean> getBidByBidSeqNo(Integer bidSeqNo) {

		return BidDAO.getBidByBidSeqNo(bidSeqNo);
	}
	@Transactional
	@Override
	public List<BidBean> getAllBid() {
		return BidDAO.getAllBid();
	}
	@Transactional
	@Override
	public int saveBid(BidBean BidBean) {

		return BidDAO.saveBid(BidBean);
	}
	@Transactional
	@Override
	public void updateBid(BidBean BidBean) {
		BidDAO.updateBid(BidBean);
		
	}
	@Transactional
	@Override
	public void deleteBid(BidBean BidBean) {
	
		BidDAO.deleteBid(BidBean);
	}

}
