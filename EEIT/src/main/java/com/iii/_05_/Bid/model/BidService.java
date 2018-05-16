package com.iii._05_.Bid.model;

import java.util.List;

public interface BidService {
	
	public BidBean getBidByAuctionSeqNoBidprice(Integer auctionSeqNo);
	
//	public BidBean getBidPriceTop(Integer productSeqNo);
	
	public List<BidBean> getBidByAuctionSeqNo(Integer auctionSeqNo);
	
	public List<BidBean> getBidByBidSeqNo(Integer bidSeqNo);
	
	public List<BidBean> getAllBid();

	public int saveBid(BidBean BidBean);

	public void updateBid(BidBean BidBean);

	public void deleteBid(BidBean BidBean);
}
