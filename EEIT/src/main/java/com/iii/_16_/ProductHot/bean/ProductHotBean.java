package com.iii._16_.ProductHot.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ProductHotTest")
public class ProductHotBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productHotSeqNo;
	private String productHotFileName;
	private String productHotFilePath;
	private String productName;
	private String ProductCategory;
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
	public String getProductCategory() {
		return ProductCategory;
	}
	public void setProductCategory(String productCategory) {
		ProductCategory = productCategory;
	}
	public ProductHotBean(Integer productHotSeqNo, String productHotFileName, String productHotFilePath,
			String productName, String productCategory) {
		super();
		this.productHotSeqNo = productHotSeqNo;
		this.productHotFileName = productHotFileName;
		this.productHotFilePath = productHotFilePath;
		this.productName = productName;
		ProductCategory = productCategory;
	}
	public ProductHotBean() {
		super();
	}
	@Override
	public String toString() {
		return "ProductHotBean [productHotSeqNo=" + productHotSeqNo + ", productHotFileName=" + productHotFileName
				+ ", productHotFilePath=" + productHotFilePath + ", productName=" + productName + ", ProductCategory="
				+ ProductCategory + "]";
	}
	
}
