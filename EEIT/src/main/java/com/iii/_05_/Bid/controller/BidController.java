package com.iii._05_.Bid.controller;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._05_.AuctionItemSelect.model.AuctionItemSelectService;
import com.iii._05_.Bid.model.BidBean;
import com.iii._05_.Bid.model.BidService;
import com.iii._05_.liveChat.model.LiveChatBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleService;
import com.iii._19_.videoManage.model.VideoBean;

@Controller
public class BidController {

	
	@Autowired
	BidService bidService;
	
	@Autowired
	AuctionItemSelectService AuctionItemSelectService;
	
	@Autowired
	ProductSaleService ProductSaleService;
	
	@MessageMapping(value="Bid/{productSeqNo}")
	@SendTo("/target/Bid/subscription/{productSeqNo}")
	public BidBean BidSocket(@ModelAttribute("BidBean") BidBean bb,
			@DestinationVariable("productSeqNo") Integer productSeqNo
//			@DestinationVariable("account") String account
			) throws SQLException {
		ProductSaleBean pb = ProductSaleService.getBySeqNo(productSeqNo);
		//拿到此拍最高價
		ProductSaleBean pbmax = ProductSaleService.getOneProBySeqNos1(productSeqNo);
		BidBean	maxb = bidService.getBidByAuctionSeqNoBidprice(pbmax.getAuctionSeqNo());
			//目前喊價				當前出價
		if(maxb==null) {
			Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
			bb.setBidTime(now);
			//寫死 要改
			bb.setAuctionSeqNo(pb.getAuctionSeqNo());
			bidService.saveBid(bb);

		}else if((maxb.getBidPrice()<bb.getBidPrice())) {
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		bb.setBidTime(now);
		//寫死 要改
		bb.setAuctionSeqNo(pb.getAuctionSeqNo());
		bidService.saveBid(bb);

		}else {
		bb.setBidPrice(0);
		bb.setAccount("叫價請超過當前拍賣金額");

		}
		return bb;
	}
	
	
	
//	
//	@RequestMapping(value = "/Bid", method = RequestMethod.POST)
//	public String Bid(@ModelAttribute("BidBean") BidBean bb, BindingResult result,
//			HttpServletRequest request) throws SQLException {
//
//		System.out.println("進入/Bid");
// 
//		HttpSession session = request.getSession();
//		String target = (String) session.getAttribute("target");
//		target = target.substring(target.lastIndexOf("/EEIT/") + 5);
//
//		Map<String, String> BidErrorMessage = new HashMap<String, String>();
//		session.setAttribute("BidErrorMap", BidErrorMessage);
//		
//		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
//		String account = memberBean.getAccount();
//		bb.setAccount(account);
//		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
//		bb.setBidTime(now);
//		//寫死 要改
//		bb.setAuctionSeqNo(3);
//		bidService.saveBid(bb);
//		
//		
//		return "redirect:" + target;
//	}
//	

}
