package com.iii._01_.VideoWall.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii._01_.VideoWall.bean.VideoWallBean;

@Service
@Transactional
public class VideoWallServiceImpl implements VideoWallService {

	@Override
	public void saveAllVideoWall(List<VideoWallBean> list) {
		
	}

	@Override
	public List<VideoWallBean> getAllVideoWall() {

		return null;
	}

	
	
	
	
}
