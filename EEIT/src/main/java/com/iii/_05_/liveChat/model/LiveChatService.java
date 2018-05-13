package com.iii._05_.liveChat.model;

public interface LiveChatService {

	
	public Integer saveliveChat(LiveChatBean LiveChatBean);
	public LiveChatBean selectLiveChatBySeqNo(Integer LiveStreamSeqNo);
	
//	public List<LiveChatBean> selectMessageByAccountAndLiveStreamSeqNo(String account,Integer LiveStreamSeqNo);
	public void updateLiveChat(LiveChatBean LiveChatBean);
	
}
