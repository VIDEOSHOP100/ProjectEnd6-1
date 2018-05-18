package com.iii._01_.MyMessage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii._01_.MyMessage.bean.MyMessageBean;
import com.iii._01_.MyMessage.dao.MyMessageDAO;

@Service
@Transactional
public class MyMessageServiceImpl implements MyMessageService {

	@Autowired
	MyMessageDAO dao;
	
	
	@Override
	public List<MyMessageBean> getAllMyMessage(String account) {
		return dao.getAllMyMessageByAccount(account);
	}

	@Override
	public MyMessageBean getMyMessageByMyMessageSeqNo(Integer myMessageSeqNo) {
		return dao.getMyMessageByMyMessageSeqNo(myMessageSeqNo);
	}

	@Override
	public void saveMyMessage(MyMessageBean myMessage) {
		dao.saveMyMessage(myMessage);

	}

	@Override
	public void deleteMyMessage(MyMessageBean myMessage) {
		dao.deleteMyMessage(myMessage);

	}

	@Override
	public void updateMyMessage(MyMessageBean myMessage) {
		dao.updateMyMessage(myMessage);

	}

}
