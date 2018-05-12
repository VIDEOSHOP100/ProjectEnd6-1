package com.iii._16_.FAQ.service;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.iii._16_.FAQ.bean.MemberFAQBean;
import com.iii._16_.FAQ.dao.MemberFAQDaoImpl;

@Service
public class MemberFAQService {
	@Autowired
	private MemberFAQDaoImpl dao;

	@Transactional
	public MemberFAQBean insert(MemberFAQBean bean) throws SQLException {
		MemberFAQBean result = null;
		if (bean != null) {
			result = dao.insert(bean);
			return result;
		}
		return null;
	}

	@Transactional
	public List<MemberFAQBean> getALL() throws SQLException {
		List<MemberFAQBean> resultlist = null;
		resultlist = dao.getALL();

		return resultlist;
	}

	@Transactional
	public MemberFAQBean select(MemberFAQBean bean) throws SQLException {
		MemberFAQBean result = null;
		result = dao.findbyPrimaryKey(bean);
		if (result != null) {
			return result;
		}
		return null;
	}
	
	public MemberFAQBean saveImage(MemberFAQBean mb, String extImage, MultipartFile File) {
		// 影片封面圖片資料夾路徑
		String ImageFileFolderPath = "C:/resources/images/" + mb.getAccount() + "/" + File.getOriginalFilename();
		mb.setMemFilePath(ImageFileFolderPath);
		this.saveImageToFile(ImageFileFolderPath, File);

		return mb;
	}

	public void saveImageToFile(String FileFolderPath, MultipartFile Image) {
		File imageFolder = new File(FileFolderPath);
		if (!imageFolder.exists()) {
			imageFolder.mkdirs();
		}
		// 將圖片寫入資料夾
		File imagefile = new File(FileFolderPath);
		try {
			Image.transferTo(imagefile);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生意外");
		}
	}

}
