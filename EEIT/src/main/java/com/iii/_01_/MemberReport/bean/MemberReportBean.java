package com.iii._01_.MemberReport.bean;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "MemberReport")
public class MemberReportBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer memberReportSeqNo;
	private String accountFrom;
	private String accountTo;
	private String reportTitle;
	private String reportContent;
	private Timestamp reportTime;
	private String imageName;
	private String imagePath;
	private String reportStatus;
	private Timestamp replyTime;
	private String replyContent;

	public MemberReportBean() {
		super();
	}

	public MemberReportBean(Integer memberReportSeqNo, String accountFrom, String accountTo, String reportTitle,
			String reportContent, Timestamp reportTime, String imageName, String imagePath, String reportStatus,
			Timestamp replyTime, String replyContent) {
		super();
		this.memberReportSeqNo = memberReportSeqNo;
		this.accountFrom = accountFrom;
		this.accountTo = accountTo;
		this.reportTitle = reportTitle;
		this.reportContent = reportContent;
		this.reportTime = reportTime;
		this.imageName = imageName;
		this.imagePath = imagePath;
		this.reportStatus = reportStatus;
		this.replyTime = replyTime;
		this.replyContent = replyContent;
	}

	@Override
	public String toString() {
		return "MemberReportBean [memberReportSeqNo=" + memberReportSeqNo + ", accountFrom=" + accountFrom
				+ ", accountTo=" + accountTo + ", reportTitle=" + reportTitle + ", reportContent=" + reportContent
				+ ", reportTime=" + reportTime + ", imageName=" + imageName + ", imagePath=" + imagePath
				+ ", reportStatus=" + reportStatus + ", replyTime=" + replyTime + ", replyContent=" + replyContent
				+ "]";
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

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
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

	public Integer getMemberReportSeqNo() {
		return memberReportSeqNo;
	}

	public void setMemberReportSeqNo(Integer memberReportSeqNo) {
		this.memberReportSeqNo = memberReportSeqNo;
	}

}
