package com.iii._05_.auctionEnd.model;

import java.util.List;



public interface AuctionEndDAO {
	public List<AuctionEndBean> getProductSeqByAccountSeqNo(String account, Integer auctionEndSeqNo);
	
	public List<AuctionEndBean> getAuctionEndByAuctionSeqNo(Integer auctionEndSeqNo);
	
	public AuctionEndBean getAuctionEndByProductSeqNo(Integer productSeqNo);
	
	public List<AuctionEndBean> getAllAuctionEnd();
	
	public List<AuctionEndBean> getAuctionEndByAccount(String account);
	
	public int saveAuctionEnd(AuctionEndBean AuctionEndBean);

	public void updateAuctionEnd(AuctionEndBean AuctionEndBean);

	public void deleteAuctionEnd(AuctionEndBean AuctionEndBean);
}
