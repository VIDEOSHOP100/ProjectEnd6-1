package com.iii._01_.Member.service;

import java.sql.SQLException;
import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._01_.Member.dao.MemberDAO;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {

	@Autowired
	MemberDAO dao;

	@Override
	public MemberBean checkIDPassword(String account, String password) {

		// 透過變數dao，呼叫它的select()方法，要傳入參數 id。將傳回值放入變數
		// MemberBean mb 內。
		MemberBean mb = dao.getMemberByAccount(account);
		// 如果mb不等於 null 而且參數 password等於mb內的password) {
		if (mb != null && password.equals(mb.getPassword())) {
			// 傳回 mb物件，同時結束本方法
			return mb;
		}
		return null;
	}

	@Override
	public MemberBean getMemberByAccount(String account) {
		return dao.getMemberByAccount(account);
	}

	@Override
	public MemberBean getMemberByEmail(String email) {

		return dao.getMemberByEmail(email);

	}

	@Override
	public MemberBean updateLastLogin(MemberBean bean) {

		MemberBean oriBean =  dao.getMemberByAccount(bean.getAccount());
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		oriBean.setLastlogin(now);
		try {
			dao.updateMember(oriBean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return oriBean;
	}

}
