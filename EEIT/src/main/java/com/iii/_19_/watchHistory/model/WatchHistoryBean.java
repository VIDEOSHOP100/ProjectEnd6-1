package com.iii._19_.watchHistory.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.iii._19_.videoManage.model.VideoBean;

@Entity
@Table(name = "WatchHistory")
public class WatchHistoryBean {
	@ManyToOne
	@JoinColumn(name = "videoSeqNo", referencedColumnName = "videoSeqNo", insertable = false, updatable = false)
	private VideoBean videoBean;

	public VideoBean getVideoBean() {
		return videoBean;
	}

	public void setVideoBean(VideoBean videoBean) {
		this.videoBean = videoBean;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer watchHistorySeqNo;
	private String account;
	private Integer videoSeqNo;
	private Timestamp watchVideoDate;
	private Integer watchHistoryScore;
	private String watchHistoryStatus;

	public WatchHistoryBean() {
		super();
	}

	public WatchHistoryBean(Integer watchHistorySeqNo, String account, Integer videoSeqNo, Timestamp watchVideoDate,
			Integer watchHistoryScore, String watchHistoryStatus) {
		super();
		this.watchHistorySeqNo = watchHistorySeqNo;
		this.account = account;
		this.videoSeqNo = videoSeqNo;
		this.watchVideoDate = watchVideoDate;
		this.watchHistoryScore = watchHistoryScore;
		this.watchHistoryStatus = watchHistoryStatus;
	}

	public Integer getWatchHistorySeqNo() {
		return watchHistorySeqNo;
	}

	public void setWatchHistorySeqNo(Integer watchHistorySeqNo) {
		this.watchHistorySeqNo = watchHistorySeqNo;
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

	public Timestamp getWatchVideoDate() {
		return watchVideoDate;
	}

	public void setWatchVideoDate(Timestamp watchVideoDate) {
		this.watchVideoDate = watchVideoDate;
	}

	public Integer getWatchHistoryScore() {
		return watchHistoryScore;
	}

	public void setWatchHistoryScore(Integer watchHistoryScore) {
		this.watchHistoryScore = watchHistoryScore;
	}

	public String getWatchHistoryStatus() {
		return watchHistoryStatus;
	}

	public void setWatchHistoryStatus(String watchHistoryStatus) {
		this.watchHistoryStatus = watchHistoryStatus;
	}

	@Override
	public String toString() {
		return "WatchHistoryBean [watchHistorySeqNo=" + watchHistorySeqNo + ", account=" + account + ", videoSeqNo="
				+ videoSeqNo + ", watchVideoDate=" + watchVideoDate + ", watchHistoryScore=" + watchHistoryScore
				+ ", watchHistoryStatus=" + watchHistoryStatus + "]";
	}

}
