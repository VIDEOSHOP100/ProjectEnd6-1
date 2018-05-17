package com.iii._05_.liveStreamReport.model;

import java.util.List;

public interface liveStreamReportService {
	
	public 	List<liveStreamReportBean> getAllReport();
	
	public	List<liveStreamReportBean> getAllReportBySeqNo(Integer liveStreamReportSeqNo);
	
	public	liveStreamReportBean getOneReportBySeqNo(Integer liveStreamReportSeqNo);
	//你檢舉誰
	public 	List<liveStreamReportBean> getReportByToAccount(String accountTo);
	//誰檢舉你
	public 	List<liveStreamReportBean>	getReportByFromAccount(String accountFrom);
	
	public int saveliveStreamReport(liveStreamReportBean liveStreamReportBean);

	public void updateliveStreamReport(liveStreamReportBean liveStreamReportBean);

	public void deleteliveStreamReport(liveStreamReportBean liveStreamReportBean);
}
