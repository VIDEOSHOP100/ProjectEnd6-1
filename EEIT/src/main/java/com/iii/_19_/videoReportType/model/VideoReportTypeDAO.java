package com.iii._19_.videoReportType.model;

import java.util.List;

public interface VideoReportTypeDAO {
	public List<VideoReportTypeBean> getAllVideoReportType();
	
	public Integer saveVideoReportType(VideoReportTypeBean videoReportTypeBean);
	
	public void updateVideoReportType(VideoReportTypeBean videoReportTypeBean);
	
	public void deleteVideoReportType(VideoReportTypeBean videoReportTypeBean);
}
