package com.iii._19_.sticker.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface StickerService {
	public List<StickerBean> getAllSticker();

	public StickerBean getStickerBySeqNo(Integer stickerSeqNo);

	public int saveSticker(StickerBean stickerBean,String extImage,MultipartFile stickerImageFile);

	public void updateSticker(StickerBean stickerBean);

	public void deleteSticker(StickerBean stickerBean);
	
	public void saveImageToFile(String stickerFileFolderPath, String stickerFilePath,
			MultipartFile stickerImageFile);
}
