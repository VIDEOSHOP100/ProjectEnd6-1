package com.iii._19_.likeUnlikeVideos.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "LikeUnlikeVideos")
public class LikeUnlikeVideosBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer likeUnlikeVideosSeqNo;
	private String account;
	private Integer videoSeqNo;
	private String LikeUnlikeVideosStatus;
	private Timestamp likeUnLikeVideosDate;
	private Integer likeUnlikeVideosScore;

	public LikeUnlikeVideosBean(Integer likeUnlikeVideosSeqNo, String account, Integer videoSeqNo,
			String likeUnlikeVideosStatus, Timestamp likeUnLikeVideosDate, Integer likeUnlikeVideosScore) {
		super();
		this.likeUnlikeVideosSeqNo = likeUnlikeVideosSeqNo;
		this.account = account;
		this.videoSeqNo = videoSeqNo;
		LikeUnlikeVideosStatus = likeUnlikeVideosStatus;
		this.likeUnLikeVideosDate = likeUnLikeVideosDate;
		this.likeUnlikeVideosScore = likeUnlikeVideosScore;
	}

	public LikeUnlikeVideosBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getLikeUnlikeVideosSeqNo() {
		return likeUnlikeVideosSeqNo;
	}

	public void setLikeUnlikeVideosSeqNo(Integer likeUnlikeVideosSeqNo) {
		this.likeUnlikeVideosSeqNo = likeUnlikeVideosSeqNo;
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

	public String getLikeUnlikeVideosStatus() {
		return LikeUnlikeVideosStatus;
	}

	public void setLikeUnlikeVideosStatus(String likeUnlikeVideosStatus) {
		LikeUnlikeVideosStatus = likeUnlikeVideosStatus;
	}

	public Timestamp getLikeUnLikeVideosDate() {
		return likeUnLikeVideosDate;
	}

	public void setLikeUnLikeVideosDate(Timestamp likeUnLikeVideosDate) {
		this.likeUnLikeVideosDate = likeUnLikeVideosDate;
	}

	public Integer getLikeUnlikeVideosScore() {
		return likeUnlikeVideosScore;
	}

	public void setLikeUnlikeVideosScore(Integer likeUnlikeVideosScore) {
		this.likeUnlikeVideosScore = likeUnlikeVideosScore;
	}

	@Override
	public String toString() {
		return "LikeUnlikeVideosBean [likeUnlikeVideosSeqNo=" + likeUnlikeVideosSeqNo + ", account=" + account
				+ ", videoSeqNo=" + videoSeqNo + ", LikeUnlikeVideosStatus=" + LikeUnlikeVideosStatus
				+ ", likeUnLikeVideosDate=" + likeUnLikeVideosDate + ", likeUnlikeVideosScore=" + likeUnlikeVideosScore
				+ "]";
	}

}
