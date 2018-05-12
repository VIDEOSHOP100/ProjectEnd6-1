package com.iii._16_.ProductSale.ProductPicture.model;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.iii._16_.PersonShop.bean.PersonShopBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;

@Service
public class ProPicService {
	@Autowired
	private ProPicDaoImpl dao;

	@Transactional
	public ProPicBean insert(ProPicBean bean) throws SQLException {
		ProPicBean result = null;
		if (bean != null) {
			result = dao.insert(bean);
			return result;
		}
		return null;
	}
	@Transactional
	public int insertGetId(ProPicBean bean) throws SQLException {
		int result = 0;
		if (bean != null) {
		result = dao.insertGetId(bean);
			return result;
		}
		return 0;
	}
	@Transactional
	public List<ProPicBean> getbyproductSeqNo(int productSeqNo) throws SQLException {
		return dao.findbyProductSeqNo(productSeqNo);
	}

	public String saveImage(ProPicBean picBean, String extImage, MultipartFile File, ProductSaleBean productbean) {
		// 個人商店封面圖片資料夾路徑
		String ImageFileFolderPath = "C:/resources/images/product/" + productbean.getAccount() + "/"
				+ File.getOriginalFilename();
		this.saveImageToFile(ImageFileFolderPath, File);
		return ImageFileFolderPath;
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
