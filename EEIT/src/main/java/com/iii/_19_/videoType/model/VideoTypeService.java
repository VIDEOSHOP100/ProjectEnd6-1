package com.iii._19_.videoType.model;

import java.util.List;

import com.iii._19_.videoManage.model.VideoBean;

public interface VideoTypeService {
	
	public List<List<VideoBean>> getAllVideoType();
	
	public List<VideoBean> getVideoType(String videoType);
	
	public int saveVideoType(VideoTypeBean videoTypeBean);
	
	public void updateVideoType(VideoTypeBean videoTypeBean);
	
	public void deleteVideoType(VideoTypeBean videoTypeBean);
	
	public List<VideoBean> getOneVideoTypeVideos(String videoType);
	
	public List<VideoTypeBean> getVideoTypeBeanList();
	
	public VideoTypeBean getVideoTypeBySeqNo(Integer videoSeqNo);
	
}
