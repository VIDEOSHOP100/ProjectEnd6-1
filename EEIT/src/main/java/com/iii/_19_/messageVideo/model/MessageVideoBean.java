package com.iii._19_.messageVideo.model;

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
@Table(name = "MessageVideo")
public class MessageVideoBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer messageVideoSeqNo;
	private String messageVideoName;
	private String messageVideoOriginalName;
	private String messageVideoPath;
	private String messageVideoType;
	private String messageVideoStatus;
	private Integer messageVideoScore;
	private Timestamp messageVideoUploadDate;

	@Transient
	@XmlTransient
	private MultipartFile messageVideo;

	public MultipartFile getMessageVideo() {
		return messageVideo;
	}

	public void setMessageVideo(MultipartFile messageVideo) {
		this.messageVideo = messageVideo;
	}

	public MessageVideoBean(Integer messageVideoSeqNo, String messageVideoName, String messageVideoOriginalName,
			String messageVideoPath, String messageVideoType, String messageVideoStatus, Integer messageVideoScore,
			Timestamp messageVideoUploadDate) {
		super();
		this.messageVideoSeqNo = messageVideoSeqNo;
		this.messageVideoName = messageVideoName;
		this.messageVideoOriginalName = messageVideoOriginalName;
		this.messageVideoPath = messageVideoPath;
		this.messageVideoType = messageVideoType;
		this.messageVideoStatus = messageVideoStatus;
		this.messageVideoScore = messageVideoScore;
		this.messageVideoUploadDate = messageVideoUploadDate;
	}

	public MessageVideoBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "MessageVideoBean [messageVideoSeqNo=" + messageVideoSeqNo + ", messageVideoName=" + messageVideoName
				+ ", messageVideoOriginalName=" + messageVideoOriginalName + ", messageVideoPath=" + messageVideoPath
				+ ", messageVideoType=" + messageVideoType + ", messageVideoStatus=" + messageVideoStatus
				+ ", messageVideoScore=" + messageVideoScore + ", messageVideoUploadDate=" + messageVideoUploadDate
				+ "]";
	}

	public Integer getMessageVideoSeqNo() {
		return messageVideoSeqNo;
	}

	public void setMessageVideoSeqNo(Integer messageVideoSeqNo) {
		this.messageVideoSeqNo = messageVideoSeqNo;
	}

	public String getMessageVideoName() {
		return messageVideoName;
	}

	public void setMessageVideoName(String messageVideoName) {
		this.messageVideoName = messageVideoName;
	}

	public String getMessageVideoOriginalName() {
		return messageVideoOriginalName;
	}

	public void setMessageVideoOriginalName(String messageVideoOriginalName) {
		this.messageVideoOriginalName = messageVideoOriginalName;
	}

	public String getMessageVideoPath() {
		return messageVideoPath;
	}

	public void setMessageVideoPath(String messageVideoPath) {
		this.messageVideoPath = messageVideoPath;
	}

	public String getMessageVideoType() {
		return messageVideoType;
	}

	public void setMessageVideoType(String messageVideoType) {
		this.messageVideoType = messageVideoType;
	}

	public String getMessageVideoStatus() {
		return messageVideoStatus;
	}

	public void setMessageVideoStatus(String messageVideoStatus) {
		this.messageVideoStatus = messageVideoStatus;
	}

	public Integer getMessageVideoScore() {
		return messageVideoScore;
	}

	public void setMessageVideoScore(Integer messageVideoScore) {
		this.messageVideoScore = messageVideoScore;
	}

	public Timestamp getMessageVideoUploadDate() {
		return messageVideoUploadDate;
	}

	public void setMessageVideoUploadDate(Timestamp messageVideoUploadDate) {
		this.messageVideoUploadDate = messageVideoUploadDate;
	}

}
