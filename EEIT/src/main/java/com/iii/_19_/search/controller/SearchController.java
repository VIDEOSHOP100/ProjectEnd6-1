package com.iii._19_.search.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
import com.iii._19_.search.model.SearchService;
import com.iii._19_.videoManage.model.VideoBean;

@Controller
@RequestMapping("/search")
public class SearchController {
	@Autowired
	SearchService searchService;
	
	@RequestMapping(value = "/{queryString}" ,method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getSearchResultShort(@PathVariable("queryString") String queryString, HttpSession session){
		List<VideoBean> videoBeanList = searchService.getSearchVideoBean(queryString);
		List<ProductSaleBean> productSaleBeanList = searchService.getProductSaleBean(queryString);
		List<InputLiveStreamTimeBean> inputLiveStreamTimeBeanList = searchService.getSearchInputLiveStreamTimeBean(queryString);
		List<MemberBean> memberBeanList = searchService.getSearchMemberBean(queryString);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("videoBeanList", videoBeanList);
		map.put("productSaleBeanList", productSaleBeanList);
		map.put("inputLiveStreamTimeBeanList", inputLiveStreamTimeBeanList);
		map.put("memberBeanList", memberBeanList);
		return map;
	}
	
	@RequestMapping(value = "/type/{queryType}/{queryString}" ,method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getLiveStreamSearchResultShort(@PathVariable("queryType") String queryType,@PathVariable("queryString") String queryString, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		if(queryType.equals("liveStream")) {
			List<InputLiveStreamTimeBean> inputLiveStreamTimeBeanList = searchService.getTopFiftySearchInputLiveStreamTimeBean(queryString);
			map.put("topFiftyResult", inputLiveStreamTimeBeanList);
		}else if(queryType.equals("productSale")) {
			List<ProductSaleBean> productSaleBeanList = searchService.getTopFiftyProductSaleBean(queryString);
			map.put("topFiftyResult", productSaleBeanList);
		}else if(queryType.equals("video")) {
			List<VideoBean> videoBeanList = searchService.getTopFiftySearchVideoBean(queryString);
			map.put("topFiftyResult", videoBeanList);
		}else if(queryType.equals("member")) {
			List<MemberBean> memberBeanList = searchService.getTopFiftySearchMemberBean(queryString);
			map.put("topFiftyResult", memberBeanList);
		}
		return map;
	}
	
	@RequestMapping(value="all/{queryString}", method = RequestMethod.GET)
	public String getSearchPage(Map<String, Object> map, @PathVariable("queryString") String queryString) {
		List<VideoBean> videoBeanList = searchService.getTopFiftySearchVideoBean(queryString);
		List<ProductSaleBean> productSaleBeanList = searchService.getTopFiftyProductSaleBean(queryString);
		List<InputLiveStreamTimeBean> inputLiveStreamTimeBeanList = searchService.getTopFiftySearchInputLiveStreamTimeBean(queryString);
		List<MemberBean> memberBeanList = searchService.getTopFiftySearchMemberBean(queryString);
		map.put("videoBeanList", videoBeanList);
		map.put("productSaleBeanList", productSaleBeanList);
		map.put("inputLiveStreamTimeBeanList", inputLiveStreamTimeBeanList);
		map.put("memberBeanList", memberBeanList);
		return "search/search";
	}
}
