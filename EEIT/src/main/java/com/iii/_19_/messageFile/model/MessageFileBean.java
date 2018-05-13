package com.iii._19_.messageFile.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "MessageFile")
public class MessageFileBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer messageFileSeqNo;
	private String messageFileName;
	private String messageFileFileName;
	private String messageFileFilePath;
	private String messageFileType;
	private String messageFileStatus;
	private Integer messageFileScore;
	private Timestamp messageFileUploadDate;

	public MessageFileBean(Integer messageFileSeqNo, String messageFileName, String messageFileFileName,
			String messageFileFilePath, String messageFileType, String messageFileStatus, Integer messageFileScore,
			Timestamp messageFileUploadDate) {
		super();
		this.messageFileSeqNo = messageFileSeqNo;
		this.messageFileName = messageFileName;
		this.messageFileFileName = messageFileFileName;
		this.messageFileFilePath = messageFileFilePath;
		this.messageFileType = messageFileType;
		this.messageFileStatus = messageFileStatus;
		this.messageFileScore = messageFileScore;
		this.messageFileUploadDate = messageFileUploadDate;
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

	public String getMessageFileFileName() {
		return messageFileFileName;
	}

	public void setMessageFileFileName(String messageFileFileName) {
		this.messageFileFileName = messageFileFileName;
	}

	public String getMessageFileFilePath() {
		return messageFileFilePath;
	}

	public void setMessageFileFilePath(String messageFileFilePath) {
		this.messageFileFilePath = messageFileFilePath;
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

	@Override
	public String toString() {
		return "MessageFileBean [messageFileSeqNo=" + messageFileSeqNo + ", messageFileName=" + messageFileName
				+ ", messageFileFileName=" + messageFileFileName + ", messageFileFilePath=" + messageFileFilePath
				+ ", messageFileType=" + messageFileType + ", messageFileStatus=" + messageFileStatus
				+ ", messageFileScore=" + messageFileScore + ", messageFileUploadDate=" + messageFileUploadDate + "]";
	}

}
