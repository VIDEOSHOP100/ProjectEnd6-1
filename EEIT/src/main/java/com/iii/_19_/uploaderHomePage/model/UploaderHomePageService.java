package com.iii._19_.uploaderHomePage.model;

import java.util.List;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
import com.iii._19_.videoManage.model.VideoBean;

public interface UploaderHomePageService {
	public List<VideoBean> getUserAllVideos(String uploaderAccount);
	
	public List<ProductSaleBean> getUserAllProducts(String uploaderAccount);
	
	public List<InputLiveStreamTimeBean> getUserAllLiveStream(String uploaderAccount);
	
	public MemberBean getUserDetail(String uploaderAccount);
	
//	public List<ProductSaleBean> getUserHomePage();
	
	public List<VideoBean> getUserTopTwelveVideos(String uploaderAccount);
	
	public List<ProductSaleBean> getUserTopTwelveProducts(String uploaderAccount);
	
	public List<InputLiveStreamTimeBean> getUserTopTwelveLiveStream(String uploaderAccount);
}
