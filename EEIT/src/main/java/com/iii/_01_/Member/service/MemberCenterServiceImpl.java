package com.iii._01_.Member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._01_.Member.dao.MemberDAO;

@Service
@Transactional
public class MemberCenterServiceImpl implements MemberCenterService {

	@Autowired
	MemberDAO dao;

	@Override
	public MemberBean getProfile(String account) {

		MemberBean bean = dao.getMemberByAccount(account);

		if (bean != null) {
			return bean;
		} else {
			return null;
		}

	}

}
