package com.iii._05_.InputLiveStreamTime.model;

import java.security.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface InputLiveStreamTimeService {
	
	public InputLiveStreamTimeBean getLiveStreamsByAccount(String account);
	
	public List<InputLiveStreamTimeBean> getNewLiveSeqNo(String account);
	
	public List<InputLiveStreamTimeBean> getLiveStreamByAccountSeqNo(String account, Integer LiveStreamSeqNo);
	
	public List<InputLiveStreamTimeBean> getLiveStreamsByStreamName(String streamName);
	
	public InputLiveStreamTimeBean getLiveStreamsBySeqNo(int LiveStreamSeqNo);
	
	public List<InputLiveStreamTimeBean> getAllLiveStreamss();
	
	public List<InputLiveStreamTimeBean> getAllLiveStreams();
	
	public List<InputLiveStreamTimeBean> getLiveStreamByAccount(String account);
	
	public void saveLiveStreams(InputLiveStreamTimeBean InputLiveStreamTimeBean, String extPhoto,MultipartFile Photo);

	public void updateLiveStreams(InputLiveStreamTimeBean InputLiveStreamTimeBean);

	public void deleteLiveStreams(InputLiveStreamTimeBean InputLiveStreamTimeBean);

	public void savePhotoToFile(String photoFileFolderPath, String photoFilePath, MultipartFile photo);
	
	public List<InputLiveStreamTimeBean> getAllTopFiveLiveStreams();
}
