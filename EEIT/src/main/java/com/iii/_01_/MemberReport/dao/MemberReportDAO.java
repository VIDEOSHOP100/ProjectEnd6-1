package com.iii._01_.MemberReport.dao;

import java.util.List;

import com.iii._01_.MemberReport.bean.MemberReportBean;

public interface MemberReportDAO {

	MemberReportBean getMemberReportBeanByMemberReportSeqNo(Integer MemberReportSeqNo);
	
	List<MemberReportBean> getAllMemberReportBean();
	
	void saveMemberReportBean(MemberReportBean memberReportBean);
	
	void updateMemberReportBean(MemberReportBean memberReportBean);
	
	void deleteMemberReportBean(Integer MemberReportSeqNo);
	
	
}
