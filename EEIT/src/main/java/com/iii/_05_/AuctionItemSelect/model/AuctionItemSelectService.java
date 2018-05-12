package com.iii._05_.AuctionItemSelect.model;

import java.util.List;

import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;

public interface AuctionItemSelectService {

	public List<InputLiveStreamTimeBean> getProductSeqByAccountSeqNo(String account, Integer auctionSeqNo);
	
	public List<AuctionItemSelectBean> getAuctionByAuctionSeqNo(Integer auctionSeqNo);
	
	public List<AuctionItemSelectBean> getAuctionByProductSeqNo(Integer productSeqNo);
	
	public List<AuctionItemSelectBean> getAllLiveAuction();
	
	public List<AuctionItemSelectBean> getAuctionByAccount(String account);
	
	public void saveAuction(AuctionItemSelectBean AuctionItemSelectBean);

	public void updateAuction(AuctionItemSelectBean AuctionItemSelectBean);

	public void deleteAuction(AuctionItemSelectBean AuctionItemSelectBean);
}
