package com.iii._09_.otherbean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlTransient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "dbo.ProductPicture")
public class ProductPictureBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer picSeqNo;//圖片流水號 PK
	private Integer proPicSerial;//圖片編號
	private Integer productSeqNo;//商品流水號 FK
	

	public ProductPictureBean(Integer picSeqNo, Integer proPicSerial, Integer productSeqNo) {
		super();
		this.picSeqNo = picSeqNo;
		this.proPicSerial = proPicSerial;
		this.productSeqNo = productSeqNo;
	}
	
	public ProductPictureBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getPicSeqNo() {
		return picSeqNo;
	}
	public void setPicSeqNo(Integer picSeqNo) {
		this.picSeqNo = picSeqNo;
	}
	public Integer getProPicSerial() {
		return proPicSerial;
	}
	public void setProPicSerial(Integer proPicSerial) {
		this.proPicSerial = proPicSerial;
	}
	public Integer getProductSeqNo() {
		return productSeqNo;
	}
	public void setProductSeqNo(Integer productSeqNo) {
		this.productSeqNo = productSeqNo;
	}
	
	@Override
	public String toString() {
		return "productPictureBean [picSeqNo=" + picSeqNo + ", proPicSerial=" + proPicSerial + ", productSeqNo="
				+ productSeqNo + "]";
	}
	

	
}
