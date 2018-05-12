package com.iii._19_.commentVideosLikeUnlike.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii._01_.Member.bean.MemberBean;
import com.iii._19_.commentVideos.model.CommentVideosBean;
import com.iii._19_.commentVideos.model.CommentVideosService;
import com.iii._19_.commentVideosLikeUnlike.model.CommentVideosLikeUnlikeBean;
import com.iii._19_.commentVideosLikeUnlike.model.CommentVideosLikeUnlikeService;
import com.iii._19_.likeUnlikeVideos.model.LikeUnlikeVideosBean;
import com.iii._19_.videoManage.model.VideoBean;

@Controller
@RequestMapping("CommentVideosLikeUnlike")
public class CommentVideosLikeUnlikeController {
	
	@Autowired
	CommentVideosLikeUnlikeService commentVideosLikeUnlikeService;
	
	@Autowired
	CommentVideosService commentVideosService;
	
	
	@RequestMapping(value = "{commentVideosSeqNo}",method = RequestMethod.GET)
	public String getCommentVideosLikeUnlikeByComment(@PathVariable Integer commentVideosSeqNo) {
		 List<CommentVideosLikeUnlikeBean> commentVideosLikeUnlikeBeanList = commentVideosLikeUnlikeService.getCommentVideosLikeUnlikeByComment(commentVideosSeqNo);
		 return "OK";
	}

	@RequestMapping(method = RequestMethod.GET)
	public String getAllCommentVideosLikeUnlike() {
		List<CommentVideosLikeUnlikeBean> commentVideosLikeUnlikeBeanList = commentVideosLikeUnlikeService.getAllCommentVideosLikeUnlike();
		return "OK";
	}

	@RequestMapping(value = "{commentVideosSeqNo}/{account}",method = RequestMethod.GET)
	public String getCommentVideosLikeUnlikeByCommentAndAccount(@PathVariable Integer commentVideosSeqNo,
			@PathVariable String account) {
		CommentVideosLikeUnlikeBean commentVideosLikeUnlikeBeanList = commentVideosLikeUnlikeService.getCommentVideosLikeUnlikeByCommentAndAccount(commentVideosSeqNo, account);
		return "OK";
	}

//	@RequestMapping(value = "{commentLikeUnlikeSeqNo}",method = RequestMethod.GET)
	public String getCommentVideosLikeUnlikeBySeqNo(@PathVariable Integer commentLikeUnlikeSeqNo) {
		CommentVideosLikeUnlikeBean commentVideosLikeUnlikeBeanList = commentVideosLikeUnlikeService.getCommentVideosLikeUnlikeBySeqNo(commentLikeUnlikeSeqNo);
		return "OK";
	}

	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody Map<String,Integer> saveCommentVideosLikeUnlike(
			@RequestParam("commentVideoSeqNo") Integer commentVideoSeqNo,
			@RequestParam("commentLikeUnlikeStatus") String commentLikeUnlikeStatus,
			HttpSession session
			) {
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		CommentVideosLikeUnlikeBean commentVideosLikeUnlikeBean = new CommentVideosLikeUnlikeBean(0, account, commentVideoSeqNo, commentLikeUnlikeStatus, now, 0); 
		int key = commentVideosLikeUnlikeService.saveCommentVideosLikeUnlike(commentVideosLikeUnlikeBean);
		
		CommentVideosBean commentVideosBean = commentVideosService.getCommentVideosBySeqNo(commentVideoSeqNo);
		
		if(commentLikeUnlikeStatus.equalsIgnoreCase("like")) {
			commentVideosBean.setCommentLike(commentVideosBean.getCommentLike() + 1);
			commentVideosService.updateCommentVideos(commentVideosBean);
			//增加影片不喜歡總數
		}else if(commentLikeUnlikeStatus.equalsIgnoreCase("unlike")) {
			commentVideosBean.setCommentUnLike(commentVideosBean.getCommentUnLike() + 1);
			commentVideosService.updateCommentVideos(commentVideosBean);
		}
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("likeNumber", commentVideosBean.getCommentLike());
		map.put("unlikeNumber", commentVideosBean.getCommentUnLike());
		return map;
	}

