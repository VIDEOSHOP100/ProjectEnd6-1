package com.iii._19_.uploaderHomePage.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._05_.InputLiveStreamTime.model.InputLiveStreamTimeBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
import com.iii._19_.videoManage.model.VideoBean;


@Service
public class UploaderHomePageServiceImpl implements UploaderHomePageService {
	
	@Autowired
	UploaderHomePageDAO uploaderHomePageDAO;
	
	@Override
	public List<VideoBean> getUserAllVideos(String uploaderAccount) {
		return uploaderHomePageDAO.getUserAllVideos(uploaderAccount);
	}

	@Override
	public List<ProductSaleBean> getUserAllProducts(String uploaderAccount) {
		return uploaderHomePageDAO.getUserAllProducts(uploaderAccount);
	}

	@Override
	public List<InputLiveStreamTimeBean> getUserAllLiveStream(String uploaderAccount) {
		return uploaderHomePageDAO.getUserAllLiveStream(uploaderAccount);
	}

	@Override
	public MemberBean getUserDetail(String uploaderAccount) {
		return uploaderHomePageDAO.getUserDetail(uploaderAccount);
	}
	@Override
	public List<ProductSaleBean> getUserTopTwelveProducts(String uploaderAccount) {
		return uploaderHomePageDAO.getUserTopTwelveProducts(uploaderAccount);
	}
	
	@Override
	public List<VideoBean> getUserTopTwelveVideos(String uploaderAccount) {
		return uploaderHomePageDAO.getUserTopTwelveVideos(uploaderAccount);
	}
	@Override
	public List<InputLiveStreamTimeBean> getUserTopTwelveLiveStream(String uploaderAccount) {
		return uploaderHomePageDAO.getUserTopTwelveLiveStream(uploaderAccount);
	}
	
}
