package com.iii._05_.liveChat.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LiveChatServiceImpl implements LiveChatService{

	@Autowired
	LiveChatDAO LiveChatDAO;

	@Override
	public Integer saveliveChat(LiveChatBean LiveChatBean) {
		
		return LiveChatDAO.saveliveChat(LiveChatBean);
	}

	@Override
	public LiveChatBean selectLiveChatBySeqNo(Integer LiveStreamSeqNo) {
		
		return LiveChatDAO.selectLiveChatBySeqNo(LiveStreamSeqNo);
	}

	@Override
	public void updateLiveChat(LiveChatBean LiveChatBean) {
		LiveChatDAO.updateLiveChat(LiveChatBean);
		
	}
	
	
	
}
