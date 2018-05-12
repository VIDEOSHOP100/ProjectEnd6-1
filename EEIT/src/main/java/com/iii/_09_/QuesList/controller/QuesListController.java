package com.iii._09_.QuesList.controller;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.iii._09_.QuesList.model.QuesListBean;
import com.iii._09_.QuesList.model.QuesListService;




@Controller
public class QuesListController {
	
	@Autowired
	private QuesListService QLService;
	
	
	@ModelAttribute
	public void addQuesListBean(Map<String,Object> map) {
		map.put("QuesListBean", new QuesListBean());
	
	}
	
	//空的Bean裝資料
	@RequestMapping(value = "/uploadQuesList" ,method = RequestMethod.GET)
	public String getQuesListBean(Map<String,Object> map,HttpSession session) {	
		System.out.println("dsfdasfafd");
		return "QuesList/InsertQuesListSimple";
	}
	
	//上傳資料
	@RequestMapping(value = "/insertQuesList",method = RequestMethod.POST)
	public String insertProduct(
			@ModelAttribute("QuesListBean") QuesListBean qb,
			HttpSession session
			,HttpServletRequest request
			) throws SQLException {
		
		System.out.println("fdafda");

//		Timestamp ts = new java.sql.Timestamp(System.currentTimeMillis());
//		pro.setProDate(ts);

//		MultipartFile quesImage = pro.getProPic();
//		String originalFilename = quesImage.getOriginalFilename();
//		pro.setProPicPath(originalFilename);

		// 取出影片封面圖片副檔名
//		String extImage = originalFilename.substring(originalFilename.lastIndexOf("."));
//		ProductBean pro2 = proService.saveImage(pro, extImage, quesImage);
//		String rootDirectory = request.getSession().getServletContext().getRealPath("/");

	
		QLService.insert(qb);
	
//			request.setAttribute("insertok", mb2);
		System.out.println(qb);
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		return "_09_/success";
	}
	
	
	


}