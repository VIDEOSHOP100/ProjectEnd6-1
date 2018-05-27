package com.iii._05_.InputLiveStreamTime.controller;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONStringer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.iii._01_.Member.bean.MemberBean;
import com.iii._05_.AuctionItemSelect.model.AuctionItemSelectBean;
import com.iii._05_.Bid.model.BidBean;
import com.iii._05_.InputLiveStreamTime.model.AllViewBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeDAO;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeService;
import com.iii._05_.customized.model.CustomizedBean;
import com.iii._05_.customized.model.CustomizedService;
import com.iii._05_.liveStreamHistory.model.LiveStreamHistoryBean;
import com.iii._05_.liveStreamHistory.model.LiveStreamHistoryService;
import com.iii._05_.liveStreamReport.model.liveStreamReportBean;
import com.iii._05_.liveStreamReport.model.liveStreamReportDAO;
import com.iii._05_.liveStreamReport.model.liveStreamReportService;
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
	@Autowired
	liveStreamReportService liveStreamReportService;
	@Autowired
	CustomizedService CustomizedService;
	@Autowired
	InputLiveStreamTimeDAO  InputLiveStreamTimeDAO;
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
		
		
//		//瀏覽紀錄
//		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
//		LiveStreamHistoryBean LiveStreamHistoryBean = new LiveStreamHistoryBean( 0,account,LiveStreamSeqNo, now,  "1");
//		LiveStreamHistoryService.saveLiveStreamHistory(LiveStreamHistoryBean);
//		InputLiveStreamTimeBean InputLiveStreamTimeBean = InputLiveStreamTimeService.getLiveStreamsBySeqNo(LiveStreamSeqNo);
//		
//		 
//		InputLiveStreamTimeBean.setLiveStreamView(InputLiveStreamTimeBean.getLiveStreamView()+1);
//		InputLiveStreamTimeService.updateLiveStreams(InputLiveStreamTimeBean);
		//產品 get product by account
		int status = 1;
		InputLiveStreamTimeBean gpa = InputLiveStreamTimeService.getLiveStreamsBySeqNo(LiveStreamSeqNo);
		
		List<ProductSaleBean> AllProduct = productSaleService.getAllProByStatus(gpa.getAccount(), status);
		for(ProductSaleBean pb :AllProduct ) {
			pb.getPicSeqNo();
		}
		List<ProductSaleBean> AllProduct0 = productSaleService.getAllProByStatus(gpa.getAccount(), 0);
		for(ProductSaleBean pb :AllProduct ) {
			pb.getPicSeqNo();
		}
		
		//新增拍賣產品選擇器(未拍賣)
		List<ProductSaleBean> AllProductListNoonsale = productSaleService.getAllProByStatus(gpa.getAccount(), 0);
		
		Map<Integer,String> productNameMapnoonsale = new HashMap<Integer,String>(); 
		for(ProductSaleBean pb : AllProductListNoonsale) {
			productNameMapnoonsale.put(pb.getProductSeqNo(),pb.getProName());
		}
		//BID產品選擇器
		List<ProductSaleBean> AllProductList = productSaleService.getAllProByStatus(gpa.getAccount(), status);
		
		Map<Integer,String> productNameMap = new HashMap<Integer,String>(); 
		for(ProductSaleBean pb : AllProductList) {
			productNameMap.put(pb.getProductSeqNo(),pb.getProName());
		}
		//增加一個CustomizedBean
		CustomizedBean CustomizedBean = new CustomizedBean();
		map.put("CustomizedBean", CustomizedBean);
		
		List<CustomizedBean> CustomizedList = CustomizedService.getAllByAccount(gpa.getAccount());
		
		//增加一個REPORTBean
		liveStreamReportBean liveStreamReportBean = new liveStreamReportBean();
		map.put("AllProduct0", AllProduct0);
		map.put("liveStreamReportBean", liveStreamReportBean);
		//未拍賣物品
		map.put("productNameMapnoonsale", productNameMapnoonsale);
		//拍賣中物品
		map.put("AllProductLista", productNameMap);
		//賣家資料的LIST
		map.put("CustomizedList", CustomizedList);
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
	
	
//後台圖表
	
	@RequestMapping(value="/backstageroll",method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> getAllLiveStreamListbk() {
		//查询数据  
		List<AllViewBean>  AllLiveStreamList = InputLiveStreamTimeDAO.getAllViewsByAccount();
		JSONArray myString = new JSONArray();
//		String aa = JSONArray.
//		         .put("JSON", AllLiveStreamList).toString();
		
		//-----------------------------------------------------------
		 int i=0;
		StringBuffer account=new StringBuffer();  
        StringBuffer views=new StringBuffer();  
        //格式化数据，格式为[time1,time2,....],[value1,value2,....]  
//        account.append("[");  
//        views.append("[");  
        for (AllViewBean locM : AllLiveStreamList) {  
        	account.append(locM.getAccount());  
        	views.append(locM.getViews());   
            //若为最后一个则不加逗号  
        	i++;
            if(i<AllLiveStreamList.size()){  
            	account.append(",");  
            	views.append(",");  
            }  
        }
        
//        account.append("]");  
//        views.append("]");  
        //--------------------------------------------------------
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("accountArray", account);
		map.put("viewsArray", views);
		System.out.println("安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰");
		System.out.println(map);
		System.out.println(account);
		System.out.println(views);
		System.out.println("安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰");
//		map.put("AllLiveStream", AllLiveStreamList);
//		JSONObject JSONObject = new JSONObject();
//		Map<String, Object> map = new HashMap<String, Object>();
//		JSONObject.put("AAA", myString);
//		System.out.println("安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰");
//		System.out.println(JSONObject);
//		System.out.println("安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰安泰");
//		
//		return JSONObject;
		return map;
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
		List<CustomizedBean> CustomizedList = CustomizedService.getAllByAccount(account);
		//增加一個CustomizedBean
				CustomizedBean CustomizedBean = new CustomizedBean();
				map.put("CustomizedBean", CustomizedBean);
		//給INSERTROOM REPORT
		liveStreamReportBean liveStreamReportBean = new liveStreamReportBean();
		map.put("CustomizedList", CustomizedList);
		map.put("liveStreamReportBean", liveStreamReportBean);
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
		sb.setAllLiveStreamView(0);
		map.put("sb", sb);
		InputLiveStreamTimeService.saveLiveStreams(sb, extPhoto, photo);
		//給INSERTROOM REPORT
		liveStreamReportBean liveStreamReportBean = new liveStreamReportBean();
		//增加一個CustomizedBean
				CustomizedBean CustomizedBean = new CustomizedBean();
				map.put("CustomizedBean", CustomizedBean);
				
				//新增拍賣產品選擇器(未拍賣)
				List<ProductSaleBean> AllProductListNoonsale = productSaleService.getAllProByStatus(account, 0);
				
				Map<Integer,String> productNameMapnoonsale = new HashMap<Integer,String>(); 
				for(ProductSaleBean pb : AllProductListNoonsale) {
					productNameMapnoonsale.put(pb.getProductSeqNo(),pb.getProName());
				}
				//未拍賣物品
				map.put("productNameMapnoonsale", productNameMapnoonsale);
				
		map.put("liveStreamReportBean", liveStreamReportBean);
		return "LiveStreamRoom/LiveStreamRoom";
		}else {
			return "LiveStreamRoom/LiveStreamRoom";
		}
			
	
	}
	//WEBSOCKET顯示觀看人數
	@MessageMapping(value="ShowHistory/{LiveStreamSeqNo}")
	@SendTo("/target/ShowHistory/subscription/{LiveStreamSeqNo}")
	public InputLiveStreamTimeBean HistorySocket(InputLiveStreamTimeBean lb,
			@DestinationVariable("LiveStreamSeqNo") Integer LiveStreamSeqNo
//			@DestinationVariable("account") String account
			) throws SQLException {
//		new LiveStreamHistoryBean( 0,account,LiveStreamSeqNo, now,  "1");
		//瀏覽紀錄
//		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
//		lb.setLiveStreamSeqNo(LiveStreamSeqNo);
//		lb.setHistoryTime(now);
//		lb.setLiveStreamStatus("1");
////		LiveStreamHistoryBean LiveStreamHistoryBean = LiveStreamHistoryService.
//		LiveStreamHistoryService.saveLiveStreamHistory(lb);
		InputLiveStreamTimeBean InputLiveStreamTimeBean = InputLiveStreamTimeService.getLiveStreamsBySeqNo(LiveStreamSeqNo);
		
		InputLiveStreamTimeBean.setAllLiveStreamView(InputLiveStreamTimeBean.getAllLiveStreamView()+1);
		InputLiveStreamTimeBean.setLiveStreamView(InputLiveStreamTimeBean.getLiveStreamView()+1);
		InputLiveStreamTimeService.updateLiveStreams(InputLiveStreamTimeBean);
		
		
		return InputLiveStreamTimeBean;
	}
	
	@MessageMapping(value="ShowEndHistory/{LiveStreamSeqNo}")
	@SendTo("/target/ShowEndHistory/subscription/{LiveStreamSeqNo}")
	public InputLiveStreamTimeBean HistoryEndSocket(InputLiveStreamTimeBean lb,
			@DestinationVariable("LiveStreamSeqNo") Integer LiveStreamSeqNo
//			@DestinationVariable("account") String account
			) throws SQLException {
//		new LiveStreamHistoryBean( 0,account,LiveStreamSeqNo, now,  "1");
		//瀏覽紀錄
//		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		
//		lb.setLiveStreamSeqNo(LiveStreamSeqNo);
//		lb.setHistoryTime(now);
//		lb.setLiveStreamStatus("1");
////		LiveStreamHistoryBean LiveStreamHistoryBean = LiveStreamHistoryService.
//		LiveStreamHistoryService.saveLiveStreamHistory(lb);
		InputLiveStreamTimeBean InputLiveStreamTimeBean = InputLiveStreamTimeService.getLiveStreamsBySeqNo(LiveStreamSeqNo);
		
		 if(InputLiveStreamTimeBean.getLiveStreamView()>0) {
			 
		 
		InputLiveStreamTimeBean.setLiveStreamView(InputLiveStreamTimeBean.getLiveStreamView()-1);
		InputLiveStreamTimeService.updateLiveStreams(InputLiveStreamTimeBean);
		 }
		
		return InputLiveStreamTimeBean;
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
