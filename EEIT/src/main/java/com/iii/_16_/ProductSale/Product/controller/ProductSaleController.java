package com.iii._16_.ProductSale.Product.controller;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._16_.FAQ.bean.MemberFAQBean;
import com.iii._16_.PersonShop.bean.PersonShopBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleService;
import com.iii._16_.ProductSale.ProductPicture.model.ProPicBean;
import com.iii._16_.ProductSale.ProductPicture.model.ProPicService;

@Controller
public class ProductSaleController {
	@Autowired
	private ProductSaleService productservice;
	@Autowired
	private ProPicService picservice;
	@Autowired
	ServletContext context;

	@ModelAttribute
	public void getFormBean(Map<String, Object> map) {
		ProductSaleBean psbbean = new ProductSaleBean();
		map.put("productSaleBean", psbbean);
		System.out.println("here is salebean");
	}

	@RequestMapping(value = "/sale.do", method = RequestMethod.GET)
	public String createProduct(Map<String, Object> map, @ModelAttribute("MemberBean") MemberBean mb,
			@ModelAttribute("productSaleBean") ProductSaleBean psb, HttpSession session) {
		MemberBean bean = (MemberBean) session.getAttribute("LoginOK");
		
		if(bean==null) {
			
			return "pleaselogin";
		}
		return "Product/addProductForm";
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String ProductFormComing(@ModelAttribute("ProductSaleBean") ProductSaleBean psb, BindingResult result,
			HttpServletRequest request,HttpSession session) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			System.out.println("嘗試輸入不允許的欄位");
			throw new RuntimeException("嘗試輸入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		
		Timestamp ts = new java.sql.Timestamp(System.currentTimeMillis());
		psb.setProDate(ts);
		psb.setAuctionStatus(0);
		// 得到一個multipart文件 並取出檔名(originalFilename)
		// 副檔名(extImage)
		ProPicBean picBean = new ProPicBean();
		int getSeqNo = 0;
		int getpicSeqNo = 0;
		MultipartFile quesImage = psb.getPicFile();
		String originalFilename = quesImage.getOriginalFilename();
	

		// 取出影片封面圖片副檔名
		String extImage = originalFilename.substring(originalFilename.lastIndexOf("."));
		try {
			getSeqNo = productservice.insertGetId(psb);
			ProductSaleBean completebean = productservice.getBySeqNo(getSeqNo);
			
			String PicPath = picservice.saveImage(picBean, extImage, quesImage,completebean);
			ProPicBean havepicbean = new ProPicBean(0, 1, originalFilename, PicPath, getSeqNo);
			getpicSeqNo = picservice.insertGetId(havepicbean);
			psb.setPicSeqNo(getpicSeqNo);
			productservice.update(psb);
			session.setAttribute("createOK", completebean );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "Product/productSuccess";
	}
}
