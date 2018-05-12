package com.iii._19_.videoManage.model;

import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlTransient;

import org.springframework.web.multipart.MultipartFile;

import com.iii._19_.watchHistory.model.WatchHistoryBean;

@Entity
@Table(name = "video")
public class VideoBean {

	@OneToMany(mappedBy = "videoSeqNo")
	private Set<WatchHistoryBean> watchHistoryBeanSet;
	
	public Set<WatchHistoryBean> getWatchHistoryBeanSet() {
		return watchHistoryBeanSet;
	}

	public void setWatchHistoryBeanSet(Set<WatchHistoryBean> watchHistoryBeanSet) {
		this.watchHistoryBeanSet = watchHistoryBeanSet;
	}

	@Transient
	@XmlTransient
	private MultipartFile videoImage;

	public MultipartFile getVideoImage() {
		return videoImage;
	}

	public void setVideoImage(MultipartFile videoImage) {
		this.videoImage = videoImage;
	}

	@Transient
	@XmlTransient
	private MultipartFile videoFile;

	public MultipartFile getVideoFile() {
		return videoFile;
	}

	public void setVideoFile(MultipartFile videoFile) {
		this.videoFile = videoFile;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int videoSeqNo;
	private String videoTitle;
	private String account;
	private String videoDescription;
	private String videoType;
	private String videoUplodaerListType;
	private Timestamp videoUploadDate;
	private Integer videoLikes;
	private Integer videoUnlikes;
	private Integer videoViews;
	private String videoStatus;
	private String videoFilePath;
	private String VideoFileName;
	private String videoImageFilePath;
	private String videoImageFileName;

	public VideoBean(MultipartFile videoImage, MultipartFile videoFile, int videoSeqNo, String videoTitle,
			String account, String videoDescription, String videoType, String videoUplodaerListType,
			Timestamp videoUploadDate, Integer videoLikes, Integer videoUnlikes, Integer videoViews, String videoStatus,
			String videoFilePath, String videoFileName, String videoImageFilePath, String videoImageFileName) {
		super();
		this.videoImage = videoImage;
		this.videoFile = videoFile;
		this.videoSeqNo = videoSeqNo;
		this.videoTitle = videoTitle;
		this.account = account;
		this.videoDescription = videoDescription;
		this.videoType = videoType;
		this.videoUplodaerListType = videoUplodaerListType;
		this.videoUploadDate = videoUploadDate;
		this.videoLikes = videoLikes;
		this.videoUnlikes = videoUnlikes;
		this.videoViews = videoViews;
		this.videoStatus = videoStatus;
		this.videoFilePath = videoFilePath;
		VideoFileName = videoFileName;
		this.videoImageFilePath = videoImageFilePath;
		this.videoImageFileName = videoImageFileName;
	}

	public VideoBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getVideoSeqNo() {
		return videoSeqNo;
	}

	public void setVideoSeqNo(int videoSeqNo) {
		this.videoSeqNo = videoSeqNo;
	}

	public String getVideoTitle() {
		return videoTitle;
	}

	public void setVideoTitle(String videoTitle) {
		this.videoTitle = videoTitle;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getVideoDescription() {
		return videoDescription;
	}

	public void setVideoDescription(String videoDescription) {
		this.videoDescription = videoDescription;
	}

	public String getVideoType() {
		return videoType;
	}

	public void setVideoType(String videoType) {
		this.videoType = videoType;
	}

	public String getVideoUplodaerListType() {
		return videoUplodaerListType;
	}

	public void setVideoUplodaerListType(String videoUplodaerListType) {
		this.videoUplodaerListType = videoUplodaerListType;
	}

	public Timestamp getVideoUploadDate() {
		return videoUploadDate;
	}

	public void setVideoUploadDate(Timestamp videoUploadDate) {
		this.videoUploadDate = videoUploadDate;
	}

	public Integer getVideoLikes() {
		return videoLikes;
	}

	public void setVideoLikes(Integer videoLikes) {
		this.videoLikes = videoLikes;
	}

	public Integer getVideoUnlikes() {
		return videoUnlikes;
	}

	public void setVideoUnlikes(Integer videoUnlikes) {
		this.videoUnlikes = videoUnlikes;
	}

	public Integer getVideoViews() {
		return videoViews;
	}

	public void setVideoViews(Integer videoViews) {
		this.videoViews = videoViews;
	}

	public String getVideoStatus() {
		return videoStatus;
	}

	public void setVideoStatus(String videoStatus) {
		this.videoStatus = videoStatus;
	}

	public String getVideoFilePath() {
		return videoFilePath;
	}

	public void setVideoFilePath(String videoFilePath) {
		this.videoFilePath = videoFilePath;
	}

	public String getVideoFileName() {
		return VideoFileName;
	}

	public void setVideoFileName(String videoFileName) {
		VideoFileName = videoFileName;
	}

	public String getVideoImageFilePath() {
		return videoImageFilePath;
	}

	public void setVideoImageFilePath(String videoImageFilePath) {
		this.videoImageFilePath = videoImageFilePath;
	}

	public String getVideoImageFileName() {
		return videoImageFileName;
	}

	public void setVideoImageFileName(String videoImageFileName) {
		this.videoImageFileName = videoImageFileName;
	}

	@Override
	public String toString() {
		return "VideoBean [videoImage=" + videoImage + ", videoFile=" + videoFile + ", videoSeqNo=" + videoSeqNo
				+ ", videoTitle=" + videoTitle + ", account=" + account + ", videoDescription=" + videoDescription
				+ ", videoType=" + videoType + ", videoUplodaerListType=" + videoUplodaerListType + ", videoUploadDate="
				+ videoUploadDate + ", videoLikes=" + videoLikes + ", videoUnlikes=" + videoUnlikes + ", videoViews="
				+ videoViews + ", videoStatus=" + videoStatus + ", videoFilePath=" + videoFilePath + ", VideoFileName="
				+ VideoFileName + ", videoImageFilePath=" + videoImageFilePath + ", videoImageFileName="
				+ videoImageFileName + "]";
	}

}
