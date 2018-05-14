package com.iii._19_.messageFile.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageFileServiceImpl implements MessageFileService{

	@Autowired
	MessageFileDAO messageFileDAO;
	
	@Override
	public Integer saveMessageFile(MessageFileBean messageFileBean) {
		return messageFileDAO.saveMessageFile(messageFileBean);
	}

	@Override
	public MessageFileBean selectMessageFileBySeqNo(Integer messageFileSeqNo) {
		return messageFileDAO.selectMessageFileBySeqNo(messageFileSeqNo);
	}

	@Override
	public void updateMessageFile(MessageFileBean messageFileBean) {
		messageFileDAO.updateMessageFile(messageFileBean);
	}

	@Override
	public void deleteMessageFile(MessageFileBean messageFileBean) {
		messageFileDAO.deleteMessageFile(messageFileBean);
	}

}
