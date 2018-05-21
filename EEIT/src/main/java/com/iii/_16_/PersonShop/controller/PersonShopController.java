package com.iii._16_.PersonShop.controller;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._16_.FAQ.bean.MemberFAQBean;
import com.iii._16_.PersonShop.bean.PersonShopBean;
import com.iii._16_.PersonShop.service.PersonShopService;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleService;

@Controller
public class PersonShopController {
	@Autowired
	private PersonShopService pshopService;
	@Autowired
	private ProductSaleService productservice;
	@Autowired
	ServletContext context;

	@ModelAttribute
	public void getShopBean(Map<String, Object> map) {
		PersonShopBean Pshopbean = new PersonShopBean();
		map.put("PersonShopBean", Pshopbean);
		System.out.println("here is shopbean");
	}

	@RequestMapping(value = "Pshop.do", method = RequestMethod.GET)
	public String getProductId(Map<String, Object> map, @ModelAttribute("MemberBean") MemberBean mb,
			@ModelAttribute("PersonShopBean") PersonShopBean psb, HttpSession session) {
		MemberBean bean = (MemberBean) session.getAttribute("LoginOK");
		System.out.println(bean);
		System.out.println("here is pshop.do");
		return "/PersonShop/addPShopForm";

	}

	@RequestMapping(value = "/addPersonShop", method = RequestMethod.POST)
	public String addQues(@ModelAttribute("PersonShopBean") PersonShopBean psb, BindingResult result,
			HttpServletRequest request) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			System.out.println("嘗試輸入不允許的欄位");
			throw new RuntimeException("嘗試輸入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}

		// imestamp ts = new java.sql.Timestamp(System.currentTimeMillis());
		// mb.setMemQuesTime(ts);

		// 得到一個multipart文件 並取出檔名(originalFilename)
		// 副檔名(extImage)
		MultipartFile quesImage = psb.getPersonShopFile();
		String originalFilename = quesImage.getOriginalFilename();
		psb.setPersonShopCoverFileName(originalFilename);

		// 取出影片封面圖片副檔名
		String extImage = originalFilename.substring(originalFilename.lastIndexOf("."));
		PersonShopBean psb2 = pshopService.saveImage(psb, extImage, quesImage);
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		System.out.println(psb);
		try {
			pshopService.insert(psb);
			request.setAttribute("hereisurshop", psb);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "uploaderHomePage/uploaderHomePage";
	}

	// @RequestMapping("/PersonShopHome")
	// public String getPersonShopHome() {
	// return null;
	// }

	@RequestMapping(value = "/goPersonHomePage/{account}", method = RequestMethod.GET)
	public String goPersonHomePage(@PathVariable String account,Map<String, Object> map, HttpSession session) throws SQLException {
		
		List<PersonShopBean> shoplist = pshopService.getBeanByAccount(account);
		List<ProductSaleBean> productlist = productservice.getByAccount(account);
		map.put("personshopbean", account);
		map.put("productbean", productlist);

		return "PersonShop/PersonShopHomePage";
	}

}
