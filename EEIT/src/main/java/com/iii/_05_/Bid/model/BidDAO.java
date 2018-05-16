package com.iii._05_.Bid.model;

import java.util.List;

import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;

public interface BidDAO {
	
	public BidBean getBidByAuctionSeqNoBidprice(Integer auctionSeqNo);
	
	public List<BidBean> getBidByAuctionSeqNo(Integer auctionSeqNo);
	
	public List<BidBean> getBidByBidSeqNo(Integer bidSeqNo);
	
	public List<BidBean> getAllBid();

	public int saveBid(BidBean BidBean);

	public void updateBid(BidBean BidBean);

	public void deleteBid(BidBean BidBean);
}
