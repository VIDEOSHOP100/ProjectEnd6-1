package com.iii._19_.messageImage.model;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class MessageImageServiceImpl implements MessageImageService{

	@Autowired
	MessageImageDAO messageImageDAO;
	
	@Override
	public MessageImageBean saveMessageImage(MessageImageBean messageImageBean,String extImage,MultipartFile messageImage) {
		
		Integer key = messageImageDAO.saveMessageImage(messageImageBean);
		String messageImageFolderPath = "C:/resources/images/message/image/" + messageImageBean.getMessageImageType();
		String messageImagePath = "C:/resources/images/message/image/" + messageImageBean.getMessageImageType() + "/" 
		+ key + extImage;
		messageImageBean.setMessageImageFilePath(messageImagePath);
		messageImageBean.setMessageImageSeqNo(key);
		messageImageDAO.updateMessageImage(messageImageBean);
		saveImageToFile(messageImageFolderPath,messageImagePath,
				messageImage);
		
		
		
		return messageImageBean;
	}

	@Override
	public MessageImageBean selectMessageImageBySeqNo(Integer messageImageSeqNo) {
		return messageImageDAO.selectMessageImageBySeqNo(messageImageSeqNo);
	}

	@Override
	public void updateMessageImage(MessageImageBean messageImageBean) {
		messageImageDAO.updateMessageImage(messageImageBean);
	}

	@Override
	public void deleteMessageImage(MessageImageBean messageImageBean) {
		messageImageDAO.deleteMessageImage(messageImageBean);
	}
	
	
	@Override
	public void saveImageToFile(String messageImageFolderPath, String messageImagePath,
			MultipartFile messageImage) {
		File imageFolder = new File(messageImageFolderPath);
		if (!imageFolder.exists()) {
			imageFolder.mkdirs();
		}
		// 將圖片寫入資料夾
		File imagefile = new File(messageImagePath);
		try {
			messageImage.transferTo(imagefile);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生意外");
		}
	}

}
