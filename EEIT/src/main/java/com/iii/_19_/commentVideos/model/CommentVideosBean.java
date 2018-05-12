package com.iii._19_.commentVideos.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.iii._19_.commentVideosLikeUnlike.model.CommentVideosLikeUnlikeBean;
import com.iii._19_.replyCommentVideo.model.ReplyCommentVideoBean;

@Entity
@Table(name = "CommentVideos")
public class CommentVideosBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer commentVideoSeqNo;
	private String account;
	private Integer videoSeqNo;
	private String commentArticle;
	private Timestamp commentDate;
	private Integer commentLike;
	private Integer commentUnLike;
	private String commentVideoStatus;
	
	@Transient
	private String commentVideosLikeUnlikeStatus;
	
	public String getCommentVideosLikeUnlikeStatus() {
		return commentVideosLikeUnlikeStatus;
	}

	public void setCommentVideosLikeUnlikeStatus(String commentVideosLikeUnlikeStatus) {
		this.commentVideosLikeUnlikeStatus = commentVideosLikeUnlikeStatus;
	}

	@Transient
	private List<ReplyCommentVideoBean> replyCommentVideoBeanList;

	public List<ReplyCommentVideoBean> getReplyCommentVideoBeanList() {
		return replyCommentVideoBeanList;
	}

	public void setReplyCommentVideoBeanList(List<ReplyCommentVideoBean> replyCommentVideoBeanList) {
		this.replyCommentVideoBeanList = replyCommentVideoBeanList;
	}

	public CommentVideosBean(Integer commentVideoSeqNo, String account, Integer videoSeqNo, String commentArticle,
			Timestamp commentDate, Integer commentLike, Integer commentUnLike, String commentVideoStatus) {
		super();
		this.commentVideoSeqNo = commentVideoSeqNo;
		this.account = account;
		this.videoSeqNo = videoSeqNo;
		this.commentArticle = commentArticle;
		this.commentDate = commentDate;
		this.commentLike = commentLike;
		this.commentUnLike = commentUnLike;
		this.commentVideoStatus = commentVideoStatus;
	}

	public CommentVideosBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getCommentVideoSeqNo() {
		return commentVideoSeqNo;
	}

	public void setCommentVideoSeqNo(Integer commentVideoSeqNo) {
		this.commentVideoSeqNo = commentVideoSeqNo;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public Integer getVideoSeqNo() {
		return videoSeqNo;
	}

	public void setVideoSeqNo(Integer videoSeqNo) {
		this.videoSeqNo = videoSeqNo;
	}

	public String getCommentArticle() {
		return commentArticle;
	}

	public void setCommentArticle(String commentArticle) {
		this.commentArticle = commentArticle;
	}

	public Timestamp getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Timestamp commentDate) {
		this.commentDate = commentDate;
	}

	public Integer getCommentLike() {
		return commentLike;
	}

	public void setCommentLike(Integer commentLike) {
		this.commentLike = commentLike;
	}

	public Integer getCommentUnLike() {
		return commentUnLike;
	}

	public void setCommentUnLike(Integer commentUnLike) {
		this.commentUnLike = commentUnLike;
	}

	public String getCommentVideoStatus() {
		return commentVideoStatus;
	}

	public void setCommentVideoStatus(String commentVideoStatus) {
		this.commentVideoStatus = commentVideoStatus;
	}

	@Override
	public String toString() {
		return "CommentVideosBean [commentVideoSeqNo=" + commentVideoSeqNo + ", account=" + account + ", videoSeqNo="
				+ videoSeqNo + ", commentArticle=" + commentArticle + ", commentDate=" + commentDate + ", commentLike="
				+ commentLike + ", commentUnLike=" + commentUnLike + ", commentVideoStatus=" + commentVideoStatus + "]";
	}

}
