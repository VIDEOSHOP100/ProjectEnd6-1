package com.iii._19_.messageSystem.model;

import java.util.List;

public interface MessageSystemService {
	public Integer saveMessage(MessageBean messageBean);
	public MessageBean selectMessageBySeqNo(Integer messageSeqNo);
	public List<MessageBean> selectMessageByAccountAndReceiverAccount(String account, String receiverAccount);
	public void updateMessage(MessageBean messageBean);
}
