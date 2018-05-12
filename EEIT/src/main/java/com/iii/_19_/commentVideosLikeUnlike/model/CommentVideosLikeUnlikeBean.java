package com.iii._19_.commentVideosLikeUnlike.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "CommentVideosLikeUnlike")
public class CommentVideosLikeUnlikeBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer commentLikeUnlikeSeqNo;
	private String account;
	private Integer commentVideoSeqNo;
	private String commentLikeUnlikeStatus;
	private Timestamp commentLikeUnLikeDate;
	private Integer commentLikeUnLikeScore;

	public CommentVideosLikeUnlikeBean() {
		super();
	}

	public CommentVideosLikeUnlikeBean(Integer commentLikeUnlikeSeqNo, String account, Integer commentVideoSeqNo,
			String commentLikeUnlikeStatus, Timestamp commentLikeUnLikeDate, Integer commentLikeUnLikeScore) {
		super();
		this.commentLikeUnlikeSeqNo = commentLikeUnlikeSeqNo;
		this.account = account;
		this.commentVideoSeqNo = commentVideoSeqNo;
		this.commentLikeUnlikeStatus = commentLikeUnlikeStatus;
		this.commentLikeUnLikeDate = commentLikeUnLikeDate;
		this.commentLikeUnLikeScore = commentLikeUnLikeScore;
	}

	@Override
	public String toString() {
		return "CommentVideosLikeUnlikeBean [commentLikeUnlikeSeqNo=" + commentLikeUnlikeSeqNo + ", account=" + account
				+ ", commentVideoSeqNo=" + commentVideoSeqNo + ", commentLikeUnlikeStatus=" + commentLikeUnlikeStatus
				+ ", commentLikeUnLikeDate=" + commentLikeUnLikeDate + ", commentLikeUnLikeScore="
				+ commentLikeUnLikeScore + "]";
	}

	public Integer getCommentLikeUnlikeSeqNo() {
		return commentLikeUnlikeSeqNo;
	}

	public void setCommentLikeUnlikeSeqNo(Integer commentLikeUnlikeSeqNo) {
		this.commentLikeUnlikeSeqNo = commentLikeUnlikeSeqNo;
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

	public String getCommentLikeUnlikeStatus() {
		return commentLikeUnlikeStatus;
	}

	public void setCommentLikeUnlikeStatus(String commentLikeUnlikeStatus) {
		this.commentLikeUnlikeStatus = commentLikeUnlikeStatus;
	}

	public Timestamp getCommentLikeUnLikeDate() {
		return commentLikeUnLikeDate;
	}

	public void setCommentLikeUnLikeDate(Timestamp commentLikeUnLikeDate) {
		this.commentLikeUnLikeDate = commentLikeUnLikeDate;
	}

	public Integer getCommentLikeUnLikeScore() {
		return commentLikeUnLikeScore;
	}

	public void setCommentLikeUnLikeScore(Integer commentLikeUnLikeScore) {
		this.commentLikeUnLikeScore = commentLikeUnLikeScore;
	}
	
	
}
