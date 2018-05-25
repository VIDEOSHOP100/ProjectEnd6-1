package com.iii._01_.VideoWall.service;

import java.util.List;

import com.iii._01_.VideoWall.bean.VideoWallBean;

public interface VideoWallService {
	public void saveAllVideoWall(List<VideoWallBean> list);

	public List<VideoWallBean> getAllVideoWall();
}
