package com.iii._16_.ProductSale.ProductPicture.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;
@Entity
@Table(name="ProductPicture")
public class ProPicBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer picSeqNo;
	private Integer proPicSerial;
	private String proPicName;
	private String proPicPath;
	private Integer productSeqNo;
	
	@Transient
	private MultipartFile ProPicFile;

	public Integer getPicSeqNo() {
		return picSeqNo;
	}

	public void setPicSeqNo(Integer picSeqNo) {
		this.picSeqNo = picSeqNo;
	}

	

	public Integer getProductSeqNo() {
		return productSeqNo;
	}

	public void setProductSeqNo(Integer productSeqNo) {
		this.productSeqNo = productSeqNo;
	}

	

	public Integer getProPicSerial() {
		return proPicSerial;
	}

	public void setProPicSerial(Integer proPicSerial) {
		this.proPicSerial = proPicSerial;
	}

	public String getProPicName() {
		return proPicName;
	}

	public void setProPicName(String proPicName) {
		this.proPicName = proPicName;
	}

	public String getProPicPath() {
		return proPicPath;
	}

	public void setProPicPath(String proPicPath) {
		this.proPicPath = proPicPath;
	}

	public MultipartFile getProPicFile() {
		return ProPicFile;
	}

	public void setProPicFile(MultipartFile proPicFile) {
		ProPicFile = proPicFile;
	}

	

	public ProPicBean(Integer picSeqNo, Integer proPicSerial, String proPicName, String proPicPath,
			Integer productSeqNo) {
		super();
		this.picSeqNo = picSeqNo;
		this.proPicSerial = proPicSerial;
		this.proPicName = proPicName;
		this.proPicPath = proPicPath;
		this.productSeqNo = productSeqNo;
		
	}

	public ProPicBean() {
		super();
	}

	@Override
	public String toString() {
		return "ProPicBean [picSeqNo=" + picSeqNo + ", proPicSerial=" + proPicSerial + ", proPicName=" + proPicName
				+ ", proPicPath=" + proPicPath + ", productSeqNo=" + productSeqNo + ", ProPicFile=" + ProPicFile + "]";
	}

	
	
}
