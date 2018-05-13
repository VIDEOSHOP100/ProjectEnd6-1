package com.iii._19_.messageFile.model;

public interface MessageFileDAO {
	public Integer saveMessageFile(MessageFileBean messageFileBean);
	public MessageFileBean selectMessageFileBySeqNo(Integer messageFileSeqNo);
	public void updateMessageFile(MessageFileBean messageFileBean);
	public void deleteMessageFile(MessageFileBean messageFileBean);
}
