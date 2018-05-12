package com.iii._19_.videoManage.model;

import java.sql.SQLException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface VideoManageService {
	public List<VideoBean> getAllVideo();
	
	public List<VideoBean> getAllVideoByAccount(String account);

	public VideoBean getVideo(Integer videoSeqNo);
	
	public int saveVideo(VideoBean vb, String extImage, String extVideo, MultipartFile videoImage,
			MultipartFile videoFile);
	
	public void updateVideo(VideoBean vb);
	
	public void deleteVideo(VideoBean vb);
	
	public void saveVideoImageToFile(String videoImageFileFolderPath, String videoImageFilePath,MultipartFile videoImage);

	public void saveVideoToFile(String videoFileFolderPath, String videoFilePath,MultipartFile videoFile);
}
