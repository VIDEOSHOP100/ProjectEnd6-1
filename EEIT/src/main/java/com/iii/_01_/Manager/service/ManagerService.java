package com.iii._01_.Manager.service;

import com.iii._01_.Manager.bean.ManagerBean;

public interface ManagerService {

	public ManagerBean managerLoginCheck(String managerID , String managerPwd);
	
	public void banMemberByAccount(String account);
	
	public void deleteProductByProductSeqNo(Integer ProductSeqNo);
	
	public void deleteVideoByVideoSeqNo(Integer VideoSeqNo);
	
	
	
	
}
