package com.iii._19_.sticker.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._19_.sticker.model.StickerBean;
import com.iii._19_.sticker.model.StickerService;

@Controller
@RequestMapping("Sticker")
public class StickerController {
	@Autowired
	StickerService stickerService;
	
	@RequestMapping(value = "addSticker",method = RequestMethod.GET)
	public String getAddSticker(Map<String,Object> map) {
		map.put("stickerBean", new StickerBean());
		return "messageSystem/addSticker";
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getSticker() {
		List<StickerBean> stickerBeanList = stickerService.getAllSticker();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("stickerBeanList", stickerBeanList);
		return map; 
	}

	@RequestMapping(method = RequestMethod.POST)
	public String saveSticker(
			@ModelAttribute("stickerBean") StickerBean stickerBean
			) {
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		
		stickerBean.setStickerStatus("1");
		stickerBean.setStickerUploadDate(now);
		stickerBean.setStickerScore(0);
		stickerBean.setStickerType("dog");
		stickerBean.setStickerFilePath("");
		
		MultipartFile stickerImageFile = stickerBean.getStickerImage();
		String originalImageName = stickerImageFile.getOriginalFilename();
		stickerBean.setStickerFileName(originalImageName);
		
		String extImage = originalImageName.substring(originalImageName.lastIndexOf("."));
		
		Integer key = stickerService.saveSticker(stickerBean, extImage, stickerImageFile);
		return "redirect: Sticker/addSticker";
		
	}

	@RequestMapping(value = "put",method = RequestMethod.POST)
	public @ResponseBody Map<String,Integer> updateReplyCommentVideoLikeUnlike(
			@ModelAttribute("stickerBean") StickerBean stickerBean,
			HttpSession session
			) {
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		Map<String, Integer> map = new HashMap<String, Integer>();
		return map;
	}

	@RequestMapping(value = "{stickerSeqNo}",method = RequestMethod.DELETE)
	public String deleteSticker(@PathVariable("stickerSeqNo") Integer stickerSeqNo) {
		return "OK";
	}
}
