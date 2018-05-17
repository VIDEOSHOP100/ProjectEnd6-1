package com.iii._01_.AdviceReport.bean;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="AdviceReport")
public class AdviceReportBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer adviceSeqNo;
	private String account;
	private Timestamp adviceTime;
	private String adviceType;
	private String adviceTitle;
	private String adviceContent;
	private String adviceStatus;
	private Timestamp replyTime;
	private	String replyContent;
	
	public Integer getAdviceSeqNo() {
		return adviceSeqNo;
	}
	public void setAdviceSeqNo(Integer adviceSeqNo) {
		this.adviceSeqNo = adviceSeqNo;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public Timestamp getAdviceTime() {
		return adviceTime;
	}
	public void setAdviceTime(Timestamp adviceTime) {
		this.adviceTime = adviceTime;
	}
	public String getAdviceType() {
		return adviceType;
	}
	public void setAdviceType(String adviceType) {
		this.adviceType = adviceType;
	}
	public String getAdviceTitle() {
		return adviceTitle;
	}
	public void setAdviceTitle(String adviceTitle) {
		this.adviceTitle = adviceTitle;
	}
	public String getAdviceContent() {
		return adviceContent;
	}
	public void setAdviceContent(String adviceContent) {
		this.adviceContent = adviceContent;
	}
	public String getAdviceStatus() {
		return adviceStatus;
	}
	public void setAdviceStatus(String adviceStatus) {
		this.adviceStatus = adviceStatus;
	}
	public Timestamp getReplyTime() {
		return replyTime;
	}
	public void setReplyTime(Timestamp replyTime) {
		this.replyTime = replyTime;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public AdviceReportBean(Integer adviceSeqNo, String account, Timestamp adviceTime, String adviceType,
			String adviceTitle, String adviceContent, String adviceStatus, Timestamp replyTime, String replyContent) {
		super();
		this.adviceSeqNo = adviceSeqNo;
		this.account = account;
		this.adviceTime = adviceTime;
		this.adviceType = adviceType;
		this.adviceTitle = adviceTitle;
		this.adviceContent = adviceContent;
		this.adviceStatus = adviceStatus;
		this.replyTime = replyTime;
		this.replyContent = replyContent;
	}
	public AdviceReportBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
}
