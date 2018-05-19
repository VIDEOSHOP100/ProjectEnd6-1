package com.iii._01_.Member.service;

import java.io.File;
import java.sql.SQLException;
import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._01_.Member.dao.MemberDAO;

@Service
@Transactional
public class UpdateServiceImpl implements UpdateService {

	@Autowired
	MemberDAO dao;

	@Override
	public MemberBean getMemberBeanByAccount(String account) {
		MemberBean mb = dao.getMemberByAccount(account);
		return mb;
	}

	@Override
	public void updateMemberWithoutPhoto(MemberBean mb) throws SQLException {
		dao.updateMember(mb);
	}

	@Override
	public void updateMember(MemberBean mb, String extPhoto, MultipartFile Photo) throws SQLException {
		mb.setBan(false);
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		mb.setLastlogin(now);

		// 圖片路徑
		String photoFilePath = "C:/resources/images/members/" + mb.getAccount() + "/photo/" + mb.getAccount()
				+ extPhoto;
		// 圖片資料夾路徑
		String photoFileFolderPath = "C:/resources/images/members/" + mb.getAccount() + "/photo/";

		mb.setPhotoPath(photoFilePath);

		dao.updateMember(mb);
		savePhotoToFile(photoFileFolderPath, photoFilePath, Photo);
	}

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

}
