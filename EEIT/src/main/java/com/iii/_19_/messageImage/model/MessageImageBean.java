package com.iii._19_.messageImage.model;

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
@Table(name = "MessageImage")
public class MessageImageBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer messageImageSeqNo;
	private String messageImageName;
	private String messageImageFileName;
	private String messageImageFilePath;
	private String messageImageType;
	private String messageImageStatus;
	private Integer messageImageScore;
	private Timestamp messageImageUploadDate;
	
	@Transient
	@XmlTransient
	private MultipartFile messageImage;
	
	public MultipartFile getMessageImage() {
		return messageImage;
	}

	public void setMessageImage(MultipartFile messageImage) {
		this.messageImage = messageImage;
	}

	public MessageImageBean(Integer messageImageSeqNo, String messageImageName, String messageImageFileName,
			String messageImageFilePath, String messageImageType, String messageImageStatus, Integer messageImageScore,
			Timestamp messageImageUploadDate) {
		super();
		this.messageImageSeqNo = messageImageSeqNo;
		this.messageImageName = messageImageName;
		this.messageImageFileName = messageImageFileName;
		this.messageImageFilePath = messageImageFilePath;
		this.messageImageType = messageImageType;
		this.messageImageStatus = messageImageStatus;
		this.messageImageScore = messageImageScore;
		this.messageImageUploadDate = messageImageUploadDate;
	}

	public MessageImageBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getMessageImageSeqNo() {
		return messageImageSeqNo;
	}

	public void setMessageImageSeqNo(Integer messageImageSeqNo) {
		this.messageImageSeqNo = messageImageSeqNo;
	}

	public String getMessageImageName() {
		return messageImageName;
	}

	public void setMessageImageName(String messageImageName) {
		this.messageImageName = messageImageName;
	}

	public String getMessageImageFileName() {
		return messageImageFileName;
	}

	public void setMessageImageFileName(String messageImageFileName) {
		this.messageImageFileName = messageImageFileName;
	}

	public String getMessageImageFilePath() {
		return messageImageFilePath;
	}

	public void setMessageImageFilePath(String messageImageFilePath) {
		this.messageImageFilePath = messageImageFilePath;
	}

	public String getMessageImageType() {
		return messageImageType;
	}

	public void setMessageImageType(String messageImageType) {
		this.messageImageType = messageImageType;
	}

	public String getMessageImageStatus() {
		return messageImageStatus;
	}

	public void setMessageImageStatus(String messageImageStatus) {
		this.messageImageStatus = messageImageStatus;
	}

	public Integer getMessageImageScore() {
		return messageImageScore;
	}

	public void setMessageImageScore(Integer messageImageScore) {
		this.messageImageScore = messageImageScore;
	}

	public Timestamp getMessageImageUploadDate() {
		return messageImageUploadDate;
	}

	public void setMessageImageUploadDate(Timestamp messageImageUploadDate) {
		this.messageImageUploadDate = messageImageUploadDate;
	}

	@Override
	public String toString() {
		return "MessageImageBean [messageImageSeqNo=" + messageImageSeqNo + ", messageImageName=" + messageImageName
				+ ", messageImageFileName=" + messageImageFileName + ", messageImageFilePath=" + messageImageFilePath
				+ ", messageImageType=" + messageImageType + ", messageImageStatus=" + messageImageStatus
				+ ", messageImageScore=" + messageImageScore + ", messageImageUploadDate=" + messageImageUploadDate
				+ "]";
	}

}
