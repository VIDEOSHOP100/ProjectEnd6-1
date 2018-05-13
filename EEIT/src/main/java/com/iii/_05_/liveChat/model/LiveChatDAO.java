package com.iii._05_.liveChat.model;

import java.util.List;



public interface LiveChatDAO {

	public Integer saveliveChat(LiveChatBean LiveChatBean);
	public LiveChatBean selectLiveChatBySeqNo(Integer LiveStreamSeqNo);
	
//	public List<LiveChatBean> selectMessageByAccountAndLiveStreamSeqNo(String account,Integer LiveStreamSeqNo);
	public void updateLiveChat(LiveChatBean LiveChatBean);
	
	
}
