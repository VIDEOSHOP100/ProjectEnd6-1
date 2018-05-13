package com.iii._19_.messageImage.model;

public interface MessageImageDAO {
	public Integer saveMessageImage(MessageImageBean messageImageBean);

	public MessageImageBean selectMessageImageBySeqNo(Integer messageImageSeqNo);

	public void updateMessageImage(MessageImageBean messageImageBean);

	public void deleteMessageImage(MessageImageBean messageImageBean);
}
