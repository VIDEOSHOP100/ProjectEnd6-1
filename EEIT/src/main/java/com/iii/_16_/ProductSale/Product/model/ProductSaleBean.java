package com.iii._16_.ProductSale.Product.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "Product")
public class ProductSaleBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productSeqNo;
	private String proName;//v
	private Integer proCategorySeqNo;//v
	private String proBrand;//v
	private long proPrice;//v
	private Integer proStatus;//v
	private Integer proPayTypeSeqNo;//v
	private Integer proPcs;//v
	private String proDescription;
	
	private Integer proTransSeqNo;//v
	private Integer proAdverSeqNo;//v
	private String proVolume;//v
	private Double proWeight;//v
	private java.util.Date proDate;
	
	private Integer picSeqNo;
	private String account;
	
	@Transient
	private MultipartFile picFile;//v
	
	public MultipartFile getPicFile() {
		return picFile;
	}
	
	
	public Integer getPicSeqNo() {
		return picSeqNo;
	}


	public void setPicSeqNo(Integer picSeqNo) {
		this.picSeqNo = picSeqNo;
	}


	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}


	public void setPicFile(MultipartFile picFile) {
		this.picFile = picFile;
	}
	public Integer getProductSeqNo() {
		return productSeqNo;
	}
	public void setProductSeqNo(Integer productSeqNo) {
		this.productSeqNo = productSeqNo;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public Integer getProCategorySeqNo() {
		return proCategorySeqNo;
	}
	public void setProCategorySeqNo(Integer proCategorySeqNo) {
		this.proCategorySeqNo = proCategorySeqNo;
	}
	
	public long getProPrice() {
		return proPrice;
	}
	public void setProPrice(long proPrice) {
		this.proPrice = proPrice;
	}
	public Integer getProStatus() {
		return proStatus;
	}
	public void setProStatus(Integer proStatus) {
		this.proStatus = proStatus;
	}
	public Integer getProPayTypeSeqNo() {
		return proPayTypeSeqNo;
	}
	public void setProPayTypeSeqNo(Integer proPayTypeSeqNo) {
		this.proPayTypeSeqNo = proPayTypeSeqNo;
	}
	public Integer getProPcs() {
		return proPcs;
	}
	public void setProPcs(Integer proPcs) {
		this.proPcs = proPcs;
	}
	public String getProDescription() {
		return proDescription;
	}
	public void setProDescription(String proDescription) {
		this.proDescription = proDescription;
	}
	
	public Integer getProTransSeqNo() {
		return proTransSeqNo;
	}
	public void setProTransSeqNo(Integer proTransSeqNo) {
		this.proTransSeqNo = proTransSeqNo;
	}
	public Integer getProAdverSeqNo() {
		return proAdverSeqNo;
	}
	public void setProAdverSeqNo(Integer proAdverSeqNo) {
		this.proAdverSeqNo = proAdverSeqNo;
	}
	public String getProVolume() {
		return proVolume;
	}
	public void setProVolume(String proVolume) {
		this.proVolume = proVolume;
	}
	public Double getProWeight() {
		return proWeight;
	}
	public void setProWeight(Double proWeight) {
		this.proWeight = proWeight;
	}
	
	public java.util.Date getProDate() {
		return proDate;
	}
	public void setProDate(java.util.Date proDate) {
		this.proDate = proDate;
	}
	
	public ProductSaleBean() {
		super();
	}
	public String getProBrand() {
		return proBrand;
	}
	public void setProBrand(String proBrand) {
		this.proBrand = proBrand;
	}


	@Override
	public String toString() {
		return "ProductSaleBean [productSeqNo=" + productSeqNo + ", proName=" + proName + ", proCategorySeqNo="
				+ proCategorySeqNo + ", proBrand=" + proBrand + ", proPrice=" + proPrice + ", proStatus=" + proStatus
				+ ", proPayTypeSeqNo=" + proPayTypeSeqNo + ", proPcs=" + proPcs + ", proDescription=" + proDescription
				+ ", proTransSeqNo=" + proTransSeqNo + ", proAdverSeqNo=" + proAdverSeqNo + ", proVolume=" + proVolume
				+ ", proWeight=" + proWeight + ", proDate=" + proDate + ", account=" + account + "]";
	}



	
	
	
}
