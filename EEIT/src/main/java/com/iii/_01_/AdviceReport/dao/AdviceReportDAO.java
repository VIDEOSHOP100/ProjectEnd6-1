package com.iii._01_.AdviceReport.dao;

import java.util.List;

import com.iii._01_.AdviceReport.bean.AdviceReportBean;

public interface AdviceReportDAO {
	
	public void saveAdviceReport(AdviceReportBean adviceReportBean);
	public void updateAdviceReport(AdviceReportBean adviceReportBean);
	public List<AdviceReportBean>getAllAdviceReport();
	public AdviceReportBean getAdviceReportByAdviceReportSeqNo(Integer AdviceReportSeqNo);
	public void deleteAdviceReport(AdviceReportBean adviceReportBean);
	
	
}
