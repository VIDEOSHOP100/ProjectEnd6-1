package com.iii._19_.videoType.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "videoType")
public class VideoTypeBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int sortedVideosSeqNo;
	private String videoType;
	private int sortedVideosScore;
	private String sortedVideosStatus;

	public VideoTypeBean() {
	}

	public VideoTypeBean(int sortedVideosSeqNo, String videoType, int sortedVideosScore, String sortedVideosStatus) {
		super();
		this.sortedVideosSeqNo = sortedVideosSeqNo;
		this.videoType = videoType;
		this.sortedVideosScore = sortedVideosScore;
		this.sortedVideosStatus = sortedVideosStatus;
	}

	@Override
	public String toString() {
		return "VideoTypeBean [sortedVideosSeqNo=" + sortedVideosSeqNo + ", videoType=" + videoType
				+ ", sortedVideosScore=" + sortedVideosScore + ", sortedVideosStatus=" + sortedVideosStatus + "]";
	}

	public int getSortedVideosSeqNo() {
		return sortedVideosSeqNo;
	}

	public void setSortedVideosSeqNo(int sortedVideosSeqNo) {
		this.sortedVideosSeqNo = sortedVideosSeqNo;
	}

	public String getVideoType() {
		return videoType;
	}

	public void setVideoType(String videoType) {
		this.videoType = videoType;
	}

	public int getSortedVideosScore() {
		return sortedVideosScore;
	}

	public void setSortedVideosScore(int sortedVideosScore) {
		this.sortedVideosScore = sortedVideosScore;
	}

	public String getSortedVideosStatus() {
		return sortedVideosStatus;
	}

	public void setSortedVideosStatus(String sortedVideosStatus) {
		this.sortedVideosStatus = sortedVideosStatus;
	}

}
