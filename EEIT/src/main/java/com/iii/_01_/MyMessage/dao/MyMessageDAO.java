package com.iii._01_.MyMessage.dao;

import java.util.List;

import com.iii._01_.MyMessage.bean.MyMessageBean;

public interface MyMessageDAO {

	List<MyMessageBean> getAllMyMessageByAccount(String account);
	
	MyMessageBean getMyMessageByMyMessageSeqNo(Integer myMessageSeqNo);
	
	void saveMyMessage(MyMessageBean myMessage);
	
	void deleteMyMessage(MyMessageBean myMessage);
	
	void updateMyMessage(MyMessageBean myMessage);
	
	
	
	
}
