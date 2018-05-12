package com.iii._01_.Manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii._01_.Manager.bean.ManagerBean;
import com.iii._01_.Manager.dao.ManagerDAO;
import com.iii._01_.Member.bean.MemberBean;

@Service
@Transactional
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	ManagerDAO managerdao;

	@Override
	public ManagerBean managerLoginCheck(String managerID, String managerPwd) {

		ManagerBean mb = managerdao.getManagerById(managerID);
		if (mb != null && managerPwd.equals(mb.getManagerPwd())) {
			return mb;
		}
		return null;
	}

	@Override
	public void banMemberByAccount(String account) {

	}

	@Override
	public void deleteProductByProductSeqNo(Integer ProductSeqNo) {

	}

	@Override
	public void deleteVideoByVideoSeqNo(Integer VideoSeqNo) {

	}

}
