package com.iii._19_.videoReportType.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VideoReportTypeServiceImpl implements VideoReportTypeService {

	@Autowired
	VideoReportTypeDAO videoReportTypeDAO;

	@Override
	public List<VideoReportTypeBean> getAllVideoReportType() {
		return videoReportTypeDAO.getAllVideoReportType();
	}

	@Override
	public Integer saveVideoReportType(VideoReportTypeBean videoReportTypeBean) {
		return videoReportTypeDAO.saveVideoReportType(videoReportTypeBean);
	}

	@Override
	public void updateVideoReportType(VideoReportTypeBean videoReportTypeBean) {
		videoReportTypeDAO.updateVideoReportType(videoReportTypeBean);
	}

	@Override
	public void deleteVideoReportType(VideoReportTypeBean videoReportTypeBean) {
		videoReportTypeDAO.deleteVideoReportType(videoReportTypeBean);
	}
}
