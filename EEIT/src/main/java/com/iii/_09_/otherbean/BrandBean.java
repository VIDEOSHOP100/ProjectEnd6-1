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
@Table(name="dbo.Brand")
public class BrandBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private	Integer brandSeqNo;//品牌流水號
	private String brandName;//品牌名稱

	
	@Transient
	@XmlTransient
	private MultipartFile brandPicPath;//品牌圖片


	public MultipartFile getBrandPicPath() {
		return brandPicPath;
	}


	public void setBrandPicPath(MultipartFile brandPicPath) {
		this.brandPicPath = brandPicPath;
	}


	
	public BrandBean(Integer brandSeqNo, String brandName, MultipartFile brandPicPath) {
		super();
		this.brandSeqNo = brandSeqNo;
		this.brandName = brandName;
		this.brandPicPath = brandPicPath;
	}


	public BrandBean() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Integer getBrandSeqNo() {
		return brandSeqNo;
	}


	public void setBrandSeqNo(Integer brandSeqNo) {
		this.brandSeqNo = brandSeqNo;
	}


	public String getBrandName() {
		return brandName;
	}


	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}


	@Override
	public String toString() {
		return "brandBean [brandSeqNo=" + brandSeqNo + ", brandName=" + brandName + ", brandPicPath=" + brandPicPath
				+ "]";
	}

	
	
}
