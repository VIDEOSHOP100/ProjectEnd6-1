package com.iii._19_.videoManage.model;

import java.io.File;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class VideoManageServiceImpl implements VideoManageService {
	@Autowired
	private VideoManageDAO videoManageDAO;

	@Override
	public List<VideoBean> getAllVideo() {
		return videoManageDAO.getAllVideo();
	}

	@Override
	public int saveVideo(VideoBean vb, String extImage, String extVideo, MultipartFile videoImage,
			MultipartFile videoFile) {
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		vb.setVideoUploadDate(now);
		int key = (int) videoManageDAO.saveVideo(vb);

		// 影片封面圖片資料夾路徑
		String videoImageFileFolderPath = "C:/resources/images/video/" + vb.getAccount();
		// 影片資料夾路徑
		String videoFileFolderPath = "C:/resources/videos/video/" + vb.getAccount();
		// 影片封面圖片檔案路徑
		String videoImageFilePath = "C:/resources/images/video/" + vb.getAccount() + "/" + vb.getAccount() + "_" + key
				+ extImage;
		// 影片檔案路徑
		String videoFilePath = "C:/resources/videos/video/" + vb.getAccount() + "/" + vb.getAccount() + "_" + key
				+ extVideo;

		vb.setVideoImageFilePath(videoImageFilePath);
		vb.setVideoFilePath(videoFilePath);
		vb.setVideoSeqNo(key);
		videoManageDAO.updateVideo(vb);
		saveVideoImageToFile(videoImageFileFolderPath, videoImageFilePath, videoImage);
		saveVideoToFile(videoFileFolderPath, videoFilePath, videoFile);
		return key;
	}

	@Override
	public void saveVideoImageToFile(String videoImageFileFolderPath, String videoImageFilePath,
			MultipartFile videoImage) {
		File imageFolder = new File(videoImageFileFolderPath);
		if (!imageFolder.exists()) {
			imageFolder.mkdirs();
		}
		// 將圖片寫入資料夾
		File imagefile = new File(videoImageFilePath);
		try {
			videoImage.transferTo(imagefile);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生意外");
		}
	}

	@Override
	public void saveVideoToFile(String videoFileFolderPath, String videoFilePath, MultipartFile videoFile) {
		File videoFolder = new File(videoFileFolderPath);
		if (!videoFolder.exists()) {
			videoFolder.mkdirs();
		}
		// 將影片寫入資料夾
		File videofile = new File(videoFilePath);
		try {
			videoFile.transferTo(videofile);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生意外");
		}
	}

	@Override
	public VideoBean getVideo(Integer videoSeqNo) {
		return videoManageDAO.getVideo(videoSeqNo);
	}

	@Override
	public void updateVideo(VideoBean vb) {
		videoManageDAO.updateVideo(vb);
	}

	@Override
	public void deleteVideo(VideoBean vb) {
		videoManageDAO.deleteVideo(vb);
	}

	@Override
	public List<VideoBean> getAllVideoByAccount(String account) {
		return videoManageDAO.getAllVideoByAccount(account);
	}

}
