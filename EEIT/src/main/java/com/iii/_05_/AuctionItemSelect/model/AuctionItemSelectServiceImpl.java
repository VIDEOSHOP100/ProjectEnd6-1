package com.iii._05_.AuctionItemSelect.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeDAO;
@Service
public class AuctionItemSelectServiceImpl implements AuctionItemSelectService {

	@Autowired
	AuctionItemSelectDAO AuctionItemSelectDAO;
	
	@Autowired 
	InputLiveStreamTimeDAO InputLiveStreamTimeDAO;
	
	@Override
	public List<InputLiveStreamTimeBean> getProductSeqByAccountSeqNo(String account, Integer auctionSeqNo) {

		return InputLiveStreamTimeDAO.getLiveStreamByAccountSeqNo(account, auctionSeqNo);
	}

	
	@Transactional
	@Override
	public List<AuctionItemSelectBean> getAuctionByAuctionSeqNo(Integer auctionSeqNo) {
		
		return AuctionItemSelectDAO.getAuctionByAuctionSeqNo(auctionSeqNo);
	}
	@Transactional
	@Override
	public List<AuctionItemSelectBean> getAuctionByProductSeqNo(Integer productSeqNo) {
		
		return AuctionItemSelectDAO.getAuctionByProductSeqNo(productSeqNo);
	}
	@Transactional
	@Override
	public List<AuctionItemSelectBean> getAllLiveAuction() {
		return AuctionItemSelectDAO.getAllLiveAuction();
	}
	@Transactional
	@Override
	public List<AuctionItemSelectBean> getAuctionByAccount(String account) {

		return AuctionItemSelectDAO.getAuctionByAccount(account);
	}
	@Transactional
	@Override
	public void saveAuction(AuctionItemSelectBean AuctionItemSelectBean) {
		
//		Integer ss = AuctionItemSelectDAO.saveAuction(AuctionItemSelectBean);
//		
//		 
//		AuctionItemSelectBean.setAuctionSeqNo(ss);

		AuctionItemSelectDAO.updateAuction(AuctionItemSelectBean);
		
	}
	@Transactional
	@Override
	public void updateAuction(AuctionItemSelectBean AuctionItemSelectBean) {
		AuctionItemSelectDAO.updateAuction(AuctionItemSelectBean);
		
	}
	@Transactional
	@Override
	public void deleteAuction(AuctionItemSelectBean AuctionItemSelectBean) {
		AuctionItemSelectDAO.deleteAuction(AuctionItemSelectBean);
		
	}

}
