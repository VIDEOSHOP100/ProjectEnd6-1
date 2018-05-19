package com.iii._16_.PDF.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "OrderPdf")
public class orderPdfBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderPdfSeqNo;
	private String orderPdfFileName;
	private String orderPdfFilePath;
	private Integer orderSeqNo;
	@Transient
	private MultipartFile orderPdfFile;
	public Integer getOrderPdfSeqNo() {
		return orderPdfSeqNo;
	}
	public void setOrderPdfSeqNo(Integer orderPdfSeqNo) {
		this.orderPdfSeqNo = orderPdfSeqNo;
	}
	public String getOrderPdfFileName() {
		return orderPdfFileName;
	}
	public void setOrderPdfFileName(String orderPdfFileName) {
		this.orderPdfFileName = orderPdfFileName;
	}
	public String getOrderPdfFilePath() {
		return orderPdfFilePath;
	}
	public void setOrderPdfFilePath(String orderPdfFilePath) {
		this.orderPdfFilePath = orderPdfFilePath;
	}
	public Integer getOrderSeqNo() {
		return orderSeqNo;
	}
	public void setOrderSeqNo(Integer orderSeqNo) {
		this.orderSeqNo = orderSeqNo;
	}
	public MultipartFile getOrderPdfFile() {
		return orderPdfFile;
	}
	public void setOrderPdfFile(MultipartFile orderPdfFile) {
		this.orderPdfFile = orderPdfFile;
	}
	public orderPdfBean(Integer orderPdfSeqNo, String orderPdfFileName, String orderPdfFilePath, Integer orderSeqNo) {
		super();
		this.orderPdfSeqNo = orderPdfSeqNo;
		this.orderPdfFileName = orderPdfFileName;
		this.orderPdfFilePath = orderPdfFilePath;
		this.orderSeqNo = orderSeqNo;
	}
	public orderPdfBean() {
		super();
	}


}
