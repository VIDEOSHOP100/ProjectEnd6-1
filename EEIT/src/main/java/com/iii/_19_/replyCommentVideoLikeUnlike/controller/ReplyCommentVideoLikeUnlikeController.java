package com.iii._19_.replyCommentVideoLikeUnlike.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._19_.commentVideos.model.CommentVideosBean;
import com.iii._19_.commentVideosLikeUnlike.model.CommentVideosLikeUnlikeBean;
import com.iii._19_.replyCommentVideo.model.ReplyCommentVideoBean;
import com.iii._19_.replyCommentVideo.model.ReplyCommentVideoService;
import com.iii._19_.replyCommentVideoLikeUnlike.model.ReplyCommentVideoLikeUnlikeBean;
import com.iii._19_.replyCommentVideoLikeUnlike.model.ReplyCommentVideoLikeUnlikeService;

@Controller
@RequestMapping("ReplyCommentVideoLikeUnlike")
public class ReplyCommentVideoLikeUnlikeController {
	
	@Autowired
	ReplyCommentVideoLikeUnlikeService replyCommentVideoLikeUnlikeService;
	
	@Autowired
	ReplyCommentVideoService replyCommentVideoService;
	
	@RequestMapping(value = "{replyCommentVideosSeqNo}",method = RequestMethod.GET)
	public String getReplyCommentVideoLikeUnlikeByReplyComment(@PathVariable("replyCommentVideosSeqNo")
			Integer replyCommentVideosSeqNo) {
		List<ReplyCommentVideoLikeUnlikeBean> replyCommentVideoLikeUnlikeBeanList = replyCommentVideoLikeUnlikeService.getReplyCommentVideoLikeUnlikeByReplyComment(replyCommentVideosSeqNo);
		return "OK";
	}

	@RequestMapping(method = RequestMethod.GET)
	public String getAllReplyCommentVideoLikeUnlike() {
		List<ReplyCommentVideoLikeUnlikeBean> replyCommentVideoLikeUnlikeBeanList = replyCommentVideoLikeUnlikeService.getAllReplyCommentVideoLikeUnlike();
		return "OK";
	}

	@RequestMapping(value = "{replyCommentVideosSeqNo}/{account}",method = RequestMethod.GET)
	public String getReplyCommentVideoLikeUnlikeByReplyCommentAndAccount(
			@PathVariable("replyCommentVideosSeqNo") Integer replyCommentVideosSeqNo,@PathVariable("account") String account) {
		ReplyCommentVideoLikeUnlikeBean replyCommentVideoLikeUnlikeBeanList = replyCommentVideoLikeUnlikeService.getReplyCommentVideoLikeUnlikeByReplyCommentAndAccount(replyCommentVideosSeqNo, account);
		return "OK";
	}

//	@RequestMapping(value = "{replyCommentVideoLikeUnlikeSeqNo}", method = RequestMethod.GET)
	public String getReplyCommentVideosLikeUnlikeBySeqNo(
			@PathVariable("replyCommentVideoLikeUnlikeSeqNo") Integer replyCommentVideoLikeUnlikeSeqNo) {
		ReplyCommentVideoLikeUnlikeBean replyCommentVideoLikeUnlikeBean = replyCommentVideoLikeUnlikeService.getReplyCommentVideosLikeUnlikeBySeqNo(replyCommentVideoLikeUnlikeSeqNo);
		return "OK";
	}

	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody Map<String,Integer> saveReplyCommentVideoLikeUnlike(
			@RequestParam("replyCommentVideoSeqNo") Integer replyCommentVideoSeqNo,
			@RequestParam("replyCommentVideoLikeUnlikeStatus") String replyCommentVideoLikeUnlikeStatus,
			HttpSession session
			) {
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		ReplyCommentVideoLikeUnlikeBean replyCommentVideoLikeUnlikeBean = new ReplyCommentVideoLikeUnlikeBean(0, account, replyCommentVideoLikeUnlikeStatus, now, 0, replyCommentVideoSeqNo); 
		int key = replyCommentVideoLikeUnlikeService.saveReplyCommentVideoLikeUnlike(replyCommentVideoLikeUnlikeBean);
		
		ReplyCommentVideoBean replyCommentVideoBean = replyCommentVideoService.getReplyCommentVideoBySeqNo(replyCommentVideoSeqNo);
		
		if(replyCommentVideoLikeUnlikeStatus.equalsIgnoreCase("like")) {
			replyCommentVideoBean.setReplyCommentLike(replyCommentVideoBean.getReplyCommentLike() + 1);
			replyCommentVideoService.updateReplyCommentVideo(replyCommentVideoBean);
			//增加影片不喜歡總數
		}else if(replyCommentVideoLikeUnlikeStatus.equalsIgnoreCase("unlike")) {
			replyCommentVideoBean.setReplyCommentUnLike(replyCommentVideoBean.getReplyCommentUnLike() + 1);
			replyCommentVideoService.updateReplyCommentVideo(replyCommentVideoBean);
		}
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("likeNumber", replyCommentVideoBean.getReplyCommentLike());
		map.put("unlikeNumber", replyCommentVideoBean.getReplyCommentUnLike());
		return map;
	}

