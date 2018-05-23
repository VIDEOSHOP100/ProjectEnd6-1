package com.iii._05_.InputLiveStreamTime.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "LiveStream")
public class InputLiveStreamTimeBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer liveStreamSeqNo;
	private String account;
	private Timestamp liveStart;
	private Timestamp liveEnd;
	private Integer videoSeqNo;
	private String streamName;
	private String liveStatus;
	private String liveCoverPath;
	private String liveCoverName;
	private String liveStreamPath;
	private Integer liveStreamView;
	private Integer allLiveStreamView;
	@Transient
	private MultipartFile photo; // 照片
	
	public InputLiveStreamTimeBean() {
		super();
		
	}













	@Override
	public String toString() {
		return "InputLiveStreamTimeBean [liveStreamSeqNo=" + liveStreamSeqNo + ", account=" + account + ", liveStart="
				+ liveStart + ", liveEnd=" + liveEnd + ", videoSeqNo=" + videoSeqNo + ", streamName=" + streamName
				+ ", liveStatus=" + liveStatus + ", liveCoverPath=" + liveCoverPath + ", liveCoverName=" + liveCoverName
				+ ", liveStreamPath=" + liveStreamPath + ", liveStreamView=" + liveStreamView + ", photo=" + photo
				+ "]";
	}

	public InputLiveStreamTimeBean(Integer liveStreamSeqNo, String account, Timestamp liveStart, Timestamp liveEnd,
			Integer videoSeqNo, String streamName, String liveStatus, String liveCoverPath, String liveCoverName,
			String liveStreamPath, Integer liveStreamView, MultipartFile photo) {
		super();
		this.liveStreamSeqNo = liveStreamSeqNo;
		this.account = account;
		this.liveStart = liveStart;
		this.liveEnd = liveEnd;
		this.videoSeqNo = videoSeqNo;
		this.streamName = streamName;
		this.liveStatus = liveStatus;
		this.liveCoverPath = liveCoverPath;
		this.liveCoverName = liveCoverName;
		this.liveStreamPath = liveStreamPath;
		this.liveStreamView = liveStreamView;
		this.photo = photo;
	}
	
	public Integer getLiveStreamSeqNo() {
		return liveStreamSeqNo;
	}

	public void setLiveStreamSeqNo(Integer liveStreamSeqNo) {
		this.liveStreamSeqNo = liveStreamSeqNo;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public Timestamp getLiveStart() {
		return liveStart;
	}

	public void setLiveStart(Timestamp liveStart) {
		this.liveStart = liveStart;
	}

	public Timestamp getLiveEnd() {
		return liveEnd;
	}

	public void setLiveEnd(Timestamp liveEnd) {
		this.liveEnd = liveEnd;
	}

	public Integer getVideoSeqNo() {
		return videoSeqNo;
	}

	public void setVideoSeqNo(Integer videoSeqNo) {
		this.videoSeqNo = videoSeqNo;
	}

	public String getStreamName() {
		return streamName;
	}

	public void setStreamName(String streamName) {
		this.streamName = streamName;
	}

	public String getLiveStatus() {
		return liveStatus;
	}

	public void setLiveStatus(String liveStatus) {
		this.liveStatus = liveStatus;
	}

	public String getLiveCoverPath() {
		return liveCoverPath;
	}

	public void setLiveCoverPath(String liveCoverPath) {
		this.liveCoverPath = liveCoverPath;
	}

	public String getLiveCoverName() {
		return liveCoverName;
	}

	public void setLiveCoverName(String liveCoverName) {
		this.liveCoverName = liveCoverName;
	}

	public String getLiveStreamPath() {
		return liveStreamPath;
	}

	public void setLiveStreamPath(String liveStreamPath) {
		this.liveStreamPath = liveStreamPath;
	}

	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

	public Integer getLiveStreamView() {
		return liveStreamView;
	}
	public void setLiveStreamView(Integer liveStreamView) {
		this.liveStreamView = liveStreamView;
	}

	public Integer getAllLiveStreamView() {
		return allLiveStreamView;
	}

	public void setAllLiveStreamView(Integer allLiveStreamView) {
		this.allLiveStreamView = allLiveStreamView;
	}


}
