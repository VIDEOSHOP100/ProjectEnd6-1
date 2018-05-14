package com.iii._05_.Bid.controller;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.iii._19_.videoManage.model.VideoBean;

@Controller
public class BidController {

	
	@Autowired
	BidService bidService;
	
	@Autowired
	AuctionItemSelectService AuctionItemSelectService;
	
	@RequestMapping(value = "/Bid", method = RequestMethod.POST)
	public String Bid(@ModelAttribute("BidBean") BidBean bb, BindingResult result,
			HttpServletRequest request) throws SQLException {

		System.out.println("進入/Bid");
 
		HttpSession session = request.getSession();
		String target = (String) session.getAttribute("target");
		target = target.substring(target.lastIndexOf("/EEIT/") + 5);

		Map<String, String> BidErrorMessage = new HashMap<String, String>();
		session.setAttribute("BidErrorMap", BidErrorMessage);
		
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		bb.setAccount(account);
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		bb.setBidTime(now);
		bb.setAuctionSeqNo(3);
		bidService.saveBid(bb);
		
		
		return "redirect:" + target;
	}
	

}
