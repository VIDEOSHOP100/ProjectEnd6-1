package com.iii._01_.MyMessage.bean;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "myMessage")
public class MyMessageBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer myMessageSeqNo;
	private String myMessageFrom;
	private String myMessageTo;
	private String myMessageTitle;
	private String myMessageContent;
	private String myMessageStatus;
	private Timestamp myMessageTime;

	@Override
	public String toString() {
		return "MyMessageBean [myMessageSeqNo=" + myMessageSeqNo + ", myMessageFrom=" + myMessageFrom + ", myMessageTo="
				+ myMessageTo + ", myMessageTitle=" + myMessageTitle + ", myMessageContent=" + myMessageContent
				+ ", myMessageStatus=" + myMessageStatus + ", myMessageTime=" + myMessageTime + "]";
	}

	public Integer getMyMessageSeqNo() {
		return myMessageSeqNo;
	}

	public void setMyMessageSeqNo(Integer myMessageSeqNo) {
		this.myMessageSeqNo = myMessageSeqNo;
	}

	public String getMyMessageFrom() {
		return myMessageFrom;
	}

	public void setMyMessageFrom(String myMessageFrom) {
		this.myMessageFrom = myMessageFrom;
	}

	public String getMyMessageTo() {
		return myMessageTo;
	}

	public void setMyMessageTo(String myMessageTo) {
		this.myMessageTo = myMessageTo;
	}

	public String getMyMessageTitle() {
		return myMessageTitle;
	}

	public void setMyMessageTitle(String myMessageTitle) {
		this.myMessageTitle = myMessageTitle;
	}

	public String getMyMessageContent() {
		return myMessageContent;
	}

	public void setMyMessageContent(String myMessageContent) {
		this.myMessageContent = myMessageContent;
	}

	public String getMyMessageStatus() {
		return myMessageStatus;
	}

	public void setMyMessageStatus(String myMessageStatus) {
		this.myMessageStatus = myMessageStatus;
	}

	public Timestamp getMyMessageTime() {
		return myMessageTime;
	}

	public void setMyMessageTime(Timestamp myMessageTime) {
		this.myMessageTime = myMessageTime;
	}

	public MyMessageBean(Integer myMessageSeqNo, String myMessageFrom, String myMessageTo, String myMessageTitle,
			String myMessageContent, String myMessageStatus, Timestamp myMessageTime) {
		super();
		this.myMessageSeqNo = myMessageSeqNo;
		this.myMessageFrom = myMessageFrom;
		this.myMessageTo = myMessageTo;
		this.myMessageTitle = myMessageTitle;
		this.myMessageContent = myMessageContent;
		this.myMessageStatus = myMessageStatus;
		this.myMessageTime = myMessageTime;
	}

	public MyMessageBean() {
		super();
	}

}
