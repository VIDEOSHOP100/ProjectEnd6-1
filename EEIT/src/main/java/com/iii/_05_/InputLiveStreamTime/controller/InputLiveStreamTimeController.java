package com.iii._05_.InputLiveStreamTime.controller;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._05_.AuctionItemSelect.model.AuctionItemSelectBean;
import com.iii._05_.Bid.model.BidBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeService;
import com.iii._05_.liveStreamHistory.model.LiveStreamHistoryBean;
import com.iii._05_.liveStreamHistory.model.LiveStreamHistoryService;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleService;


@Controller
//@RequestMapping("InputLiveStreamTime")
public class InputLiveStreamTimeController {

	@Autowired 	
	InputLiveStreamTimeService InputLiveStreamTimeService;
	@Autowired
	LiveStreamHistoryService LiveStreamHistoryService;
	@Autowired
	ProductSaleService productSaleService;
	
//	@RequestMapping("/LiveStream")
//	public String getLiveStreamsBySeqNo(@RequestParam("LiveNo") Integer LiveNo,Model model) {
//		
//		
////		List<InputLiveStreamTimeBean> InputLiveStreamTimeBeanList =  InputLiveStreamTimeService.getLiveStreamsByStreamName(streamName);
//		
//		model.addAttribute("LiveStream", InputLiveStreamTimeService.getLiveStreamsBySeqNo(LiveNo));
//		
//		return "LiveStreamRoom/LiveStreamRoom";
//	}
//直播間
	@RequestMapping(value = "/LiveStream/{LiveStreamSeqNo}", method = RequestMethod.GET)
	public String getLiveStream(@PathVariable("LiveStreamSeqNo") Integer LiveStreamSeqNo, Map<String, Object> map, HttpSession session) throws SQLException {
		//無帳號為訪客
		MemberBean memberBean = (MemberBean) session.getAttribute("LoginOK");
		String account = null;
		
		if(memberBean==null) {
		account = "visitor";
		}else {
		account = memberBean.getAccount();
		}
		
		
		//瀏覽紀錄
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		LiveStreamHistoryBean LiveStreamHistoryBean = new LiveStreamHistoryBean( 0,account,LiveStreamSeqNo, now,  "1");
		LiveStreamHistoryService.saveLiveStreamHistory(LiveStreamHistoryBean);
		InputLiveStreamTimeBean InputLiveStreamTimeBean = InputLiveStreamTimeService.getLiveStreamsBySeqNo(LiveStreamSeqNo);
		
		 
		InputLiveStreamTimeBean.setLiveStreamView(InputLiveStreamTimeBean.getLiveStreamView()+1);
		InputLiveStreamTimeService.updateLiveStreams(InputLiveStreamTimeBean);
		//產品 get product by account
		int status = 1;
		InputLiveStreamTimeBean gpa = InputLiveStreamTimeService.getLiveStreamsBySeqNo(LiveStreamSeqNo);
		
		List<ProductSaleBean> AllProduct = productSaleService.getAllProByStatus(gpa.getAccount(), status);
		for(ProductSaleBean pb :AllProduct ) {
			pb.getPicSeqNo();
		}
//		map.put("hb", LiveStreamHistoryBean);
		map.put("AllProduct", AllProduct);
		map.put("sb", InputLiveStreamTimeService.getLiveStreamsBySeqNo(LiveStreamSeqNo));
		return "LiveStreamRoom/LiveStreamRoom";
	}
	
	@ModelAttribute("BidBean")
	public BidBean getBidBean() {
		System.out.println("BibBean here");
		return new BidBean();
	
	}
	@ModelAttribute("AuctionItemSelectBean")
	public AuctionItemSelectBean getAuctionItemSelectBean() {
		System.out.println("AuctionItemSelectBean here");
		return new AuctionItemSelectBean();
	
	}
//直播大廳
	@RequestMapping(value="/LiveStreamHall",method=RequestMethod.GET)
	public String getAllLiveStreamList(Map<String, Object> map, HttpSession session) {
		List<InputLiveStreamTimeBean> AllLiveStreamList = InputLiveStreamTimeService.getAllLiveStreams();
		map.put("AllLiveStream", AllLiveStreamList);
		
		return "LiveStreamHall/LiveStreamHall";
	}
//新增直播
	@RequestMapping(value="/InsertLiveStream",method=RequestMethod.GET)
	public String getInsertAllLiveStreamList(Map<String, Object> map, HttpSession session) throws SQLException {
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		
		List<InputLiveStreamTimeBean> AllLiveStreamList = InputLiveStreamTimeService.getAllLiveStreams();
//		List<LiveStreamHistoryBean> getHistory = LiveStreamHistoryService.getAllLiveStreamHistory(account);
//		map.put("getHistory", getHistory);
		int status = 0;
		List<ProductSaleBean> AllProductList = productSaleService.getAllProByStatus(account, status);
		
		Map<Integer,String> productNameMap = new HashMap<Integer,String>(); 
		for(ProductSaleBean pb : AllProductList) {
			productNameMap.put(pb.getProductSeqNo(),pb.getProName());
		}

		map.put("AllProductList", productNameMap);
		map.put("AllLiveStream", AllLiveStreamList);
		map.put("accountStream", InputLiveStreamTimeService.getLiveStreamsByAccount(account));
		map.put("AuctionItemSelectBean", new AuctionItemSelectBean());
		return "InsertLiveStream/InsertLiveStream";
	}
//關閉直播
	@RequestMapping(value = "/endLiveStream",method = RequestMethod.PUT)
	public @ResponseBody Map<String,String> updateLiveStream(
			@RequestParam("liveStreamSeqNo") Integer liveStreamSeqNo,
//			@RequestParam("LiveStreamHistorySeqNo") Integer LiveStreamHistorySeqNo,
			@RequestParam("liveStatus") String liveStatus,
			HttpSession session
			) {
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
//		List<LiveStreamHistoryBean> LiveStreamHistoryBeanList = LiveStreamHistoryService.getLiveStreamHistory(account, LiveStreamHistorySeqNo);
	
		List<InputLiveStreamTimeBean> InputLiveStreamTimeBeanList = InputLiveStreamTimeService.getLiveStreamByAccountSeqNo(account, liveStreamSeqNo);
		for(InputLiveStreamTimeBean InputLiveStreamTimeBean : InputLiveStreamTimeBeanList) {
			Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
			InputLiveStreamTimeBean.setLiveEnd(now);
			InputLiveStreamTimeBean.setLiveStatus(liveStatus);
			InputLiveStreamTimeService.updateLiveStreams(InputLiveStreamTimeBean);
		}
//
//		for(LiveStreamHistoryBean LiveStreamHistoryBean : LiveStreamHistoryBeanList) {
//			LiveStreamHistoryBean.setLiveStreamStatus(LiveStreamStatus);
//			LiveStreamHistoryService.updateLiveStreamHistory(LiveStreamHistoryBean);
//		}
		
		Map<String, String> map = new HashMap<String,String>();
		map.put("status", "success");
		return map;
	}
	

		
	
	
	
	
	
