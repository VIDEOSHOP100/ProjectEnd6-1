package com.iii._19_.search.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
import com.iii._19_.videoManage.model.VideoBean;

@Service
public class SearchServiceImpl implements SearchService{
	@Autowired
	SearchDAO searchDAO;

	@Override
	public List<VideoBean> getSearchVideoBean(String queryString) {
		return searchDAO.getSearchVideoBean(queryString);
	}

	@Override
	public List<MemberBean> getSearchMemberBean(String queryString) {
		return searchDAO.getSearchMemberBean(queryString);
	}

	@Override
	public List<InputLiveStreamTimeBean> getSearchInputLiveStreamTimeBean(String queryString) {
		return searchDAO.getSearchInputLiveStreamTimeBean(queryString);
	}

	@Override
	public List<ProductSaleBean> getProductSaleBean(String queryString) {
		return searchDAO.getProductSaleBean(queryString);
	}

	@Override
	public List<VideoBean> getTopFiftySearchVideoBean(String queryString) {
		return searchDAO.getTopFiftySearchVideoBean(queryString);
	}

	@Override
	public List<MemberBean> getTopFiftySearchMemberBean(String queryString) {
		return searchDAO.getTopFiftySearchMemberBean(queryString);
	}

	@Override
	public List<InputLiveStreamTimeBean> getTopFiftySearchInputLiveStreamTimeBean(String queryString) {
		return searchDAO.getSearchInputLiveStreamTimeBean(queryString);
	}

	@Override
	public List<ProductSaleBean> getTopFiftyProductSaleBean(String queryString) {
		return searchDAO.getTopFiftyProductSaleBean(queryString);
	}
	

}
