package com.iii._19_.sticker.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlTransient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "sticker")
public class StickerBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer stickerSeqNo;
	private String stickerFilePath;
	private String stickerFileName;
	private String stickerName;
	private String stickerType;
	private String stickerStatus;
	private Integer stickerScore;
	private Timestamp stickerUploadDate;

	@Transient
	@XmlTransient
	private MultipartFile stickerImage;

	public MultipartFile getStickerImage() {
		return stickerImage;
	}

	public void setStickerImage(MultipartFile stickerImage) {
		this.stickerImage = stickerImage;
	}

	public StickerBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StickerBean(Integer stickerSeqNo, String stickerFilePath, String stickerFileName, String stickerName,
			String stickerType, String stickerStatus, Integer stickerScore, Timestamp stickerUploadDate) {
		super();
		this.stickerSeqNo = stickerSeqNo;
		this.stickerFilePath = stickerFilePath;
		this.stickerFileName = stickerFileName;
		this.stickerName = stickerName;
		this.stickerType = stickerType;
		this.stickerStatus = stickerStatus;
		this.stickerScore = stickerScore;
		this.stickerUploadDate = stickerUploadDate;
	}

	public Integer getStickerSeqNo() {
		return stickerSeqNo;
	}

	public void setStickerSeqNo(Integer stickerSeqNo) {
		this.stickerSeqNo = stickerSeqNo;
	}

	public String getStickerFilePath() {
		return stickerFilePath;
	}

	public void setStickerFilePath(String stickerFilePath) {
		this.stickerFilePath = stickerFilePath;
	}

	public String getStickerFileName() {
		return stickerFileName;
	}

	public void setStickerFileName(String stickerFileName) {
		this.stickerFileName = stickerFileName;
	}

	public String getStickerName() {
		return stickerName;
	}

	public void setStickerName(String stickerName) {
		this.stickerName = stickerName;
	}

	public String getStickerType() {
		return stickerType;
	}

	public void setStickerType(String stickerType) {
		this.stickerType = stickerType;
	}

	public String getStickerStatus() {
		return stickerStatus;
	}

	public void setStickerStatus(String stickerStatus) {
		this.stickerStatus = stickerStatus;
	}

	public Integer getStickerScore() {
		return stickerScore;
	}

	public void setStickerScore(Integer stickerScore) {
		this.stickerScore = stickerScore;
	}

	public Timestamp getStickerUploadDate() {
		return stickerUploadDate;
	}

	public void setStickerUploadDate(Timestamp stickerUploadDate) {
		this.stickerUploadDate = stickerUploadDate;
	}

	@Override
	public String toString() {
		return "StickerBean [stickerSeqNo=" + stickerSeqNo + ", stickerFilePath=" + stickerFilePath
				+ ", stickerFileName=" + stickerFileName + ", stickerName=" + stickerName + ", stickerType="
				+ stickerType + ", stickerStatus=" + stickerStatus + ", stickerScore=" + stickerScore
				+ ", stickerUploadDate=" + stickerUploadDate + "]";
	}

}
