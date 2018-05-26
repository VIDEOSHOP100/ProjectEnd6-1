package com.iii._16_.ProductHot.model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="ProductHot")
public class ProductHotBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productHotSeqNo;
	private String productHotFileName;
	private String productHotFilePath;
	private String productName;
	private Integer productStatus;
	@Transient
	private MultipartFile hotFile;
	
	public Integer getProductStatus() {
		return productStatus;
	}
	public void setProductStatus(Integer productStatus) {
		this.productStatus = productStatus;
	}
	public Integer getProductHotSeqNo() {
		return productHotSeqNo;
	}
	public void setProductHotSeqNo(Integer productHotSeqNo) {
		this.productHotSeqNo = productHotSeqNo;
	}
	public String getProductHotFileName() {
		return productHotFileName;
	}
	public void setProductHotFileName(String productHotFileName) {
		this.productHotFileName = productHotFileName;
	}
	public String getProductHotFilePath() {
		return productHotFilePath;
	}
	public void setProductHotFilePath(String productHotFilePath) {
		this.productHotFilePath = productHotFilePath;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public MultipartFile getHotFile() {
		return hotFile;
	}
	public void setHotFile(MultipartFile hotFile) {
		this.hotFile = hotFile;
	}
	@Override
	public String toString() {
		return "ProductHotBean [productHotSeqNo=" + productHotSeqNo + ", productHotFileName=" + productHotFileName
				+ ", productHotFilePath=" + productHotFilePath + ", productName=" + productName + ", hotFile=" + hotFile
				+ "]";
	}
	public ProductHotBean() {
		super();
	}
	public ProductHotBean(Integer productHotSeqNo, String productHotFileName, String productHotFilePath,
			String productName) {
		super();
		this.productHotSeqNo = productHotSeqNo;
		this.productHotFileName = productHotFileName;
		this.productHotFilePath = productHotFilePath;
		this.productName = productName;
	}
	
	
}
