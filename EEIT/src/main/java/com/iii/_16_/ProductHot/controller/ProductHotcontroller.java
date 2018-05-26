package com.iii._16_.ProductHot.controller;


import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.iii._16_.FAQ.bean.MemberFAQBean;
import com.iii._16_.ProductHot.model.ProductHotBean;
import com.iii._16_.ProductHot.model.ProductHotService;
import com.iii._19_.notificationSystem.model.NotificationSystemBean;


@Controller
public class ProductHotcontroller {
	
	@Autowired
	private ProductHotService hotproservice;
	@RequestMapping(value="/hot.do",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> insertHotProduct(
			@ModelAttribute("ProductHotBean") ProductHotBean hotbean,BindingResult result,
			HttpSession session) throws SQLException {
		Map<String,Object> map= new HashMap<String,Object>();
		 String[] suppressedFields = result.getSuppressedFields();
		 if (suppressedFields.length > 0) {
		 System.out.println("嘗試輸入不允許的欄位");
		 throw new RuntimeException("嘗試輸入不允許的欄位: " +
		 StringUtils.arrayToCommaDelimitedString(suppressedFields));
		 }
		 
		// 得到一個multipart文件 並取出檔名(originalFilename)
				// 副檔名(extImage)
				MultipartFile hotProImage = hotbean.getHotFile();
				String originalFilename = hotProImage.getOriginalFilename();
				hotbean.setProductHotFileName(originalFilename);

				// 取出影片封面圖片副檔名
				String extImage = originalFilename.substring(originalFilename.lastIndexOf("."));
				hotproservice.saveImage(hotbean, extImage, hotProImage);
				ProductHotBean ddd = hotproservice.insert(hotbean);
				System.out.println(hotbean);
		return map ;
	}
	@RequestMapping(value="/findAllHot",method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> findAllHot() throws SQLException{
		Map<String,Object> map= new HashMap<String,Object>();
		List<ProductHotBean> AllHot = hotproservice.getAllByStatus(1);
		map.put("HotProduct", AllHot);
		return map;
	}
	@RequestMapping(value = "/deleteHot",method=RequestMethod.POST)
	public String updateproductHot(@ModelAttribute("DelHotBean") ProductHotBean HotBean) throws SQLException {
		int SeqNo = HotBean.getProductHotSeqNo();
		ProductHotBean realBean = hotproservice.selectone(SeqNo);
		realBean.setProductStatus(2);
		hotproservice.deleteProductFromCart(realBean);
		return "OK";
	}
}
