package com.iii._19_.sticker.model;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;



@Service
public class StickerServiceImpl implements StickerService{
	
	@Autowired
	StickerDAO stickerDAO;
	
	@Override
	public List<StickerBean> getAllSticker() {
		return stickerDAO.getAllSticker();
	}

	@Override
	public StickerBean getStickerBySeqNo(Integer stickerSeqNo) {
		return stickerDAO.getStickerBySeqNo(stickerSeqNo);
	}

	@Override
	public int saveSticker(StickerBean stickerBean,String extImage,MultipartFile stickerImageFile) {
		
		
		Integer key = stickerDAO.saveSticker(stickerBean);
		String stickerFileFolderPath = "C:/resources/images/message/sticker/" + stickerBean.getStickerType();
		String stickerFilePath = "C:/resources/images/message/sticker/" + stickerBean.getStickerType() + "/" 
		+ key + extImage;
		stickerBean.setStickerFilePath(stickerFilePath);
		stickerBean.setStickerSeqNo(key);
		stickerDAO.updateSticker(stickerBean);
		saveImageToFile(stickerFileFolderPath,stickerFilePath,
				stickerImageFile);
		
		return key;
	}

	@Override
	public void updateSticker(StickerBean stickerBean) {
		stickerDAO.updateSticker(stickerBean);
	}

	@Override
	public void deleteSticker(StickerBean stickerBean) {
		stickerDAO.deleteSticker(stickerBean);
	}

	
	
	@Override
	public void saveImageToFile(String stickerFileFolderPath, String stickerFilePath,
			MultipartFile stickerImageFile) {
		File imageFolder = new File(stickerFileFolderPath);
		if (!imageFolder.exists()) {
			imageFolder.mkdirs();
		}
		// 將圖片寫入資料夾
		File imagefile = new File(stickerFilePath);
		try {
			stickerImageFile.transferTo(imagefile);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生意外");
		}
	}

}
