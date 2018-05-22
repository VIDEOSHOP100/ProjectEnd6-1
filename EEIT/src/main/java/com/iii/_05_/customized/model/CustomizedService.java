package com.iii._05_.customized.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface CustomizedService {
public List<CustomizedBean> getAllByAccount(String account);
	
	public void saveCustomized(CustomizedBean CustomizedBean, String extPhoto,MultipartFile Photo);

	public CustomizedBean getCustomizedBySeqNo(int customizedSeqNo);
	
	public void updateCustomized(CustomizedBean CustomizedBean);

	public void deleteCustomized(CustomizedBean CustomizedBean);
	
	public void savePhotoToFile(String photoFileFolderPath, String photoFilePath, MultipartFile photo);
}
