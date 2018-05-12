package com.iii._16_.BuyCart.ProCartList.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
import com.iii._16_.ProductSale.ProductPicture.model.ProPicBean;

@Entity
@Table(name = "ProCartList")
public class ProCartListBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer proCartListSeqNo;
	private Integer productSeqNo;
	private Integer productCount;
	private Integer productStatus;
	private String account;

	@Transient
	private ProductSaleBean productbean;

	
	

	@Override
	public String toString() {
		return "ProCartListBean [proCartListSeqNo=" + proCartListSeqNo + ", productSeqNo=" + productSeqNo
				+ ", productCount=" + productCount + ", productStatus=" + productStatus + ", account=" + account + "]";
	}

	public Integer getProCartListSeqNo() {
		return proCartListSeqNo;
	}

	public void setProCartListSeqNo(Integer proCartListSeqNo) {
		this.proCartListSeqNo = proCartListSeqNo;
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

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public ProductSaleBean getProductbean() {
		return productbean;
	}

	public void setProductbean(ProductSaleBean productbean) {
		this.productbean = productbean;
	}

	public ProCartListBean() {
		super();
	}

	
	public Integer getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(Integer productStatus) {
		this.productStatus = productStatus;
	}

	public ProCartListBean(Integer proCartListSeqNo, Integer productSeqNo, Integer productCount, Integer productStatus,
			String account) {
		super();
		this.proCartListSeqNo = proCartListSeqNo;
		this.productSeqNo = productSeqNo;
		this.productCount = productCount;
		this.productStatus = productStatus;
		this.account = account;
	}

	
}
