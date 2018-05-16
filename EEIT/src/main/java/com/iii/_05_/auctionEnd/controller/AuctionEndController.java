package com.iii._05_.auctionEnd.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._05_.AuctionItemSelect.model.AuctionItemSelectBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;
import com.iii._05_.auctionEnd.model.AuctionEndBean;
import com.iii._05_.auctionEnd.model.AuctionEndService;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;

@Controller
public class AuctionEndController {

	@Autowired
	AuctionEndService auctionEndService;
	
	@RequestMapping(value="/AuctionEnd",method=RequestMethod.GET)
	public String getInsertAllLiveStreamList(Map<String, Object> map, HttpSession session) throws SQLException {
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		List<AuctionEndBean> AllAuctionList = auctionEndService.getAuctionEndByAccount(account);
//		List<InputLiveStreamTimeBean> AllLiveStreamList = InputLiveStreamTimeService.getAllLiveStreams();
//		int status = 0;
//		List<ProductSaleBean> AllProductList = productSaleService.getAllProByStatus(account, status);
//		
//		Map<Integer,String> productNameMap = new HashMap<Integer,String>(); 
//		for(ProductSaleBean pb : AllProductList) {
//			productNameMap.put(pb.getProductSeqNo(),pb.getProName());
//		}
//
//		map.put("AllProductList", productNameMap);
		map.put("AllAuctionList", AllAuctionList);
//		map.put("accountStream", InputLiveStreamTimeService.getLiveStreamsByAccount(account));
//		map.put("AuctionItemSelectBean", new AuctionItemSelectBean());
		return "AuctionEnd/AuctionEnd";
	}
}
