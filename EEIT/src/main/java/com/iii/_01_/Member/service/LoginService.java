package com.iii._01_.Member.service;

import com.iii._01_.Member.bean.MemberBean;

public interface LoginService {

	MemberBean checkIDPassword(String account, String password);
	
	public MemberBean getMemberByAccount(String account);
	
	public MemberBean getMemberByEmail(String email);
	
	public MemberBean updateLastLogin(MemberBean bean);
}