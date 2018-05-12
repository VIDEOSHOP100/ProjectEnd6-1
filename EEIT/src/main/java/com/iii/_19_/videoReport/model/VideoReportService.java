package com.iii._19_.videoReport.model;

import java.util.List;

public interface VideoReportService {
	public List<VideoReportBean> getVideoReportByAccountAndVideoSeqNo(String account, Integer videoSeqNo);
	
	public List<VideoReportBean> getAllVideoReport();
	
	public List<VideoReportBean> getAllPendingVideoReport();
	 
	public List<VideoReportBean> getAllVideoReport(String account);
	
	public Integer saveVideoReport(VideoReportBean videoReportBean);
	
	public void updateVideoReport(VideoReportBean videoReportBean);
	
	public void deleteVideoReport(VideoReportBean videoReportBean);
}
