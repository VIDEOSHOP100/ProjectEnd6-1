package com.iii._16_.ProductHot.model;

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
public class ProductHotService {
	@Autowired
	private ProductHotDaoImpl dao;
	@Transactional
	public ProductHotBean insert(ProductHotBean bean) throws SQLException {
		ProductHotBean result = null;
		if (bean != null) {
			result = dao.insert(bean);
			return result;
		}
		return null;
	}
	@Transactional
	public List<ProductHotBean> getALL() throws SQLException {
		List<ProductHotBean> resultlist = null;
		resultlist = dao.getALL();

		return resultlist;
	}
	@Transactional
	public ProductHotBean selectone(int seqno) throws SQLException {
		ProductHotBean result = null;
		result = dao.findbyPrimaryKey(seqno);
		if (result != null) {
			return result;
		}
		return null;
	}
	
	public ProductHotBean saveImage(ProductHotBean hb, String extImage, MultipartFile File) {
		// 影片封面圖片資料夾路徑
		String ImageFileFolderPath = "C:/resources/images/marketcover/" + File.getOriginalFilename();
		hb.setProductHotFilePath(ImageFileFolderPath);
		this.saveImageToFile(ImageFileFolderPath, File);

		return hb;
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
