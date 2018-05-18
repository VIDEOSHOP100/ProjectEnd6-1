package com.iii._16_.OrderSystem.OrderProduct.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.iii._16_.ProductSale.Product.model.ProductSaleBean;

@Entity
@Table(name="OrderProduct")
public class OrderProductBean {
	private Integer productSeqNo;
	private Integer productCount;
	private Long productPrice;
	private String account;
	private Integer orderSeqNo;

	private Long productTotal;
	@Transient
	private ProductSaleBean productBean ;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderproductNum;
	
	
	
	

	public Long getProductTotal() {
		return productTotal;
	}
	public void setProductTotal(Long productTotal) {
		this.productTotal = productTotal;
	}
	public ProductSaleBean getProductBean() {
		return productBean;
	}
	public void setProductBean(ProductSaleBean productBean) {
		this.productBean = productBean;
	}
	
	public Integer getProductSeqNo() {
		return productSeqNo;
	}
	public void setProductSeqNo(Integer productSeqNo) {
		this.productSeqNo = productSeqNo;
	}
	public Integer getProductCount() {
		return productCount;
	}
	public void setProductCount(Integer productCount) {
		this.productCount = productCount;
	}
	public Long getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Long productPrice) {
		this.productPrice = productPrice;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public Integer getOrderSeqNo() {
		return orderSeqNo;
	}
	public void setOrderSeqNo(Integer orderSeqNo) {
		this.orderSeqNo = orderSeqNo;
	}
	public Integer getOrderproductNum() {
		return orderproductNum;
	}
	public void setOrderproductNum(Integer orderproductNum) {
		this.orderproductNum = orderproductNum;
	}
	public OrderProductBean(Integer productSeqNo, Integer productCount, Long productPrice, String account,
			Integer orderSeqNo, Integer orderproductNum) {
		super();
		this.productSeqNo = productSeqNo;
		this.productCount = productCount;
		this.productPrice = productPrice;
		this.account = account;
		this.orderSeqNo = orderSeqNo;
		this.orderproductNum = orderproductNum;
	}
	public OrderProductBean() {
		super();
	}
	@Override
	public String toString() {
		return "OrderProductBean [productSeqNo=" + productSeqNo + ", productCount=" + productCount + ", productPrice="
				+ productPrice + ", account=" + account + ", orderSeqNo=" + orderSeqNo + ", orderproductNum="
				+ orderproductNum + "]";
	}

	
}
