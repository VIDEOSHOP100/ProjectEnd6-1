package com.iii._05_.Bid.controller;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._05_.AuctionItemSelect.model.AuctionItemSelectService;
import com.iii._05_.Bid.model.AllBidBean;
import com.iii._05_.Bid.model.AllOrderCountBean;
import com.iii._05_.Bid.model.BidBean;
import com.iii._05_.Bid.model.BidDAO;
import com.iii._05_.Bid.model.BidService;
import com.iii._05_.InputLiveStreamTime.model.AllViewBean;
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
	
	@Autowired
	BidDAO BidDAO;
	
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
	
	//後台圖表
	
		@RequestMapping(value="/bidbackstageroll",method=RequestMethod.GET)
		public @ResponseBody Map<String, Object> getAllLiveStreamListbk() {
			//查询数据  
			List<AllBidBean>  AllLiveStreamList = BidDAO.getAllBidByDay();

			//-----------------------------------------------------------
			 int i=0;
			StringBuffer day=new StringBuffer();  
	        StringBuffer maxPrice=new StringBuffer();  
	        //格式化数据，格式为[time1,time2,....],[value1,value2,....]  
//	        account.append("[");  
//	        views.append("[");  
	        for (AllBidBean locM : AllLiveStreamList) {  
	        	day.append(locM.getDay());  
	        	maxPrice.append(locM.getMaxPrice());   
	            //若为最后一个则不加逗号  
	        	i++;
	            if(i<AllLiveStreamList.size()){  
	            	day.append(",");  
	            	maxPrice.append(",");  
	            }  
	        }
	        
//	        account.append("]");  
//	        views.append("]");  
	        //--------------------------------------------------------
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("dayArray", day);
			map.put("maxPriceArray", maxPrice);
			System.out.println("安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰");
			System.out.println(map);
			System.out.println(day);
			System.out.println(maxPrice);
			System.out.println("安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰");
//			map.put("AllLiveStream", AllLiveStreamList);
//			JSONObject JSONObject = new JSONObject();
//			Map<String, Object> map = new HashMap<String, Object>();
//			JSONObject.put("AAA", myString);
//			System.out.println("安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰");
//			System.out.println(JSONObject);
//			System.out.println("安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰");
//			
//			return JSONObject;
			return map;
		}
		//伯恩後台圖表
		
		@RequestMapping(value="/orderbackstageroll",method=RequestMethod.GET)
		public @ResponseBody Map<String, Object> getAllOrderQuBk() {
			//查询数据  
			List<AllOrderCountBean>  AllOrderCountList = BidDAO.getAllorderQuantity();

			//-----------------------------------------------------------
			 int i=0;
			StringBuffer day=new StringBuffer();  
	        StringBuffer orderQuantity=new StringBuffer();  
	        //格式化数据，格式为[time1,time2,....],[value1,value2,....]  
//	        account.append("[");  
//	        views.append("[");  
	        for (AllOrderCountBean locM : AllOrderCountList) {  
	        	day.append(locM.getDay());  
	        	orderQuantity.append(locM.getOrderQuantity());   
	            //若为最后一个则不加逗号  
	        	i++;
	            if(i<AllOrderCountList.size()){  
	            	day.append(",");  
	            	orderQuantity.append(",");  
	            }  
	        }
	        
//	        account.append("]");  
//	        views.append("]");  
	        //--------------------------------------------------------
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("OrderdayArray", day);
			map.put("orderQuantityArray", orderQuantity);
			System.out.println("安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰");
			System.out.println(map);
			System.out.println(day);
			System.out.println(orderQuantity);
			System.out.println("安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰");
//			map.put("AllLiveStream", AllLiveStreamList);
//			JSONObject JSONObject = new JSONObject();
//			Map<String, Object> map = new HashMap<String, Object>();
//			JSONObject.put("AAA", myString);
//			System.out.println("安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰");
//			System.out.println(JSONObject);
//			System.out.println("安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰");
//			
//			return JSONObject;
			return map;
		}


}
