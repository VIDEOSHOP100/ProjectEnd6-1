package com.iii._01_.Member.service;

import java.sql.SQLException;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.iii._01_.Member.bean.MemberBean;

public interface UpdateService {

	MemberBean getMemberBeanFromDB(String account);
	
	void updateMember(MemberBean mb, String extPhoto, MultipartFile Photo) throws SQLException;
	
	void savePhotoToFile(String photoFileFolderPath, String photoFilePath, MultipartFile photo);

}