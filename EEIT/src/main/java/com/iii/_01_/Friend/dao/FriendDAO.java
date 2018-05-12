package com.iii._01_.Friend.dao;

import java.util.List;

import com.iii._01_.Friend.bean.FriendBean;
import com.iii._01_.Member.bean.MemberBean;

public interface FriendDAO {

	public void saveFriendRequest(FriendBean fb);
	
	public void updateFriendRequest(FriendBean fb);
	
	public Integer getFriendStatus(String accountSend ,String accountTo);
	
	public void deleteFriendRequest(FriendBean fb);
	
	public FriendBean getFriendBeanByBothAccount(String account1 ,String account2);
	
	
	public List<FriendBean> getFriendByOneAccountSend(String account);
	
	public List<FriendBean> getFriendByOneAccountTo(String account);
	
}
