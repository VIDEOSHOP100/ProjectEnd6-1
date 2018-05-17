package com.iii._05_.liveStreamReport.model;



import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "LiveStreamReport")
public class liveStreamReportBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer liveStreamReportSeqNo;
	private String 		accountFrom;
	private String		accountTo;
	private String		reportTitle;
	private String		reportContent;
	private Timestamp	reportTime;
	private String		reportStatus;
	private Timestamp	replyTime;
	private String		replyContent;
	private Integer		reportType;
	public Integer getLiveStreamReportSeqNo() {
		return liveStreamReportSeqNo;
	}
	public void setLiveStreamReportSeqNo(Integer liveStreamReportSeqNo) {
		this.liveStreamReportSeqNo = liveStreamReportSeqNo;
	}
	public String getAccountFrom() {
		return accountFrom;
	}
	public void setAccountFrom(String accountFrom) {
		this.accountFrom = accountFrom;
	}
	public String getAccountTo() {
		return accountTo;
	}
	public void setAccountTo(String accountTo) {
		this.accountTo = accountTo;
	}
	public String getReportTitle() {
		return reportTitle;
	}
	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public Timestamp getReportTime() {
		return reportTime;
	}
	public void setReportTime(Timestamp reportTime) {
		this.reportTime = reportTime;
	}
	public String getReportStatus() {
		return reportStatus;
	}
	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
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
	public Integer getReportType() {
		return reportType;
	}
	public void setReportType(Integer reportType) {
		this.reportType = reportType;
	}
	@Override
	public String toString() {
		return "liveStreamReportBean [liveStreamReportSeqNo=" + liveStreamReportSeqNo + ", accountFrom=" + accountFrom
				+ ", accountTo=" + accountTo + ", reportTitle=" + reportTitle + ", reportContent=" + reportContent
				+ ", reportTime=" + reportTime + ", reportStatus=" + reportStatus + ", replyTime=" + replyTime
				+ ", replyContent=" + replyContent + ", reportType=" + reportType + "]";
	}
	public liveStreamReportBean(Integer liveStreamReportSeqNo, String accountFrom, String accountTo, String reportTitle,
			String reportContent, Timestamp reportTime, String reportStatus, Timestamp replyTime, String replyContent,
			Integer reportType) {
		super();
		this.liveStreamReportSeqNo = liveStreamReportSeqNo;
		this.accountFrom = accountFrom;
		this.accountTo = accountTo;
		this.reportTitle = reportTitle;
		this.reportContent = reportContent;
		this.reportTime = reportTime;
		this.reportStatus = reportStatus;
		this.replyTime = replyTime;
		this.replyContent = replyContent;
		this.reportType = reportType;
	}
	public liveStreamReportBean() {
		super();
		
	}
	
	
	
	
}
