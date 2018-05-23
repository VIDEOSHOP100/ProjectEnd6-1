package com.iii._05_.customized.model;

import java.io.File;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
@Transactional
@Service
public class CustomizedServiceImpl implements CustomizedService {
	@Autowired
	CustomizedDAO CustomizedDAO;
	
	@Override
	public List<CustomizedBean> getAllByAccount(String account) {
		
		return CustomizedDAO.getAllByAccount(account);
	}

	@Override
	public void saveCustomized(CustomizedBean CustomizedBean, String extPhoto,MultipartFile Photo) {
		
//		return CustomizedDAO.saveCustomized(CustomizedBean);
		
		CustomizedBean.setCustomizedPic("");
		
		Integer ss = CustomizedDAO.saveCustomized(CustomizedBean);
		
		 
		CustomizedBean.setCustomizedSeqNo(ss);
		
		//圖片路徑
		String photoFilePath = "C:/resources/images/Desc/"+ CustomizedBean.getAccount() + "/" +  CustomizedBean.getCustomizedSeqNo() +"/"+  CustomizedBean.getCustomizedSeqNo()+ extPhoto;
		//圖片資料夾路徑
		String photoFileFolderPath = "C:/resources/images/Desc/"+ CustomizedBean.getAccount() +"/"+  CustomizedBean.getCustomizedSeqNo() ;
		
		CustomizedBean.setCustomizedPic(photoFilePath);
		
		CustomizedDAO.updateCustomized(CustomizedBean);
		
		
		savePhotoToFile(photoFileFolderPath , photoFilePath , Photo);
	}

	@Override
	public void updateCustomized(CustomizedBean CustomizedBean) {
		CustomizedDAO.updateCustomized(CustomizedBean);
		
	}

	@Override
	public void deleteCustomized(CustomizedBean CustomizedBean) {

		CustomizedDAO.deleteCustomized(CustomizedBean);
		
	}
	@Transactional
	@Override
	public void savePhotoToFile(String photoFileFolderPath, String photoFilePath, MultipartFile photo) {
		File photoFolder = new File(photoFileFolderPath);
		if (!photoFolder.exists()) {
			photoFolder.mkdirs();
		}
		File photofile = new File(photoFilePath);
		try {
			photo.transferTo(photofile);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生意外");
		}
	}

	@Override
	public CustomizedBean getCustomizedBySeqNo(int customizedSeqNo) {
		return CustomizedDAO.getCustomizedBySeqNo(customizedSeqNo);
	}

}
