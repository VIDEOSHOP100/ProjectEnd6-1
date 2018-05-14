package com.iii._01_.MemberReport.service;

import java.util.List;

import com.iii._01_.MemberReport.bean.MemberReportBean;

public interface MemberReportService {

	public List<MemberReportBean> getAllMemberReport();

	public void saveMemberReportBean(MemberReportBean memberReportBean);

	public MemberReportBean getMemberReportBeanBymemberReportSeqNo(Integer memberReportSeqNo);
}
