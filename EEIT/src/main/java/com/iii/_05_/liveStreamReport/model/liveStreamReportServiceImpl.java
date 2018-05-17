package com.iii._05_.liveStreamReport.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Transactional
@Service
public class liveStreamReportServiceImpl implements liveStreamReportService {

	@Autowired
	liveStreamReportDAO liveStreamReportDAO;
	
	@Override
	public List<liveStreamReportBean> getAllReport() {
	
		return liveStreamReportDAO.getAllReport();
	}

	@Override
	public List<liveStreamReportBean> getAllReportBySeqNo(Integer liveStreamReportSeqNo) {
	
		return liveStreamReportDAO.getAllReportBySeqNo(liveStreamReportSeqNo);
	}

	@Override
	public liveStreamReportBean getOneReportBySeqNo(Integer liveStreamReportSeqNo) {
		
		return liveStreamReportDAO.getOneReportBySeqNo(liveStreamReportSeqNo);
	}

	@Override
	public List<liveStreamReportBean> getReportByToAccount(String accountTo) {
		
		return liveStreamReportDAO.getReportByToAccount(accountTo);
	}

	@Override
	public List<liveStreamReportBean> getReportByFromAccount(String accountFrom) {
		
		return liveStreamReportDAO.getReportByFromAccount(accountFrom);
	}

	@Override
	public int saveliveStreamReport(liveStreamReportBean liveStreamReportBean) {
		
		return liveStreamReportDAO.saveliveStreamReport(liveStreamReportBean);
	}

	@Override
	public void updateliveStreamReport(liveStreamReportBean liveStreamReportBean) {

		liveStreamReportDAO.updateliveStreamReport(liveStreamReportBean);
	}

	@Override
	public void deleteliveStreamReport(liveStreamReportBean liveStreamReportBean) {
		
		liveStreamReportDAO.deleteliveStreamReport(liveStreamReportBean);
	}

}
