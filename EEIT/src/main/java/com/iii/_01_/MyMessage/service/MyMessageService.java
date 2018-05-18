package com.iii._01_.MyMessage.service;

import java.util.List;

import com.iii._01_.MyMessage.bean.MyMessageBean;

public interface MyMessageService {

	List<MyMessageBean> getAllMyMessage(String account);

	MyMessageBean getMyMessageByMyMessageSeqNo(Integer myMessageSeqNo);

	void saveMyMessage(MyMessageBean myMessage);

	void deleteMyMessage(MyMessageBean myMessage);

	void updateMyMessage(MyMessageBean myMessage);

}
