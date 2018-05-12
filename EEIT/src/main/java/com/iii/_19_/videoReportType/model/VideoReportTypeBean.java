package com.iii._19_.videoReportType.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "VideoReportType")
public class VideoReportTypeBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer videoReportTypeSeqNo;
	private String videoReportType;
	private String videoReportTypeStatus;
	private Integer videoReportTypeScore;

	public VideoReportTypeBean(Integer videoReportTypeSeqNo, String videoReportType, String videoReportTypeStatus,
			Integer videoReportTypeScore) {
		super();
		this.videoReportTypeSeqNo = videoReportTypeSeqNo;
		this.videoReportType = videoReportType;
		this.videoReportTypeStatus = videoReportTypeStatus;
		this.videoReportTypeScore = videoReportTypeScore;
	}

	public VideoReportTypeBean() {
		super();
	}

	public Integer getVideoReportTypeSeqNo() {
		return videoReportTypeSeqNo;
	}

	public void setVideoReportTypeSeqNo(Integer videoReportTypeSeqNo) {
		this.videoReportTypeSeqNo = videoReportTypeSeqNo;
	}

	public String getVideoReportType() {
		return videoReportType;
	}

	public void setVideoReportType(String videoReportType) {
		this.videoReportType = videoReportType;
	}

	public String getVideoReportTypeStatus() {
		return videoReportTypeStatus;
	}

	public void setVideoReportTypeStatus(String videoReportTypeStatus) {
		this.videoReportTypeStatus = videoReportTypeStatus;
	}

	public Integer getVideoReportTypeScore() {
		return videoReportTypeScore;
	}

	public void setVideoReportTypeScore(Integer videoReportTypeScore) {
		this.videoReportTypeScore = videoReportTypeScore;
	}

	@Override
	public String toString() {
		return "VideoReportTypeBean [videoReportTypeSeqNo=" + videoReportTypeSeqNo + ", videoReportType="
				+ videoReportType + ", videoReportTypeStatus=" + videoReportTypeStatus + ", videoReportTypeScore="
				+ videoReportTypeScore + "]";
	}

}
