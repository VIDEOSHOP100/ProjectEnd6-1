package com.iii._16_.OrderSystem.OrderProduct.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;



import com.iii._16_.ProductSale.Product.model.ProductSaleBean;

@Entity
public class OrderHotBean {
	@Id
	private Integer productSeqNo;
	private Integer saleTotal;
	@Transient
	private ProductSaleBean productBean;
	
	public Integer getSaleTotal() {
		return saleTotal;
	}
	public void setSaleTotal(Integer saleTotal) {
		this.saleTotal = saleTotal;
	}
	public Integer getProductSeqNo() {
		return productSeqNo;
	}
	public void setProductSeqNo(Integer productSeqNo) {
		this.productSeqNo = productSeqNo;
	}
	
	
	public ProductSaleBean getProductBean() {
		return productBean;
	}
	public void setProductBean(ProductSaleBean productBean) {
		this.productBean = productBean;
	}
	
}
