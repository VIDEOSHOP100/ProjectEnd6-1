package com.iii._19_.replyCommentVideo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._19_.replyCommentVideo.model.ReplyCommentVideoBean;
import com.iii._19_.replyCommentVideo.model.ReplyCommentVideoService;

@Controller
@RequestMapping("replyCommentVideo")
public class ReplyCommentVideoController {

	@Autowired
	ReplyCommentVideoService replyCommentVideoService;
	
	@RequestMapping(value = "{commentVideoSeqNo}",method = RequestMethod.GET)
	public String getReplyCommentVideoByComment(@PathVariable Integer commentVideoSeqNo) {
		replyCommentVideoService.getReplyCommentVideoByComment(commentVideoSeqNo);
		return "OK";
	}

	@RequestMapping(method = RequestMethod.GET)
	public String getAllReplyCommentVideo() {
		replyCommentVideoService.getAllReplyCommentVideo();
		return "OK";
	}

	@RequestMapping(value = "{commentVideoSeqNo}/{account}",method = RequestMethod.GET)
	public String getReplyCommentVideoByCommentAndAccount(@PathVariable Integer commentVideoSeqNo,
			@PathVariable String account) {
		replyCommentVideoService.getReplyCommentVideoByCommentAndAccount(commentVideoSeqNo, account);
		return "OK";
	}

//	@RequestMapping(value = "{replyCommentVideoSeqNo}",method = RequestMethod.GET)
	public String getReplyCommentVideoBySeqNo(@PathVariable Integer replyCommentVideoSeqNo) {
		replyCommentVideoService.getReplyCommentVideoBySeqNo(replyCommentVideoSeqNo);
		return "OK";
	}
	
	@ResponseBody
	@RequestMapping(method = RequestMethod.POST)
	public Map<String,Object> saveReplyCommentVideo(@RequestBody ReplyCommentVideoBean replyCommentVideoBean) {
		Map<String, Object> map = new HashMap<String,Object>();
		int key = replyCommentVideoService.saveReplyCommentVideo(replyCommentVideoBean);
		replyCommentVideoBean = replyCommentVideoService.getReplyCommentVideoBySeqNo(key);
		map.put("replyCommentVideoBean", replyCommentVideoBean);
		return map;
	}

	@RequestMapping(method = RequestMethod.PUT)
	public String updateReplyCommentVideo(@ModelAttribute ReplyCommentVideoBean replyCommentVideoBean) {
		replyCommentVideoService.updateReplyCommentVideo(replyCommentVideoBean);
		return "OK";
	}

	@RequestMapping(value = "{replyCommentVideoSeqNo}",method = RequestMethod.DELETE)
	public String deleteReplyCommentVideo(@PathVariable Integer replyCommentVideoSeqNo) {
		ReplyCommentVideoBean replyCommentVideoBean = replyCommentVideoService.getReplyCommentVideoBySeqNo(replyCommentVideoSeqNo);
		replyCommentVideoService.deleteReplyCommentVideo(replyCommentVideoBean);
		return "OK";
	}
	
}

