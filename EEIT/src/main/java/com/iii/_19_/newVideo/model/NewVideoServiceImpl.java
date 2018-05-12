package com.iii._19_.newVideo.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii._19_.videoManage.model.VideoBean;

@Service
public class NewVideoServiceImpl implements NewVideoService{
	@Autowired
	NewVideoDAO newVideoDAO;

	@Override
	public List<VideoBean> getAllNewVideos() {
		return newVideoDAO.getAllNewVideos();
	}
	
}
