package com.iii._16_.PersonShop.service;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.iii._16_.FAQ.bean.MemberFAQBean;
import com.iii._16_.PersonShop.bean.PersonShopBean;
import com.iii._16_.PersonShop.dao.PersonShopDaoImpl;



@Service
public class PersonShopService {
	@Autowired
	private PersonShopDaoImpl dao;
	
	@Transactional
	public PersonShopBean insert(PersonShopBean bean) throws SQLException {
		PersonShopBean result = null;
		if (bean != null) {
			result = dao.insert(bean);
			return result;
		}
		return null;
	}
	@Transactional
	public List<PersonShopBean> getALL() throws SQLException {
		List<PersonShopBean> resultlist = null;
		resultlist = dao.getALL();

		return resultlist;
	}
	@Transactional
	public PersonShopBean select(PersonShopBean bean) throws SQLException {
		PersonShopBean result = null;
		result = dao.findbyPrimaryKey(bean);
		if (result != null) {
			return result;
		}
		return null;
	}
	@Transactional
	public List<PersonShopBean> getBeanByAccount(String account) {
		return dao.getAllShopByAccount(account);
	}
	
	
	public PersonShopBean saveImage(PersonShopBean psb, String extImage, MultipartFile File) {
		// 個人商店封面圖片資料夾路徑
		String ImageFileFolderPath = "C:/resources/images/" + psb.getPersonShopName() + "/" + File.getOriginalFilename();
		psb.setPersonShopCoverFilePath(ImageFileFolderPath);
		this.saveImageToFile(ImageFileFolderPath, File);

		return psb;
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
	@Transactional
	public PersonShopBean getById(PersonShopBean shopbean) throws SQLException {
		PersonShopBean bean = dao.findbyPrimaryKey(shopbean);
		return bean;
	}
	
}
