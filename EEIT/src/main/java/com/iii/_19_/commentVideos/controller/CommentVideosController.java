package com.iii._19_.commentVideos.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._19_.commentVideos.model.CommentVideosBean;
import com.iii._19_.commentVideos.model.CommentVideosService;

@Controller
@RequestMapping("CommentVideos")
public class CommentVideosController {
	
	@Autowired
	CommentVideosService commentVideosService;
	
	@RequestMapping(value = "{videoSeqNo}", method = RequestMethod.GET)
	public String getCommentVideosByVideo(Integer videoSeqNo) {
		List<CommentVideosBean> commentVideosBeanList =  commentVideosService.getCommentVideosByVideo(videoSeqNo);
		return "OK";
	}

	@RequestMapping(method = RequestMethod.GET)
	public String getAllCommentVideos() {
		List<CommentVideosBean> commentVideosBeanList = commentVideosService.getAllCommentVideos();
		return "OK";
	}

	@RequestMapping(value = "{videoSeqNo}/{account}",method = RequestMethod.GET)
	public String getCommentVideosByVideoAndAccount(Integer videoSeqNo, String account) {
		List<CommentVideosBean> commentVideosBeanList =  commentVideosService.getCommentVideosByVideoAndAccount(videoSeqNo, account);
		return "OK";
	}

//	@RequestMapping(value = "{commentVideoSeqNo}",method = RequestMethod.GET)
	public String getCommentVideosBySeqNo(Integer commentVideoSeqNo) {
		CommentVideosBean commentVideosBeanList = commentVideosService.getCommentVideosBySeqNo(commentVideoSeqNo);
		return "OK";
	}
	
	
	@RequestMapping(method = RequestMethod.POST, consumes={"application/json","application/xml"}, produces={"application/json","application/xml"})
	public @ResponseBody Map<String,Object> saveCommentVideos(@RequestBody CommentVideosBean commentVideosBean) {
		Integer key = commentVideosService.saveCommentVideos(commentVideosBean);
		commentVideosBean = commentVideosService.getCommentVideosBySeqNo(key);
		System.out.println("commentVideosBean = " + commentVideosBean);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("message", commentVideosBean);
		return map;
	}

	@RequestMapping(method = RequestMethod.PUT)
	public String updateCommentVideos(@ModelAttribute CommentVideosBean commentVideosBean) {
		commentVideosService.updateCommentVideos(commentVideosBean);
		return "OK";
	}

	@RequestMapping(method = RequestMethod.DELETE)
	public String deleteCommentsVideos(@ModelAttribute CommentVideosBean commentVideosBeans) {
		commentVideosService.deleteCommentsVideos(commentVideosBeans);
		return "OK";
	}
}
