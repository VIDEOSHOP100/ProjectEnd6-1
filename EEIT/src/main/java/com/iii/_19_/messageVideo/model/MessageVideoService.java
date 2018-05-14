package com.iii._19_.messageVideo.model;

import org.springframework.web.multipart.MultipartFile;

public interface MessageVideoService {
	public MessageVideoBean saveMessageVideo(MessageVideoBean messageVideoBean, String extImage, MultipartFile messageVideo);

	public MessageVideoBean selectMessageVideoBySeqNo(Integer messageVideoSeqNo);

	public void updateMessageVideo(MessageVideoBean messageVideoBean);

	public void deleteMessageVideo(MessageVideoBean messageVideoBean);

	public void saveVideoToFile(String messageVideoFolderPath, String messageVideoPath,
			MultipartFile messageVideo);
}
