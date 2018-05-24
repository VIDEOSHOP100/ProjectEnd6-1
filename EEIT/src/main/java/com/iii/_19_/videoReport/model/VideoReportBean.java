package com.iii._19_.videoReport.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "VideoReport")
public class VideoReportBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer videoReportSeqNo;
	private String videoReportArticle;
	private Timestamp videoReportDate;
	private String videoReportStatus;
	private String account;
	private String videoReportType;
	private String videoReportReply;
	private Integer videoSeqNo;
	private String videoTitle;
	public Integer getVideoReportSeqNo() {
		return videoReportSeqNo;
	}
	public void setVideoReportSeqNo(Integer videoReportSeqNo) {
		this.videoReportSeqNo = videoReportSeqNo;
	}
	public String getVideoReportArticle() {
		return videoReportArticle;
	}
	public void setVideoReportArticle(String videoReportArticle) {
		this.videoReportArticle = videoReportArticle;
	}
	public Timestamp getVideoReportDate() {
		return videoReportDate;
	}
	public void setVideoReportDate(Timestamp videoReportDate) {
		this.videoReportDate = videoReportDate;
	}
	public String getVideoReportStatus() {
		return videoReportStatus;
	}
	public void setVideoReportStatus(String videoReportStatus) {
		this.videoReportStatus = videoReportStatus;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getVideoReportType() {
		return videoReportType;
	}
	public void setVideoReportType(String videoReportType) {
		this.videoReportType = videoReportType;
	}
	public String getVideoReportReply() {
		return videoReportReply;
	}
	public void setVideoReportReply(String videoReportReply) {
		this.videoReportReply = videoReportReply;
	}
	public Integer getVideoSeqNo() {
		return videoSeqNo;
	}
	public void setVideoSeqNo(Integer videoSeqNo) {
		this.videoSeqNo = videoSeqNo;
	}
	public String getVideoTitle() {
		return videoTitle;
	}
	public void setVideoTitle(String videoTitle) {
		this.videoTitle = videoTitle;
	}
	@Override
	public String toString() {
		return "VideoReportBean [videoReportSeqNo=" + videoReportSeqNo + ", videoReportArticle=" + videoReportArticle
				+ ", videoReportDate=" + videoReportDate + ", videoReportStatus=" + videoReportStatus + ", account="
				+ account + ", videoReportType=" + videoReportType + ", videoReportReply=" + videoReportReply
				+ ", videoSeqNo=" + videoSeqNo + ", videoTitle=" + videoTitle + "]";
	}
	public VideoReportBean(Integer videoReportSeqNo, String videoReportArticle, Timestamp videoReportDate,
			String videoReportStatus, String account, String videoReportType, String videoReportReply,
			Integer videoSeqNo, String videoTitle) {
		super();
		this.videoReportSeqNo = videoReportSeqNo;
		this.videoReportArticle = videoReportArticle;
		this.videoReportDate = videoReportDate;
		this.videoReportStatus = videoReportStatus;
		this.account = account;
		this.videoReportType = videoReportType;
		this.videoReportReply = videoReportReply;
		this.videoSeqNo = videoSeqNo;
		this.videoTitle = videoTitle;
	}
	public VideoReportBean() {
		super();
		// TODO Auto-generated constructor stub
	}



	
}
