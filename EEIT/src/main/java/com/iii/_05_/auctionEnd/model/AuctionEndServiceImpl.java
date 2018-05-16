package com.iii._05_.auctionEnd.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Transactional
@Service
public class AuctionEndServiceImpl implements AuctionEndService {

	@Autowired
	AuctionEndDAO AuctionEndDAO;
	
	
	@Override
	public List<AuctionEndBean> getProductSeqByAccountSeqNo(String account, Integer auctionEndSeqNo) {
		
		return AuctionEndDAO.getProductSeqByAccountSeqNo(account, auctionEndSeqNo);
	}

	@Override
	public List<AuctionEndBean> getAuctionEndByAuctionSeqNo(Integer auctionEndSeqNo) {
		
		return AuctionEndDAO.getAuctionEndByAuctionSeqNo(auctionEndSeqNo);
	}

	@Override
	public AuctionEndBean getAuctionEndByProductSeqNo(Integer productSeqNo) {
		
		return AuctionEndDAO.getAuctionEndByProductSeqNo(productSeqNo);
	}

	@Override
	public List<AuctionEndBean> getAllAuctionEnd() {
		
		return AuctionEndDAO.getAllAuctionEnd();
	}

	@Override
	public List<AuctionEndBean> getAuctionEndByAccount(String account) {
	
		return AuctionEndDAO.getAuctionEndByAccount(account);
	}

	@Override
	public int saveAuctionEnd(AuctionEndBean AuctionEndBean) {
		
		return AuctionEndDAO.saveAuctionEnd(AuctionEndBean);
	}

	@Override
	public void updateAuctionEnd(AuctionEndBean AuctionEndBean) {
	
		AuctionEndDAO.updateAuctionEnd(AuctionEndBean);
	}

	@Override
	public void deleteAuctionEnd(AuctionEndBean AuctionEndBean) {
		
		AuctionEndDAO.deleteAuctionEnd(AuctionEndBean);
	}

}
