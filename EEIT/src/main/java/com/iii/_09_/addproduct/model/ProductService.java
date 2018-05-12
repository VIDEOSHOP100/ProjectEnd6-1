package com.iii._09_.addproduct.model;

import java.io.File;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;



@Service
public class ProductService {
	
	@Autowired
	private ProductDaoImpl dao;
	
	@Transactional
	public ProductBean insert(ProductBean bean) throws SQLException {
		ProductBean result = null;
		if (bean != null) {
			result = dao.insert(bean);
			return result;
		}
		return null;
	}
	
	//抓取圖片
	public ProductBean saveImage(ProductBean bean, String extImage, MultipartFile File) {
		// 個人商店封面圖片資料夾路徑
		String ImageFileFolderPath = "C:/resources/images/" + bean.getProPic() + "/" + File.getOriginalFilename();
		bean.setProPicPath(ImageFileFolderPath);
		this.saveImageToFile(ImageFileFolderPath, File);

		return bean;
	}
	
	//儲存圖片至檔案夾
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
	public ProductBean select(ProductBean pro) throws SQLException {
		ProductBean result = null;
		result = dao.findbyPrimaryKey(pro);
		if (result != null) {
			return result;
		}
		return null;
	}
	

	
		
}
	


