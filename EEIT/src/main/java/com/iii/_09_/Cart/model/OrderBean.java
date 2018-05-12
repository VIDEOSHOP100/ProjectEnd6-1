package com.iii._09_.Cart.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

//確認訂單
@Entity
@Table(name="dbo.Order")
public class OrderBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderSeqNo;//訂單編號
	private Integer productSeqNo;//產品編號
	private String raccount;//帳號 外部鍵
	private java.util.Date orderDate;//訂單日期
	private double totalPrice;//總額
	private String payStatus;//付款狀態
	private String logisticStatus;//配送狀態  
	
	
	public OrderBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public OrderBean(Integer orderSeqNo, Integer productSeqNo, String raccount, Date orderDate, double totalPrice,
			String payStatus, String logisticStatus) {
		super();
		this.orderSeqNo = orderSeqNo;
		this.productSeqNo = productSeqNo;
		this.raccount = raccount;
		this.orderDate = orderDate;
		this.totalPrice = totalPrice;
		this.payStatus = payStatus;
		this.logisticStatus = logisticStatus;
	}



	public Integer getOrderSeqNo() {
		return orderSeqNo;
	}
	public void setOrderSeqNo(Integer orderSeqNo) {
		this.orderSeqNo = orderSeqNo;
	}
	public Integer getProductSeqNo() {
		return productSeqNo;
	}
	public void setProductSeqNo(Integer productSeqNo) {
		this.productSeqNo = productSeqNo;
	}
	public String getRaccount() {
		return raccount;
	}
	public void setRaccount(String raccount) {
		this.raccount = raccount;
	}
	public java.util.Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(java.util.Date orderDate) {
		this.orderDate = orderDate;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getPayStatus() {
		return payStatus;
	}
	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}
	public String getLogisticStatus() {
		return logisticStatus;
	}
	public void setLogisticStatus(String logisticStatus) {
		this.logisticStatus = logisticStatus;
	}
	@Override
	public String toString() {
		return "orderBean [orderSeqNo=" + orderSeqNo + ", productSeqNo=" + productSeqNo + ", raccount=" + raccount
				+ ", orderDate=" + orderDate + ", totalPrice=" + totalPrice + ", payStatus=" + payStatus
				+ ", logisticStatus=" + logisticStatus + "]";
	}
	
	
	

}