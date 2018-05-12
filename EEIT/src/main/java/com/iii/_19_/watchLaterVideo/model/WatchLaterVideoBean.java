package com.iii._19_.watchLaterVideo.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "WatchLaterVideo")
public class WatchLaterVideoBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer watchLaterVideosSeqNo;
	private String account;
	private Integer videoSeqNo;
	private Timestamp watchLaterVideoDate;
	private Integer watchLaterVideosScore;
	private String watchLaterVideosStatus;

	public WatchLaterVideoBean(Integer watchLaterVideosSeqNo, String account, Integer videoSeqNo,
			Timestamp watchLaterVideoDate, Integer watchLaterVideosScore, String watchLaterVideosStatus) {
		super();
		this.watchLaterVideosSeqNo = watchLaterVideosSeqNo;
		this.account = account;
		this.videoSeqNo = videoSeqNo;
		this.watchLaterVideoDate = watchLaterVideoDate;
		this.watchLaterVideosScore = watchLaterVideosScore;
		this.watchLaterVideosStatus = watchLaterVideosStatus;
	}

	public WatchLaterVideoBean() {
		super();
	}

	public Integer getWatchLaterVideosSeqNo() {
		return watchLaterVideosSeqNo;
	}

	public void setWatchLaterVideosSeqNo(Integer watchLaterVideosSeqNo) {
		this.watchLaterVideosSeqNo = watchLaterVideosSeqNo;
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

	public Timestamp getWatchLaterVideoDate() {
		return watchLaterVideoDate;
	}

	public void setWatchLaterVideoDate(Timestamp watchLaterVideoDate) {
		this.watchLaterVideoDate = watchLaterVideoDate;
	}

	public Integer getWatchLaterVideosScore() {
		return watchLaterVideosScore;
	}

	public void setWatchLaterVideosScore(Integer watchLaterVideosScore) {
		this.watchLaterVideosScore = watchLaterVideosScore;
	}

	public String getWatchLaterVideosStatus() {
		return watchLaterVideosStatus;
	}

	public void setWatchLaterVideosStatus(String watchLaterVideosStatus) {
		this.watchLaterVideosStatus = watchLaterVideosStatus;
	}

	@Override
	public String toString() {
		return "WatchLaterVideoBean [watchLaterVideosSeqNo=" + watchLaterVideosSeqNo + ", account=" + account
				+ ", videoSeqNo=" + videoSeqNo + ", watchLaterVideoDate=" + watchLaterVideoDate
				+ ", watchLaterVideosScore=" + watchLaterVideosScore + ", watchLaterVideosStatus="
				+ watchLaterVideosStatus + "]";
	}

}
