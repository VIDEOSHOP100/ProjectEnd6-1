package com.iii._19_.videoType.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii._19_.videoManage.model.VideoBean;


@Service
public class VideoTypeServiceImpl implements VideoTypeService {

	@Autowired
	VideoTypeDAO videoTypeDAO;
	
	@Override
	public List<List<VideoBean>> getAllVideoType() {
		List<VideoTypeBean> videoTypeBeanList = videoTypeDAO.getAllVideoType();
		List<List<VideoBean>> videoBeanNestedList = new ArrayList<List<VideoBean>>();
		
		List<VideoBean> videoBean = null;
		for(VideoTypeBean videoTypeBean : videoTypeBeanList) {
			videoBean = videoTypeDAO.getVideoType(videoTypeBean.getVideoType());
			videoBeanNestedList.add(videoBean);
		}
		
		return videoBeanNestedList;
	}

	@Override
	public List<VideoBean> getVideoType(String videoType) {
		return videoTypeDAO.getVideoType(videoType);
	}

	@Override
	public int saveVideoType(VideoTypeBean videoTypeBean) {
		return videoTypeDAO.saveVideoType(videoTypeBean);
	}

	@Override
	public void updateVideoType(VideoTypeBean videoTypeBean) {
		videoTypeDAO.updateVideoType(videoTypeBean);
	}

	@Override
	public void deleteVideoType(VideoTypeBean videoTypeBean) {
		videoTypeDAO.deleteVideoType(videoTypeBean);
	}

	@Override
	public List<VideoBean> getOneVideoTypeVideos(String videoType) {
		return videoTypeDAO.getOneVideoTypeVideos(videoType);
	}
	

}