	@ModelAttribute("InputLiveStreamTimeBean")
	public InputLiveStreamTimeBean getInputLiveStreamTimeBean() {
		System.out.println("AuctionItemSelectBean here");
		return new InputLiveStreamTimeBean();
	
	}
	
	@RequestMapping(value = "/InsertLiveStream", method = RequestMethod.POST)
	public String InsertLiveStream(@ModelAttribute("InputLiveStreamTimeBean") InputLiveStreamTimeBean sb, BindingResult result,
			HttpServletRequest request,Map<String, Object> map)throws SQLException{

	
		
		
		HttpSession session = request.getSession();
		String target = (String) session.getAttribute("target");
		target = target.substring(target.lastIndexOf("/EEIT/") + 5);
		System.out.println("target="+target);
		
		
//		Map<String, String> BidErrorMessage = new HashMap<String, String>();
//		session.setAttribute("BidErrorMap", BidErrorMessage);
			
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		List<InputLiveStreamTimeBean> InputLiveStreamTimeBeanList = InputLiveStreamTimeService.getLiveStreamByAccount(account);
		boolean aa = false;
		for(InputLiveStreamTimeBean InputLiveStreamTimeBean: InputLiveStreamTimeBeanList) {
			if(InputLiveStreamTimeBean.getLiveEnd()==null) {
				
				aa=true;
			
			}
				
		}
		
		if(aa == false) {
			MultipartFile photo = sb.getPhoto();
		String originalPhotoName = photo.getOriginalFilename();
		sb.setLiveCoverName(originalPhotoName);
		String extPhoto = originalPhotoName.substring(originalPhotoName.lastIndexOf("."));
		sb.setVideoSeqNo(1);
		sb.setLiveStatus(Integer.toString(1));
		sb.setAccount(account);
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		sb.setLiveStart(now);
//		ab.setLiveStreamSeqNo(Integer.parseInt(target2));
		
	
		String streampath = sb.getLiveStreamPath();
		String pppath = streampath.substring(streampath.lastIndexOf("=")+1);
	
		
		sb.setLiveStreamPath(pppath);
		sb.setLiveStreamView(0);
		map.put("sb", sb);
		InputLiveStreamTimeService.saveLiveStreams(sb, extPhoto, photo);
		
		return "LiveStreamRoom/LiveStreamRoom";
		}else {
			return "InsertLiveStream/InsertLiveStream";
		}
			
	
	}
	
//	@RequestMapping(method = RequestMethod.GET)
//	public String getAllLiveStreams() {
//		List<InputLiveStreamTimeBean> InputLiveStreamTimeBeanList = InputLiveStreamTimeService.getAllLiveStreams();
//		return "OK";
//	}
	
//	@RequestMapping(value = "{account}",method = RequestMethod.GET)
//	public String getLiveStreamByAccount(String account) {
//		List<InputLiveStreamTimeBean> InputLiveStreamTimeBeanList =  InputLiveStreamTimeService.getLiveStreamByAccount(account);
//		return "OK";
//	}
	
	
//	@RequestMapping(value="/EndLiveStream",method=RequestMethod.POST)
//	public String EndLiveStream(@PathVariable("LiveStreamSeqNo") Integer LiveStreamSeqNo,Map<String, Object> map, HttpSession session) {
//		
//		InputLiveStreamTimeBean InputLiveStreamTimeBean = InputLiveStreamTimeService.getLiveStreamsBySeqNo(LiveStreamSeqNo);
//		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
//		InputLiveStreamTimeBean.setLiveEnd(now);
//		
//		InputLiveStreamTimeService.updateLiveStreams(InputLiveStreamTimeBean);
//		return "EndLiveStreamSuccess/EndLiveStreamSuccess";
//	}

	
}
