package com.iii._19_.videoReport.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class VideoReportServiceImpl implements VideoReportService {

	@Autowired
	VideoReportDAO videoReportDAO;
	
	@Override
	public VideoReportBean getVideoReportByVideoReportSeqNo(Integer VideoReportSeqNo) {
		return videoReportDAO.getVideoReportByVideoReportSeqNo(VideoReportSeqNo);
	}
	
	
	@Override
	public List<VideoReportBean> getVideoReportByAccountAndVideoSeqNo(String account, Integer videoSeqNo) {
		return videoReportDAO.getVideoReportByAccountAndVideoSeqNo(account, videoSeqNo);
	}

	@Override
	public List<VideoReportBean> getAllVideoReport() {
		return videoReportDAO.getAllVideoReport();
	}

	@Override
	public List<VideoReportBean> getAllPendingVideoReport() {
		return videoReportDAO.getAllPendingVideoReport();
	}

	@Override
	public List<VideoReportBean> getAllVideoReport(String account) {
		return videoReportDAO.getAllVideoReport();
	}

	@Override
	public Integer saveVideoReport(VideoReportBean videoReportBean) {
		return videoReportDAO.saveVideoReport(videoReportBean);
	}

	@Override
	public void updateVideoReport(VideoReportBean videoReportBean) {
		videoReportDAO.updateVideoReport(videoReportBean);
	}

	@Override
	public void deleteVideoReport(VideoReportBean videoReportBean) {
		videoReportDAO.deleteVideoReport(videoReportBean);
	}


}
