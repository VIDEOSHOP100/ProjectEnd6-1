package com.iii._01_.VideoWall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii._01_.VideoWall.bean.VideoWallBean;
import com.iii._01_.VideoWall.dao.VideoWallDAO;

@Service
@Transactional
public class VideoWallServiceImpl implements VideoWallService {

	@Autowired
	VideoWallDAO dao;

	@Override
	public void saveAllVideoWall(List<VideoWallBean> list) {
		dao.deleteAllVideoWall();
		dao.saveAllVideoWall(list);
	}

	@Override
	public List<VideoWallBean> getAllVideoWall() {
		return dao.getAllVideoWall();
	}

}
