package com.iii._19_.replyCommentVideo.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "ReplyCommentVideo")
public class ReplyCommentVideoBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer replyCommentVideoSeqNo;
	private String account;
	private Integer commentVideoSeqNo;
	private String replyCommentArticle;
	private Timestamp replyCommentDate;
	private Integer replyCommentLike;
	private Integer replyCommentUnLike;
	private String replyCommentVideoStatus;
	
	@Transient
	private String replyCommentVideosLikeUnlikeStatus;
	
	public String getReplyCommentVideosLikeUnlikeStatus() {
		return replyCommentVideosLikeUnlikeStatus;
	}

	public void setReplyCommentVideosLikeUnlikeStatus(String replyCommentVideosLikeUnlikeStatus) {
		this.replyCommentVideosLikeUnlikeStatus = replyCommentVideosLikeUnlikeStatus;
	}

	public ReplyCommentVideoBean(Integer replyCommentVideoSeqNo, String account, Integer commentVideoSeqNo,
			String replyCommentArticle, Timestamp replyCommentDate, Integer replyCommentLike,
			Integer replyCommentUnLike, String replyCommentVideoStatus) {
		super();
		this.replyCommentVideoSeqNo = replyCommentVideoSeqNo;
		this.account = account;
		this.commentVideoSeqNo = commentVideoSeqNo;
		this.replyCommentArticle = replyCommentArticle;
		this.replyCommentDate = replyCommentDate;
		this.replyCommentLike = replyCommentLike;
		this.replyCommentUnLike = replyCommentUnLike;
		this.replyCommentVideoStatus = replyCommentVideoStatus;
	}

	public ReplyCommentVideoBean() {
		super();
	}

	public Integer getReplyCommentVideoSeqNo() {
		return replyCommentVideoSeqNo;
	}

	public void setReplyCommentVideoSeqNo(Integer replyCommentVideoSeqNo) {
		this.replyCommentVideoSeqNo = replyCommentVideoSeqNo;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public Integer getCommentVideoSeqNo() {
		return commentVideoSeqNo;
	}

	public void setCommentVideoSeqNo(Integer commentVideoSeqNo) {
		this.commentVideoSeqNo = commentVideoSeqNo;
	}

	public String getReplyCommentArticle() {
		return replyCommentArticle;
	}

	public void setReplyCommentArticle(String replyCommentArticle) {
		this.replyCommentArticle = replyCommentArticle;
	}

	public Timestamp getReplyCommentDate() {
		return replyCommentDate;
	}

	public void setReplyCommentDate(Timestamp replyCommentDate) {
		this.replyCommentDate = replyCommentDate;
	}

	public Integer getReplyCommentLike() {
		return replyCommentLike;
	}

	public void setReplyCommentLike(Integer replyCommentLike) {
		this.replyCommentLike = replyCommentLike;
	}

	public Integer getReplyCommentUnLike() {
		return replyCommentUnLike;
	}

	public void setReplyCommentUnLike(Integer replyCommentUnLike) {
		this.replyCommentUnLike = replyCommentUnLike;
	}

	public String getReplyCommentVideoStatus() {
		return replyCommentVideoStatus;
	}

	public void setReplyCommentVideoStatus(String replyCommentVideoStatus) {
		this.replyCommentVideoStatus = replyCommentVideoStatus;
	}

	@Override
	public String toString() {
		return "ReplyCommentVideoBean [replyCommentVideoSeqNo=" + replyCommentVideoSeqNo + ", account=" + account
				+ ", commentVideoSeqNo=" + commentVideoSeqNo + ", replyCommentArticle=" + replyCommentArticle
				+ ", replyCommentDate=" + replyCommentDate + ", replyCommentLike=" + replyCommentLike
				+ ", replyCommentUnLike=" + replyCommentUnLike + ", replyCommentVideoStatus=" + replyCommentVideoStatus
				+ "]";
	}

}
