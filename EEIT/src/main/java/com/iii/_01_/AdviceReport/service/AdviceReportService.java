package com.iii._01_.AdviceReport.service;

import java.util.List;

import com.iii._01_.AdviceReport.bean.AdviceReportBean;

public interface AdviceReportService {

	public void saveAdviceReport(AdviceReportBean adviceReportBean);

	public void updateAdviceReport(AdviceReportBean adviceReportBean);

	public List<AdviceReportBean> getAllAdviceReport();

	public AdviceReportBean getAdviceReportByAdviceReportSeqNo(Integer AdviceReportSeqNo);
	
}