	@RequestMapping(method = RequestMethod.PUT)
	public @ResponseBody Map<String,Integer> updateReplyCommentVideoLikeUnlike(
			@RequestParam("replyCommentVideoSeqNo") Integer replyCommentVideoSeqNo,
			@RequestParam("replyCommentVideoLikeUnlikeStatus") String replyCommentVideoLikeUnlikeStatus,
			HttpSession session
			) {
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		 ReplyCommentVideoLikeUnlikeBean replyCommentVideoLikeUnlikeBean = replyCommentVideoLikeUnlikeService.getReplyCommentVideoLikeUnlikeByReplyCommentAndAccount(replyCommentVideoSeqNo, account);

		
		
		ReplyCommentVideoBean replyCommentVideoBean = replyCommentVideoService.getReplyCommentVideoBySeqNo(replyCommentVideoSeqNo);
		if(replyCommentVideoLikeUnlikeStatus.equalsIgnoreCase("like")) {
			if(replyCommentVideoLikeUnlikeBean.getReplyCommentVideoLikeUnlikeStatus().equals("like")) {
				
			}else if(replyCommentVideoLikeUnlikeBean.getReplyCommentVideoLikeUnlikeStatus().equals("unlike")) {
				if( replyCommentVideoBean.getReplyCommentUnLike() > 0) {
					replyCommentVideoBean.setReplyCommentUnLike(replyCommentVideoBean.getReplyCommentUnLike() - 1);
				}
				replyCommentVideoBean.setReplyCommentLike(replyCommentVideoBean.getReplyCommentLike() + 1);
			}else if(replyCommentVideoLikeUnlikeBean.getReplyCommentVideoLikeUnlikeStatus().equals("none")) {
				replyCommentVideoBean.setReplyCommentLike(replyCommentVideoBean.getReplyCommentLike() + 1);
				
			}
		}else if(replyCommentVideoLikeUnlikeStatus.equalsIgnoreCase("unlike")) {
			if(replyCommentVideoLikeUnlikeBean.getReplyCommentVideoLikeUnlikeStatus().equals("like")) {
				if(replyCommentVideoBean.getReplyCommentLike() > 0) {
					replyCommentVideoBean.setReplyCommentLike(replyCommentVideoBean.getReplyCommentLike() - 1);
				}
				replyCommentVideoBean.setReplyCommentUnLike(replyCommentVideoBean.getReplyCommentUnLike() + 1);
			}else if(replyCommentVideoLikeUnlikeBean.getReplyCommentVideoLikeUnlikeStatus().equals("unlike")) {
				
			}else if(replyCommentVideoLikeUnlikeBean.getReplyCommentVideoLikeUnlikeStatus().equals("none")) {
				replyCommentVideoBean.setReplyCommentUnLike(replyCommentVideoBean.getReplyCommentUnLike() + 1 );
			}
		}else if(replyCommentVideoLikeUnlikeStatus.equalsIgnoreCase("none")) {
			if(replyCommentVideoLikeUnlikeBean.getReplyCommentVideoLikeUnlikeStatus().equals("like")) {
				if(replyCommentVideoBean.getReplyCommentLike() > 0) {
					replyCommentVideoBean.setReplyCommentLike(replyCommentVideoBean.getReplyCommentLike() - 1);
				}
			}else if(replyCommentVideoLikeUnlikeBean.getReplyCommentVideoLikeUnlikeStatus().equals("unlike")) {
				if(replyCommentVideoBean.getReplyCommentUnLike() > 0) {
					replyCommentVideoBean.setReplyCommentUnLike(replyCommentVideoBean.getReplyCommentUnLike() - 1);
				}
			}else if(replyCommentVideoLikeUnlikeBean.getReplyCommentVideoLikeUnlikeStatus().equals("none")) {
				
			}
		}
		replyCommentVideoLikeUnlikeBean.setReplyCommentVideoLikeUnlikeDate(now);
		replyCommentVideoLikeUnlikeBean.setReplyCommentVideoLikeUnlikeStatus(replyCommentVideoLikeUnlikeStatus);
		replyCommentVideoLikeUnlikeService.updateReplyCommentVideoLikeUnlike(replyCommentVideoLikeUnlikeBean);
		replyCommentVideoService.updateReplyCommentVideo(replyCommentVideoBean);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("likeNumber", replyCommentVideoBean.getReplyCommentLike());
		map.put("unlikeNumber", replyCommentVideoBean.getReplyCommentUnLike());
		return map;
	}

	@RequestMapping(value = "{replyCommentVideosSeqNo}",method = RequestMethod.DELETE)
	public String deleteReplyCommentVideoLikeUnlike(@PathVariable("replyCommentVideosSeqNo") Integer replyCommentVideoLikeUnlikeSeqNo) {
		ReplyCommentVideoLikeUnlikeBean replyCommentVideoLikeUnlikeBean = replyCommentVideoLikeUnlikeService.getReplyCommentVideosLikeUnlikeBySeqNo(replyCommentVideoLikeUnlikeSeqNo);
		replyCommentVideoLikeUnlikeService.deleteReplyCommentVideoLikeUnlike(replyCommentVideoLikeUnlikeBean);
		return "OK";
	}
	
	
}

