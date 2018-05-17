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
	
	private Integer auctionStatus;
	private String auctionPic;
	private Integer auctionSeqNo;
	@Transient
	private MultipartFile picFile;//v
	
	public MultipartFile getPicFile() {
		return picFile;
	}
	
	
	
	
	public String getAuctionPic() {
		return auctionPic;
	}




	public void setAuctionPic(String auctionPic) {
		this.auctionPic = auctionPic;
	}








	public Integer getAuctionStatus() {
		return auctionStatus;
	}




	public void setAuctionStatus(Integer auctionStatus) {
		this.auctionStatus = auctionStatus;
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

	public Integer getAuctionSeqNo() {
		return auctionSeqNo;
	}

	public void setAuctionSeqNo(Integer auctionSeqNo) {
		this.auctionSeqNo = auctionSeqNo;
	}




	@Override
	public String toString() {
		return "ProductSaleBean [productSeqNo=" + productSeqNo + ", proName=" + proName + ", proCategorySeqNo="
				+ proCategorySeqNo + ", proBrand=" + proBrand + ", proPrice=" + proPrice + ", proStatus=" + proStatus
				+ ", proPayTypeSeqNo=" + proPayTypeSeqNo + ", proPcs=" + proPcs + ", proDescription=" + proDescription
				+ ", proTransSeqNo=" + proTransSeqNo + ", proAdverSeqNo=" + proAdverSeqNo + ", proVolume=" + proVolume
				+ ", proWeight=" + proWeight + ", proDate=" + proDate + ", picSeqNo=" + picSeqNo + ", account="
				+ account + ", auctionStatus=" + auctionStatus + ", auctionPic=" + auctionPic + ", auctionSeqNo="
				+ auctionSeqNo + ", picFile=" + picFile + "]";
	}




	public ProductSaleBean(Integer productSeqNo, String proName, Integer proCategorySeqNo, String proBrand,
			long proPrice, Integer proStatus, Integer proPayTypeSeqNo, Integer proPcs, String proDescription,
			Integer proTransSeqNo, Integer proAdverSeqNo, String proVolume, Double proWeight, java.util.Date proDate,
			Integer picSeqNo, String account, Integer auctionStatus, String auctionPic, Integer auctionSeqNo,
			MultipartFile picFile) {
		super();
		this.productSeqNo = productSeqNo;
		this.proName = proName;
		this.proCategorySeqNo = proCategorySeqNo;
		this.proBrand = proBrand;
		this.proPrice = proPrice;
		this.proStatus = proStatus;
		this.proPayTypeSeqNo = proPayTypeSeqNo;
		this.proPcs = proPcs;
		this.proDescription = proDescription;
		this.proTransSeqNo = proTransSeqNo;
		this.proAdverSeqNo = proAdverSeqNo;
		this.proVolume = proVolume;
		this.proWeight = proWeight;
		this.proDate = proDate;
		this.picSeqNo = picSeqNo;
		this.account = account;
		this.auctionStatus = auctionStatus;
		this.auctionPic = auctionPic;
		this.auctionSeqNo = auctionSeqNo;
		this.picFile = picFile;
	}




	


	
	
	
}
