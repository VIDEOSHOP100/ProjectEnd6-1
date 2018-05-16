package com.iii._05_.AuctionItemSelect.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._05_.AuctionItemSelect.model.AuctionItemSelectBean;
import com.iii._05_.AuctionItemSelect.model.AuctionItemSelectService;
import com.iii._05_.Bid.model.BidBean;
import com.iii._05_.Bid.model.BidService;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeService;
import com.iii._05_.auctionEnd.model.AuctionEndBean;
import com.iii._05_.auctionEnd.model.AuctionEndService;
import com.iii._09_.addproduct.model.ProductBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleService;
import com.iii._19_.notificationSystem.model.NotificationSystemBean;

@Controller
public class AuctionItemSelectController {
	@Autowired
	AuctionItemSelectService auctionItemSelectService;
	
	@Autowired
	InputLiveStreamTimeService InputLiveStreamTimeService;
	@Autowired
	ProductSaleService productSaleService;
	
	@Autowired
	AuctionEndService auctionEndService;
	
	
	@Autowired
	BidService BidService;
	//關閉拍賣
	@RequestMapping(value = "/endAuction",method = RequestMethod.PUT)
	public @ResponseBody Map<String,String> closeAuction(
			@RequestParam("productSeqNo") Integer productSeqNo,
//			@RequestParam("LiveStreamHistorySeqNo") Integer LiveStreamHistorySeqNo,
			@RequestParam("auctionStatus") Integer auctionStatus,
			HttpSession session
			) throws SQLException {

//		List<LiveStreamHistoryBean> LiveStreamHistoryBeanList = LiveStreamHistoryService.getLiveStreamHistory(account, LiveStreamHistorySeqNo);
		
		ProductSaleBean pb = productSaleService.getOneProBySeqNos1(productSeqNo);
//		pb.getAuctionSeqNo();
		pb.setAuctionStatus(2);
		 
		productSaleService.update(pb);
		
		List<AuctionItemSelectBean> ab = auctionItemSelectService.getAuctionByAuctionSeqNo(pb.getAuctionSeqNo());
		for(AuctionItemSelectBean AuctionItemSelectBean: ab) {
			AuctionItemSelectBean.setAuctionStatus(2);
			auctionItemSelectService.updateAuction(AuctionItemSelectBean);
		}
		//--------------------------資料塞進AUCTIONEND----------------------------
		//取得BID(得標)BEAN
		BidBean BidAucBean = BidService.getBidByAuctionSeqNoBidprice(pb.getAuctionSeqNo());

		AuctionEndBean AuctionEndBean = new AuctionEndBean();
//				auctionEndService.getAuctionEndByProductSeqNo(productSeqNo);
			//取得+設置得標者帳號
			AuctionEndBean.setAccount(BidAucBean.getAccount());
			//取得+設置得標價格
			AuctionEndBean.setProPrice(BidAucBean.getBidPrice());
			//取得現在時間
			Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
			AuctionEndBean.setProTime(now);
			//取得+設置得標物ID
			AuctionEndBean.setProductSeqNo(BidAucBean.getProductSeqNo());
			auctionEndService.saveAuctionEnd(AuctionEndBean);
		
		Map<String, String> map = new HashMap<String,String>();
		map.put("status", "success");
		return map;
	}
	
	
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
	
//	@MessageMapping("proitem/{account}")
//	@SendTo("/target/proitem/subscription/{account}")
//	public ProductSaleBean showproitem(
//			ProductSaleBean ProductSaleBean,
//			@DestinationVariable("account") String account) {
//		
//
//		notificationSystemBean.setNotificationSeqNo(notificationSeqNo);
//		notificationSystemBean.setAccount(uploaderAccount);
//		System.out.println(notificationSystemBean);
//		return notificationSystemBean;
//	}
	
	
	@RequestMapping(value = "/Auction", method = RequestMethod.POST)
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
		int status = 0;
//		List<ProductSaleBean> AllProductList = productSaleService.getAllProByStatus(account, status);
//		
//		Map<Integer,String> productNameMap = new HashMap<Integer,String>(); 
//		for(ProductSaleBean pb : AllProductList) {
//			productNameMap.put(pb.getProductSeqNo(),pb.getProName());
//			ab.setProductSeqNo(pb.getProductSeqNo());
//		}
		
		ab.setAuctionStatus(1);
		ab.setAccount(account);
	
//		ab.setLiveStreamSeqNo(Integer.parseInt(target2));
		auctionItemSelectService.saveAuction(ab);
		
		ProductSaleBean Oneproduct = productSaleService.getOneProBySeqNo(ab.getProductSeqNo());
		
			Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
			
			Oneproduct.setAuctionStatus(1);
			Oneproduct.setProDate(now);
			Oneproduct.setAuctionPic(Integer.toString(Oneproduct.getProductSeqNo()));
			Oneproduct.setProPrice(ab.getProPrice());
			Oneproduct.setAuctionSeqNo(ab.getAuctionSeqNo());
			productSaleService.insert(Oneproduct);

		return "redirect:" + target;
	}
}
