package com.iii._19_.videoManage.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._19_.videoManage.model.VideoBean;
import com.iii._19_.videoManage.model.VideoManageService;
import com.iii._19_.videoReport.model.VideoReportBean;

@Controller
@RequestMapping("/videoManage")
public class VideoManageController {

	@Autowired
	VideoManageService videoManageService;

	@Autowired
	private SimpMessagingTemplate template;

	// @Autowired
	// private SimpMessagingTemplate template;
	// @RequestMapping("deletePage")
	// public String deletePage() {
	// return "/videoManage/videoDelete";
	// }

	@RequestMapping(value = "/{videoSeqNo}", method = RequestMethod.DELETE)
	public @ResponseBody String deleteVideo(@PathVariable("videoSeqNo") Integer videoSeqNo) {
		System.out.println("lalalalala");
		VideoBean vb = videoManageService.getVideo(videoSeqNo);
		videoManageService.deleteVideo(vb);

		return "OK";
	}

	@RequestMapping(value = "put", method = RequestMethod.POST)
	public @ResponseBody String updateVideo(@ModelAttribute("updateVideoBean") VideoBean vb, BindingResult result) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			System.out.println("嘗試輸入不允許的欄位");
			throw new RuntimeException("嘗試輸入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		VideoBean oldvb = videoManageService.getVideo(vb.getVideoSeqNo());
		if (!vb.getVideoDescription().equals("")) {
			oldvb.setVideoDescription(vb.getVideoDescription());
		}
		if (!vb.getVideoTitle().equals("")) {
			oldvb.setVideoTitle(vb.getVideoTitle());
		}
		if (!vb.getVideoType().equals("")) {
			oldvb.setVideoType(vb.getVideoType());
		}

		oldvb.setVideoStatus(vb.getVideoStatus());
		videoManageService.updateVideo(oldvb);
		String videoImageFileFolderPath = "C:/resources/images/video/" + vb.getAccount();
		MultipartFile imageFile;
		if ((imageFile = vb.getVideoImage()) != null) {
			videoManageService.saveVideoImageToFile(videoImageFileFolderPath, oldvb.getVideoImageFilePath(), imageFile);
		}
		return "ok";
	}

	@RequestMapping(value = "{videoSeqNo}", method = RequestMethod.GET)
	public String inputUpdate(@PathVariable("videoSeqNo") Integer videoSeqNo, Map<String, Object> map) {
		map.put("video", videoManageService.getVideo(videoSeqNo));
		return "videoManage/videoUpdate";
	}

	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody String saveVideo(@ModelAttribute("insertVideoBean") VideoBean vb, BindingResult result) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			System.out.println("嘗試輸入不允許的欄位");
			throw new RuntimeException("嘗試輸入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}

		// 取出影片封面圖片檔名
		MultipartFile videoImage = vb.getVideoImage();
		String originalImageName = videoImage.getOriginalFilename();
		vb.setVideoImageFileName(originalImageName);
		// 取出影片檔名
		MultipartFile videoFile = vb.getVideoFile();
		String originalFileName = videoFile.getOriginalFilename();
		vb.setVideoFileName(originalFileName);
		// 取出影片封面圖片副檔名
		String extImage = originalImageName.substring(originalImageName.lastIndexOf("."));
		// 取出影片副檔名
		String extVideo = originalFileName.substring(originalFileName.lastIndexOf("."));

		// 影片資料寫入資料庫
		int key = videoManageService.saveVideo(vb, extImage, extVideo, videoImage, videoFile);

//		NotificationSystemBean notificationSystemBean = new NotificationSystemBean(0, "aaaaa", "aaaa",
//				new Timestamp(1L), "1", "bob");
//		NotificationSystemController notificationSystemController = new NotificationSystemController();
		
		
		
//		this.template.convertAndSend("/notification/subscription/" + vb.getAccount(), "lalala");
		
		return "ok";
	}

	@RequestMapping(method = RequestMethod.GET)
	public String getVideos(Map<String, Object> map, HttpSession session) {
		MemberBean memberBean = (MemberBean) session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		map.put("videos", videoManageService.getAllVideoByAccount(account));
		return "videoManage/videoManage";
	}

	@ModelAttribute
	public void getVideoBeans(Map<String, Object> map, HttpSession session) {
		MemberBean memberBean = (MemberBean) session.getAttribute("LoginOK");
		VideoBean insertVideoBean = new VideoBean(null, null, 0, "", memberBean.getAccount(), "", "", "", null, 0, 0, 0,
				"1", "", "", "", "");
		VideoBean updateVideoBean = new VideoBean(null, null, 0, "", memberBean.getAccount(), "", "", "", null, 0, 0, 0,
				"1", "", "", "", "");
		map.put("insertVideoBean", insertVideoBean);
		map.put("updateVideoBean", updateVideoBean);
		
	}

}
