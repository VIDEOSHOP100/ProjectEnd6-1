package com.iii._19_.search.model;

import java.util.List;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
import com.iii._19_.videoManage.model.VideoBean;

public interface SearchService {
	public List<VideoBean> getSearchVideoBean(String queryString);
	public List<MemberBean> getSearchMemberBean(String queryString);
	public List<InputLiveStreamTimeBean> getSearchInputLiveStreamTimeBean(String queryString);
	public List<ProductSaleBean> getProductSaleBean(String queryString);
	
	public List<VideoBean> getTopFiftySearchVideoBean(String queryString);
	public List<MemberBean> getTopFiftySearchMemberBean(String queryString);
	public List<InputLiveStreamTimeBean> getTopFiftySearchInputLiveStreamTimeBean(String queryString);
	public List<ProductSaleBean> getTopFiftyProductSaleBean(String queryString);
}
