package com.iii._01_.Friend.service;

import java.util.List;

import com.iii._01_.Friend.bean.FriendBean;
import com.iii._01_.Member.bean.MemberBean;

public interface FriendService {

	Integer getFriendStatus(String account1 ,String account2);
	
	void saveFriendRequest(FriendBean fb);
	
	void updateFriendRequest(FriendBean fb);
	
	FriendBean getFriendBeanByBothAccount(String account1 ,String account2);
	
	
	public List<FriendBean> getFriendByOneAccount(String account);
	
}