	@RequestMapping(
			method = RequestMethod.PUT
			)
	public @ResponseBody Map<String,Integer> updateCommentVideosLikeUnlike(
			@RequestParam("commentVideoSeqNo") Integer commentVideoSeqNo,
			@RequestParam("commentLikeUnlikeStatus") String commentLikeUnlikeStatus,
			HttpSession session
			) {
		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
		String account = memberBean.getAccount();
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		CommentVideosLikeUnlikeBean commentVideosLikeUnlikeBean = commentVideosLikeUnlikeService.getCommentVideosLikeUnlikeByCommentAndAccount(commentVideoSeqNo, account);

		
		
		CommentVideosBean commentVideosBean = commentVideosService.getCommentVideosBySeqNo(commentVideoSeqNo);
		if(commentLikeUnlikeStatus.equalsIgnoreCase("like")) {
			if(commentVideosLikeUnlikeBean.getCommentLikeUnlikeStatus().equals("like")) {
				
			}else if(commentVideosLikeUnlikeBean.getCommentLikeUnlikeStatus().equals("unlike")) {
				if( commentVideosBean.getCommentUnLike() > 0) {
					commentVideosBean.setCommentUnLike(commentVideosBean.getCommentUnLike() - 1);
				}
				commentVideosBean.setCommentLike(commentVideosBean.getCommentLike() + 1);
			}else if(commentVideosLikeUnlikeBean.getCommentLikeUnlikeStatus().equals("none")) {
				commentVideosBean.setCommentLike(commentVideosBean.getCommentLike() + 1);
				
			}
		}else if(commentLikeUnlikeStatus.equalsIgnoreCase("unlike")) {
			if(commentVideosLikeUnlikeBean.getCommentLikeUnlikeStatus().equals("like")) {
				if(commentVideosBean.getCommentLike() > 0) {
					commentVideosBean.setCommentLike(commentVideosBean.getCommentLike() - 1);
				}
				commentVideosBean.setCommentUnLike(commentVideosBean.getCommentUnLike() + 1);
			}else if(commentVideosLikeUnlikeBean.getCommentLikeUnlikeStatus().equals("unlike")) {
				
			}else if(commentVideosLikeUnlikeBean.getCommentLikeUnlikeStatus().equals("none")) {
				commentVideosBean.setCommentUnLike(commentVideosBean.getCommentUnLike() + 1 );
			}
		}else if(commentLikeUnlikeStatus.equalsIgnoreCase("none")) {
			if(commentVideosLikeUnlikeBean.getCommentLikeUnlikeStatus().equals("like")) {
				if(commentVideosBean.getCommentLike() > 0) {
					commentVideosBean.setCommentLike(commentVideosBean.getCommentLike() - 1);
				}
			}else if(commentVideosLikeUnlikeBean.getCommentLikeUnlikeStatus().equals("unlike")) {
				if(commentVideosBean.getCommentUnLike() > 0) {
					commentVideosBean.setCommentUnLike(commentVideosBean.getCommentUnLike() - 1);
				}
			}else if(commentVideosLikeUnlikeBean.getCommentLikeUnlikeStatus().equals("none")) {
				
			}
		}
		commentVideosLikeUnlikeBean.setCommentLikeUnLikeDate(now);
		commentVideosLikeUnlikeBean.setCommentLikeUnlikeStatus(commentLikeUnlikeStatus);
		commentVideosLikeUnlikeService.updateCommentVideosLikeUnlike(commentVideosLikeUnlikeBean);
		commentVideosService.updateCommentVideos(commentVideosBean);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("likeNumber", commentVideosBean.getCommentLike());
		map.put("unlikeNumber", commentVideosBean.getCommentUnLike());
		return map;
	}

	@RequestMapping(value = "{commentLikeUnlikeSeqNo}",method = RequestMethod.DELETE)
	public String deleteCommentVideosLikeUnlike(@PathVariable Integer commentLikeUnlikeSeqNo) {
		CommentVideosLikeUnlikeBean commentVideosLikeUnlikeBean = commentVideosLikeUnlikeService.getCommentVideosLikeUnlikeBySeqNo(commentLikeUnlikeSeqNo);
		commentVideosLikeUnlikeService.deleteCommentVideosLikeUnlike(commentVideosLikeUnlikeBean);
		return "OK";
	}
}
