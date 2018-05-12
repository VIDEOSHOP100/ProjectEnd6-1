	package com.iii._09_.otherbean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

//商品分類
@Entity
@Table(name = "dbo.ProductClass")
public class ProductClassBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer ProductClassSeqNo; //商品分類流水號 主鍵
	private String ClassName; //商品分類
	private String ClassChildName; //商品子類別
	
	
	
	public ProductClassBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductClassBean(Integer productClassSeqNo, String className, String classChildName) {
		super();
		ProductClassSeqNo = productClassSeqNo;
		ClassName = className;
		ClassChildName = classChildName;
	}

	public Integer getProductClassSeqNo() {
		return ProductClassSeqNo;
	}
	
	public void setProductClassSeqNo(Integer productClassSeqNo) {
		ProductClassSeqNo = productClassSeqNo;
	}
	public String getClassName() {
		return ClassName;
	}
	public void setClassName(String className) {
		ClassName = className;
	}
	public String getClassChildName() {
		return ClassChildName;
	}
	public void setClassChildName(String classChildName) {
		ClassChildName = classChildName;
	}
	
	@Override
	public String toString() {
		return "productClassBean [ProductClassSeqNo=" + ProductClassSeqNo + ", ClassName=" + ClassName
				+ ", ClassChildName=" + ClassChildName + "]";
	}
	
	
	
}
