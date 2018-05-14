package com.iii._19_.messageFile.model;

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
@Table(name = "MessageFile")
public class MessageFileBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer messageFileSeqNo;
	private String messageFileName;
	private String messageFileOriginalName;
	private String messageFilePath;
	private String messageFileType;
	private String messageFileStatus;
	private Integer messageFileScore;
	private Timestamp messageFileUploadDate;

	@Transient
	@XmlTransient
	private MultipartFile messageFile;

	public MessageFileBean(Integer messageFileSeqNo, String messageFileName, String messageFileOriginalName,
			String messageFilePath, String messageFileType, String messageFileStatus, Integer messageFileScore,
			Timestamp messageFileUploadDate, MultipartFile messageFile) {
		super();
		this.messageFileSeqNo = messageFileSeqNo;
		this.messageFileName = messageFileName;
		this.messageFileOriginalName = messageFileOriginalName;
		this.messageFilePath = messageFilePath;
		this.messageFileType = messageFileType;
		this.messageFileStatus = messageFileStatus;
		this.messageFileScore = messageFileScore;
		this.messageFileUploadDate = messageFileUploadDate;
		this.messageFile = messageFile;
	}

	public MessageFileBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getMessageFileSeqNo() {
		return messageFileSeqNo;
	}

	public void setMessageFileSeqNo(Integer messageFileSeqNo) {
		this.messageFileSeqNo = messageFileSeqNo;
	}

	public String getMessageFileName() {
		return messageFileName;
	}

	public void setMessageFileName(String messageFileName) {
		this.messageFileName = messageFileName;
	}

	public String getMessageFileOriginalName() {
		return messageFileOriginalName;
	}

	public void setMessageFileOriginalName(String messageFileOriginalName) {
		this.messageFileOriginalName = messageFileOriginalName;
	}

	public String getMessageFilePath() {
		return messageFilePath;
	}

	public void setMessageFilePath(String messageFilePath) {
		this.messageFilePath = messageFilePath;
	}

	public String getMessageFileType() {
		return messageFileType;
	}

	public void setMessageFileType(String messageFileType) {
		this.messageFileType = messageFileType;
	}

	public String getMessageFileStatus() {
		return messageFileStatus;
	}

	public void setMessageFileStatus(String messageFileStatus) {
		this.messageFileStatus = messageFileStatus;
	}

	public Integer getMessageFileScore() {
		return messageFileScore;
	}

	public void setMessageFileScore(Integer messageFileScore) {
		this.messageFileScore = messageFileScore;
	}

	public Timestamp getMessageFileUploadDate() {
		return messageFileUploadDate;
	}

	public void setMessageFileUploadDate(Timestamp messageFileUploadDate) {
		this.messageFileUploadDate = messageFileUploadDate;
	}

	public MultipartFile getMessageFile() {
		return messageFile;
	}

	public void setMessageFile(MultipartFile messageFile) {
		this.messageFile = messageFile;
	}

	@Override
	public String toString() {
		return "MessageFileBean [messageFileSeqNo=" + messageFileSeqNo + ", messageFileName=" + messageFileName
				+ ", messageFileOriginalName=" + messageFileOriginalName + ", messageFilePath=" + messageFilePath
				+ ", messageFileType=" + messageFileType + ", messageFileStatus=" + messageFileStatus
				+ ", messageFileScore=" + messageFileScore + ", messageFileUploadDate=" + messageFileUploadDate
				+ ", messageFile=" + messageFile + "]";
	}

}
