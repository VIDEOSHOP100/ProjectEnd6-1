package com.iii._05_.AuctionItemSelect.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._05_.AuctionItemSelect.model.AuctionItemSelectBean;
import com.iii._05_.AuctionItemSelect.model.AuctionItemSelectService;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeService;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleService;

@Controller
public class AuctionItemSelectController {
	@Autowired
	AuctionItemSelectService auctionItemSelectService;
	
	@Autowired
	InputLiveStreamTimeService InputLiveStreamTimeService;
	@Autowired
	ProductSaleService productSaleService;
	
	@RequestMapping(value="/Auction", method = RequestMethod.GET)
	public String getProAuction(Map<String, Object> map, HttpSession session) throws SQLException {
		
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		List<ProductSaleBean> AllProductList = productSaleService.getByAccount(account);
		
		Map<Integer,String> productNameMap = new HashMap<Integer,String>(); 
		for(ProductSaleBean pb : AllProductList) {
			productNameMap.put(pb.getProductSeqNo(),pb.getProName());
		}
		map.put("AllProductList", productNameMap);
		
		return "InsertLiveStream/InsertLiveStream";
	}
	
	
	
	
	@RequestMapping(value = "/Auction", method = RequestMethod.POST)
	@SendTo("/target/proshow/subscription/{liveStreamSeqNo}")
	public String Auction(@ModelAttribute("AuctionItemSelectBean") AuctionItemSelectBean ab, BindingResult result,
			HttpServletRequest request)throws SQLException{

 
		HttpSession session = request.getSession();
		String target = (String) session.getAttribute("target");
		target = target.substring(target.lastIndexOf("/EEIT/") + 5);
		System.out.println("target="+target);
		

		

//		Map<String, String> BidErrorMessage = new HashMap<String, String>();
//		session.setAttribute("BidErrorMap", BidErrorMessage);
		
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		InputLiveStreamTimeBean getseq = InputLiveStreamTimeService.getLiveStreamsByAccount(account);
		
//		List<InputLiveStreamTimeBean> InputLiveStreamTimeBeanList = InputLiveStreamTimeService.getNewLiveSeqNo(account);
		
//		for(InputLiveStreamTimeBean InputLiveStreamTimeBean: InputLiveStreamTimeBeanList) {
//		Integer livestreamseqno = InputLiveStreamTimeBean.getLiveStreamSeqNo();
//		InputLiveStreamTimeBean.setAccount(account);
//		}
		ab.setLiveStreamSeqNo(getseq.getLiveStreamSeqNo()); 

		List<ProductSaleBean> AllProductList = productSaleService.getByAccount(account);
		
		Map<Integer,String> productNameMap = new HashMap<Integer,String>(); 
		for(ProductSaleBean pb : AllProductList) {
			productNameMap.put(pb.getProductSeqNo(),pb.getProName());
			ab.setProductSeqNo(pb.getProductSeqNo());
		}
		
		ab.setAuctionStatus("1");
		ab.setAccount(account);
	
//		ab.setLiveStreamSeqNo(Integer.parseInt(target2));
		
		
		auctionItemSelectService.saveAuction(ab);
		
		
		return "redirect:" + target;
	}
}
