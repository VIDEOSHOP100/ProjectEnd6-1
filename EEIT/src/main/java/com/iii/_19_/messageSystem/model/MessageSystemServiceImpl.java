package com.iii._19_.messageSystem.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageSystemServiceImpl implements MessageSystemService{
	@Autowired
	MessageSystemDAO messageSystemDAO;
	
	@Override
	public Integer saveMessage(MessageBean messageBean) {
		return messageSystemDAO.saveMessage(messageBean);
	}

	@Override
	public MessageBean selectMessageBySeqNo(Integer messageSeqNo) {
		return selectMessageBySeqNo(messageSeqNo);
	}

	@Override
	public List<MessageBean> selectMessageByAccountAndReceiverAccount(String account, String receiverAccount) {
		return messageSystemDAO.selectMessageByAccountAndReceiverAccount(account, receiverAccount);
	}

	@Override
	public void updateMessage(MessageBean messageBean) {
		messageSystemDAO.updateMessage(messageBean);
	}

}
