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
		System.out.println("aaa");
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
}
