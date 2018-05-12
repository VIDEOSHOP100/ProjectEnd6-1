package com.iii._01_.Friend.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii._01_.Friend.bean.FriendBean;
import com.iii._01_.Friend.dao.FriendDAO;
import com.iii._01_.Member.bean.MemberBean;

@Service
@Transactional
public class FriendServiceImpl implements FriendService {

	@Autowired
	FriendDAO dao;

	@Override
	public Integer getFriendStatus(String account1, String account2) {

		Integer result1 = dao.getFriendStatus(account1, account2);
		if(result1 ==null) {
			
		}
		Integer result2 = dao.getFriendStatus(account2, account1);
		
		if ((result1 == null && result2 == null)) {
			return 0;
		} else if(new Integer(1).equals(result1) ||new Integer(1).equals(result2) ){
			return 1;
		}else {
			return 0;
		}

	}

	@Override
	public void saveFriendRequest(FriendBean fb) {
		dao.saveFriendRequest(fb);
	}

	@Override
	public void updateFriendRequest(FriendBean fb) {
		dao.updateFriendRequest(fb);
	}

	@Override
	public FriendBean getFriendBeanByBothAccount(String account1, String account2) {
		FriendBean fb;
		if ((fb = dao.getFriendBeanByBothAccount(account1, account2)) != null) {
			return fb;
		} else if ((fb = dao.getFriendBeanByBothAccount(account2, account1)) != null) {
			return fb;
		} else {
			return null;
		}
	}

	@Override
	public List<FriendBean> getFriendByOneAccount(String account) {
		List<FriendBean> friendBeanListSend = dao.getFriendByOneAccountSend(account);
		List<FriendBean> friendBeanListTo = dao.getFriendByOneAccountTo(account);
		List<FriendBean> friendBeanListCombine = new ArrayList<FriendBean>();
		friendBeanListCombine.addAll(friendBeanListSend);
		friendBeanListCombine.addAll(friendBeanListTo);
		return friendBeanListCombine;
		
	}

}
