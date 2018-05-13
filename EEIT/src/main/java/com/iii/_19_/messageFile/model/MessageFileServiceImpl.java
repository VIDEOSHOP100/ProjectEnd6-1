package com.iii._19_.messageFile.model;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class MessageFileServiceImpl implements MessageFileService{

	@Autowired
	MessageFileDAO messageFileDAO;
	
	@Override
	public MessageFileBean saveMessageFile(MessageFileBean messageFileBean,String extFile,MultipartFile messageFile) {
		Integer key = messageFileDAO.saveMessageFile(messageFileBean);
		String messageImageFolderPath = "C:/resources/file/message/file/" + messageFileBean.getMessageFileType();
		String messageImagePath = "C:/resources/file/message/file/" + messageFileBean.getMessageFileType() + "/" 
		+ key + extFile;
		messageFileBean.setMessageFilePath(messageImagePath);
		messageFileBean.setMessageFileSeqNo(key);
		messageFileDAO.updateMessageFile(messageFileBean);
		saveFileToFile(messageImageFolderPath,messageImagePath,
				messageFile);
		
		
		
		return messageFileBean;
	}

	@Override
	public MessageFileBean selectMessageFileBySeqNo(Integer messageFileSeqNo) {
		return messageFileDAO.selectMessageFileBySeqNo(messageFileSeqNo);
	}

	@Override
	public void updateMessageFile(MessageFileBean messageFileBean) {
		messageFileDAO.updateMessageFile(messageFileBean);
	}

	@Override
	public void deleteMessageFile(MessageFileBean messageFileBean) {
		messageFileDAO.deleteMessageFile(messageFileBean);
	}
	@Override
	public void saveFileToFile(String messageFileFolderPath, String messageFilePath,
			MultipartFile messageFile) {
		File imageFolder = new File(messageFileFolderPath);
		if (!imageFolder.exists()) {
			imageFolder.mkdirs();
		}
		// 將圖片寫入資料夾
		File imagefile = new File(messageFilePath);
		try {
			messageFile.transferTo(imagefile);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生意外");
		}
	}
}
