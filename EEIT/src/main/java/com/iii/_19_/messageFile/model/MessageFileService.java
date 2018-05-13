package com.iii._19_.messageFile.model;

import org.springframework.web.multipart.MultipartFile;

public interface MessageFileService {
	public MessageFileBean saveMessageFile(MessageFileBean messageFileBean,String extFile,MultipartFile messageFile);
	public MessageFileBean selectMessageFileBySeqNo(Integer messageFileSeqNo);
	public void updateMessageFile(MessageFileBean messageFileBean);
	public void deleteMessageFile(MessageFileBean messageFileBean);
	public void saveFileToFile(String messageFileFolderPath, String messageFilePath,
			MultipartFile messageFile);
}
