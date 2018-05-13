package com.iii._19_.messageImage.model;

import org.springframework.web.multipart.MultipartFile;

public interface MessageImageService {

	public MessageImageBean saveMessageImage(MessageImageBean messageImageBean, String extImage, MultipartFile messageImage);

	public MessageImageBean selectMessageImageBySeqNo(Integer messageImageSeqNo);

	public void updateMessageImage(MessageImageBean messageImageBean);

	public void deleteMessageImage(MessageImageBean messageImageBean);

	public void saveImageToFile(String messageImageFolderPath, String messageImagePath,
			MultipartFile messageImage);

}
