package com.iii._01_.ProductReport.bean;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ProductReport")
public class ProductReportBean {

	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private Integer productReportSeqNo;
	private String accountFrom;
	private Integer productSeqNo;
	private String reportTitle;
	private String reportContent;
	private String reportTime;
	private String imageName;
	private String imagePath;
	private String reportStatus;
	private Timestamp replyTime;
	private String replyContent;

	@Override
	public String toString() {
		return "ProductReportBean [productReportSeqNo=" + productReportSeqNo + ", accountFrom=" + accountFrom
				+ ", productSeqNo=" + productSeqNo + ", reportTitle=" + reportTitle + ", reportContent=" + reportContent
				+ ", reportTime=" + reportTime + ", imageName=" + imageName + ", imagePath=" + imagePath
				+ ", reportStatus=" + reportStatus + ", replyTime=" + replyTime + ", replyContent=" + replyContent
				+ "]";
	}

	public ProductReportBean(Integer productReportSeqNo, String accountFrom, Integer productSeqNo, String reportTitle,
			String reportContent, String reportTime, String imageName, String imagePath, String reportStatus,
			Timestamp replyTime, String replyContent) {
		super();
		this.productReportSeqNo = productReportSeqNo;
		this.accountFrom = accountFrom;
		this.productSeqNo = productSeqNo;
		this.reportTitle = reportTitle;
		this.reportContent = reportContent;
		this.reportTime = reportTime;
		this.imageName = imageName;
		this.imagePath = imagePath;
		this.reportStatus = reportStatus;
		this.replyTime = replyTime;
		this.replyContent = replyContent;
	}

	public ProductReportBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getProductReportSeqNo() {
		return productReportSeqNo;
	}

	public void setProductReportSeqNo(Integer productReportSeqNo) {
		this.productReportSeqNo = productReportSeqNo;
	}

	public String getAccountFrom() {
		return accountFrom;
	}

	public void setAccountFrom(String accountFrom) {
		this.accountFrom = accountFrom;
	}

	public Integer getProductSeqNo() {
		return productSeqNo;
	}

	public void setProductSeqNo(Integer productSeqNo) {
		this.productSeqNo = productSeqNo;
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

	public String getReportTime() {
		return reportTime;
	}

	public void setReportTime(String reportTime) {
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

}
