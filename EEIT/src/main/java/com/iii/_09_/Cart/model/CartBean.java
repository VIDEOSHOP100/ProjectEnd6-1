package com.iii._09_.Cart.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.iii._16_.ProductSale.Product.model.ProductSaleBean;

@Entity
@Table(name = "dbo.Cart")
public class CartBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cartSeqNo;//購物車編號，流水號
	private Integer orderNo; //訂單編號
	private Integer productSeqNo; //商品流水號
	private java.util.Date orderDate; //決定購買日期
	private java.util.Date shoppingDate;//進入購物車時間
	private Integer cartStatus;//購物車狀態

	public CartBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public CartBean(Integer cartSeqNo, Integer orderNo, Integer productSeqNo, Date orderDate, Date shoppingDate,
			Integer cartStatus) {
		super();
		this.cartSeqNo = cartSeqNo;
		this.orderNo = orderNo;
		this.productSeqNo = productSeqNo;
		this.orderDate = orderDate;
		this.shoppingDate = shoppingDate;
		this.cartStatus = cartStatus;
	}



	public Integer getCartSeqNo() {
		return cartSeqNo;
	}
	public void setCartSeqNo(Integer cartSeqNo) {
		this.cartSeqNo = cartSeqNo;
	}
	public Integer getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}
	public Integer getProductSeqNo() {
		return productSeqNo;
	}
	public void setProductSeqNo(Integer productSeqNo) {
		this.productSeqNo = productSeqNo;
	}
	public java.util.Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(java.util.Date orderDate) {
		this.orderDate = orderDate;
	}
	public java.util.Date getShoppingDate() {
		return shoppingDate;
	}
	public void setShoppingDate(java.util.Date shoppingDate) {
		this.shoppingDate = shoppingDate;
	}
	public Integer getCartStatus() {
		return cartStatus;
	}
	public void setCartStatus(Integer cartStatus) {
		this.cartStatus = cartStatus;
	}
	
	@Override
	public String toString() {
		return "cartBean [cartSeqNo=" + cartSeqNo + ", orderNo=" + orderNo + ", productSeqNo=" + productSeqNo
				+ ", orderDate=" + orderDate + ", shoppingDate=" + shoppingDate + ", cartStatus=" + cartStatus + "]";
	}
	
	
	
	
}
