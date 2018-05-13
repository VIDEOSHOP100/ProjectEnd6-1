package com.iii._19_.messageVideo.model;

public interface MessageVideoDAO {
	public Integer saveMessageVideo(MessageVideoBean messageVideoBean);

	public MessageVideoBean selectMessageVideoBySeqNo(Integer messageVideoSeqNo);

	public void updateMessageVideo(MessageVideoBean messageVideoBean);

	public void deleteMessageVideo(MessageVideoBean messageVideoBean);

}
