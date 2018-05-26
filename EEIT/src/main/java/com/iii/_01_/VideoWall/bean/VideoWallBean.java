package com.iii._01_.VideoWall.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="VideoWall")
public class VideoWallBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer VideoWallSeqNo;
	private Integer VideoSeqNo;
	
	
	
	
	
	public Integer getVideoWallSeqNo() {
		return VideoWallSeqNo;
	}
	public void setVideoWallSeqNo(Integer videoWallSeqNo) {
		VideoWallSeqNo = videoWallSeqNo;
	}
	public Integer getVideoSeqNo() {
		return VideoSeqNo;
	}
	public void setVideoSeqNo(Integer videoSeqNo) {
		VideoSeqNo = videoSeqNo;
	}
	public VideoWallBean(Integer videoWallSeqNo, Integer videoSeqNo) {
		super();
		VideoWallSeqNo = videoWallSeqNo;
		VideoSeqNo = videoSeqNo;
	}
	public VideoWallBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
