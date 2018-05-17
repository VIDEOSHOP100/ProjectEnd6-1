package com.iii._01_.AdviceReport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii._01_.AdviceReport.bean.AdviceReportBean;
import com.iii._01_.AdviceReport.dao.AdviceReportDAO;

@Service
@Transactional
public class AdviceReportServiceImpl implements AdviceReportService {

	@Autowired
	AdviceReportDAO dao;
	
	
	@Override
	public void saveAdviceReport(AdviceReportBean adviceReportBean) {
	dao.saveAdviceReport(adviceReportBean);
		
	}

	@Override
	public void updateAdviceReport(AdviceReportBean adviceReportBean) {
	dao.updateAdviceReport(adviceReportBean);
		
	}

	@Override
	public List<AdviceReportBean> getAllAdviceReport() {
		return dao.getAllAdviceReport();
	}

	@Override
	public AdviceReportBean getAdviceReportByAdviceReportSeqNo(Integer AdviceReportSeqNo) {
		return dao.getAdviceReportByAdviceReportSeqNo(AdviceReportSeqNo);
	}



}
