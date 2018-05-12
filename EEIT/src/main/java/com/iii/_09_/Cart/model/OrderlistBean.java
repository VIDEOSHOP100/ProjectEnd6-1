package com.iii._09_.Cart.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

//商品訂單
@Entity
@Table(name="dbo.OrderList")
public class OrderlistBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer orderSeqNo; //訂單流水號
    private Integer orderlistSeqNo;//總訂單流水號
    private Integer productSeqNo;//商品流水號
    private Integer quantity;//數量
    private double unitPrice;//總價
    private String account;//買家帳號
    
    
    
	public OrderlistBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderlistBean(Integer orderSeqNo, Integer orderlistSeqNo, Integer productSeqNo, Integer quantity,
			double unitPrice, String account) {
		super();
		this.orderSeqNo = orderSeqNo;
		this.orderlistSeqNo = orderlistSeqNo;
		this.productSeqNo = productSeqNo;
		this.quantity = quantity;
		this.unitPrice = unitPrice;
		this.account = account;
	}
	public Integer getOrderSeqNo() {
		return orderSeqNo;
	}
	public void setOrderSeqNo(Integer orderSeqNo) {
		this.orderSeqNo = orderSeqNo;
	}
	public Integer getOrderlistSeqNo() {
		return orderlistSeqNo;
	}
	public void setOrderlistSeqNo(Integer orderlistSeqNo) {
		this.orderlistSeqNo = orderlistSeqNo;
	}
	public Integer getProductSeqNo() {
		return productSeqNo;
	}
	public void setProductSeqNo(Integer productSeqNo) {
		this.productSeqNo = productSeqNo;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	@Override
	public String toString() {
		return "orderlistBean [orderSeqNo=" + orderSeqNo + ", orderlistSeqNo=" + orderlistSeqNo + ", productSeqNo="
				+ productSeqNo + ", quantity=" + quantity + ", unitPrice=" + unitPrice + ", account=" + account + "]";
	}
    
    
}
	