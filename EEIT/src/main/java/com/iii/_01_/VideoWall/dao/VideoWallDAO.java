package com.iii._01_.VideoWall.dao;

import java.util.List;

import com.iii._01_.VideoWall.bean.VideoWallBean;

public interface VideoWallDAO {

	public void saveAllVideoWall(List<VideoWallBean>list);
	
	public List<VideoWallBean> getAllVideoWall();
	
	public void deleteAllVideoWall();
}
