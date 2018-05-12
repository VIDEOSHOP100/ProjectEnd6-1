package com.iii._19_.replyCommentVideoLikeUnlike.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ReplyCommentVideoLikeUnlike")
public class ReplyCommentVideoLikeUnlikeBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer replyCommentVideoLikeUnlikeSeqNo;
	private String account;
	private String replyCommentVideoLikeUnlikeStatus;
	private Timestamp replyCommentVideoLikeUnlikeDate;
	private Integer replyCommentVideoLikeUnLikeScore;
	private Integer replyCommentVideoSeqNo;

	public ReplyCommentVideoLikeUnlikeBean() {
		super();
	}

	public ReplyCommentVideoLikeUnlikeBean(Integer replyCommentVideoLikeUnlikeSeqNo, String account,
			String replyCommentVideoLikeUnlikeStatus, Timestamp replyCommentVideoLikeUnlikeDate,
			Integer replyCommentVideoLikeUnLikeScore, Integer replyCommentVideoSeqNo) {
		super();
		this.replyCommentVideoLikeUnlikeSeqNo = replyCommentVideoLikeUnlikeSeqNo;
		this.account = account;
		this.replyCommentVideoLikeUnlikeStatus = replyCommentVideoLikeUnlikeStatus;
		this.replyCommentVideoLikeUnlikeDate = replyCommentVideoLikeUnlikeDate;
		this.replyCommentVideoLikeUnLikeScore = replyCommentVideoLikeUnLikeScore;
		this.replyCommentVideoSeqNo = replyCommentVideoSeqNo;
	}

	public Integer getReplyCommentVideoLikeUnlikeSeqNo() {
		return replyCommentVideoLikeUnlikeSeqNo;
	}

	public void setReplyCommentVideoLikeUnlikeSeqNo(Integer replyCommentVideoLikeUnlikeSeqNo) {
		this.replyCommentVideoLikeUnlikeSeqNo = replyCommentVideoLikeUnlikeSeqNo;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getReplyCommentVideoLikeUnlikeStatus() {
		return replyCommentVideoLikeUnlikeStatus;
	}

	public void setReplyCommentVideoLikeUnlikeStatus(String replyCommentVideoLikeUnlikeStatus) {
		this.replyCommentVideoLikeUnlikeStatus = replyCommentVideoLikeUnlikeStatus;
	}

	public Timestamp getReplyCommentVideoLikeUnlikeDate() {
		return replyCommentVideoLikeUnlikeDate;
	}

	public void setReplyCommentVideoLikeUnlikeDate(Timestamp replyCommentVideoLikeUnlikeDate) {
		this.replyCommentVideoLikeUnlikeDate = replyCommentVideoLikeUnlikeDate;
	}

	public Integer getReplyCommentVideoLikeUnLikeScore() {
		return replyCommentVideoLikeUnLikeScore;
	}

	public void setReplyCommentVideoLikeUnLikeScore(Integer replyCommentVideoLikeUnLikeScore) {
		this.replyCommentVideoLikeUnLikeScore = replyCommentVideoLikeUnLikeScore;
	}

	public Integer getReplyCommentVideoSeqNo() {
		return replyCommentVideoSeqNo;
	}

	public void setReplyCommentVideoSeqNo(Integer replyCommentVideoSeqNo) {
		this.replyCommentVideoSeqNo = replyCommentVideoSeqNo;
	}

	@Override
	public String toString() {
		return "ReplyCommentVideoLikeUnlikeBean [replyCommentVideoLikeUnlikeSeqNo=" + replyCommentVideoLikeUnlikeSeqNo
				+ ", account=" + account + ", replyCommentVideoLikeUnlikeStatus=" + replyCommentVideoLikeUnlikeStatus
				+ ", replyCommentVideoLikeUnlikeDate=" + replyCommentVideoLikeUnlikeDate
				+ ", replyCommentVideoLikeUnLikeScore=" + replyCommentVideoLikeUnLikeScore + ", replyCommentVideoSeqNo="
				+ replyCommentVideoSeqNo + "]";
	}

}
