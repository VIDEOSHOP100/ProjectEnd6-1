package com.iii._19_.messageVideo.model;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


@Service
public class MessageVideoServiceImpl implements MessageVideoService {

	@Autowired
	MessageVideoDAO messageVideoDAO;
	
	
	@Override
	public MessageVideoBean saveMessageVideo(MessageVideoBean messageVideoBean, String extImage,
			MultipartFile messageVideo) {
		Integer key = messageVideoDAO.saveMessageVideo(messageVideoBean);
		String messageImageFolderPath = "C:/resources/videos/message/video/" + messageVideoBean.getMessageVideoType();
		String messageImagePath = "C:/resources/videos/message/video/" + messageVideoBean.getMessageVideoType() + "/" 
		+ key + extImage;
		messageVideoBean.setMessageVideoPath(messageImagePath);
		messageVideoBean.setMessageVideoSeqNo(key);
		messageVideoDAO.updateMessageVideo(messageVideoBean);
		saveVideoToFile(messageImageFolderPath,messageImagePath,
				messageVideo);
		
		
		
		return messageVideoBean;
	}

	@Override
	public MessageVideoBean selectMessageVideoBySeqNo(Integer messageVideoSeqNo) {
		return messageVideoDAO.selectMessageVideoBySeqNo(messageVideoSeqNo);
	}

	@Override
	public void updateMessageVideo(MessageVideoBean messageVideoBean) {
		messageVideoDAO.updateMessageVideo(messageVideoBean);
	}

	@Override
	public void deleteMessageVideo(MessageVideoBean messageVideoBean) {
		messageVideoDAO.deleteMessageVideo(messageVideoBean);
	}

	@Override
	public void saveVideoToFile(String messageVideoFolderPath, String messageVideoPath, MultipartFile messageVideo) {
		File imageFolder = new File(messageVideoFolderPath);
		if (!imageFolder.exists()) {
			imageFolder.mkdirs();
		}
		// 將圖片寫入資料夾
		File imagefile = new File(messageVideoPath);
		try {
			messageVideo.transferTo(imagefile);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生意外");
		}
	}

}
