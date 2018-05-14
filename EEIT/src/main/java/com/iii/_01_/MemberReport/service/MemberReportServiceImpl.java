package com.iii._01_.MemberReport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii._01_.MemberReport.bean.MemberReportBean;
import com.iii._01_.MemberReport.dao.MemberReportDAO;

@Service
@Transactional
public class MemberReportServiceImpl implements MemberReportService {

	@Autowired
	MemberReportDAO dao;
	
	@Override
	public List<MemberReportBean> getAllMemberReport() {
		return dao.getAllMemberReportBean();
	}

	@Override
	public void saveMemberReportBean(MemberReportBean memberReportBean) {
		dao.saveMemberReportBean(memberReportBean);
	}

}
