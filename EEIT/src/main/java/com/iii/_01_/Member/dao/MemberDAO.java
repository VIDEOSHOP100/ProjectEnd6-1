package com.iii._01_.Member.dao;

import java.sql.SQLException;
import java.util.List;

import com.iii._01_.Member.bean.MemberBean;




public interface MemberDAO {

	MemberBean getMemberByAccount(String account);

	MemberBean getMemberByEmail(String email);
	
	List<MemberBean> getAllMember();

	MemberBean saveMember(MemberBean bean) throws SQLException;

	void deleteMember(String account);

	void updateMember(MemberBean bean) throws SQLException;
	
	

}