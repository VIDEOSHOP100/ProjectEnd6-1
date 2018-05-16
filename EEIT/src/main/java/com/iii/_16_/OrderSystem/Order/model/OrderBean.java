package com.iii._16_.OrderSystem.Order.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="OrderList")
public class OrderBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderSeqNo;
	private Integer orderproductNum;
	private String ordererName;
	private Integer ordererTel;
	private Integer ordererHomeTel;
	private String ordererEmail;
	private String ordererAddr;
	private String recipientName;
	private Integer recipientTel;
	private Integer recipientHomeTel;
	private String recipientEmail;
	private String recipientAddr;
	private Integer proPayTypeSeqNo;
	private Integer proTransportSeqNo;
	private java.util.Date orderTime;
	private Integer orderStatus;
	
	
	public Integer getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}
	public Integer getOrdererHomeTel() {
		return ordererHomeTel;
	}
	public void setOrdererHomeTel(Integer ordererHomeTel) {
		this.ordererHomeTel = ordererHomeTel;
	}
	public Integer getRecipientHomeTel() {
		return recipientHomeTel;
	}
	public void setRecipientHomeTel(Integer recipientHomeTel) {
		this.recipientHomeTel = recipientHomeTel;
	}
	public java.util.Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(java.util.Date orderTime) {
		this.orderTime = orderTime;
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
	public String getOrdererName() {
		return ordererName;
	}
	public void setOrdererName(String ordererName) {
		this.ordererName = ordererName;
	}
	public Integer getOrdererTel() {
		return ordererTel;
	}
	public void setOrdererTel(Integer ordererTel) {
		this.ordererTel = ordererTel;
	}
	public String getOrdererEmail() {
		return ordererEmail;
	}
	public void setOrdererEmail(String ordererEmail) {
		this.ordererEmail = ordererEmail;
	}
	public String getOrdererAddr() {
		return ordererAddr;
	}
	public void setOrdererAddr(String ordererAddr) {
		this.ordererAddr = ordererAddr;
	}
	public String getRecipientName() {
		return recipientName;
	}
	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}
	public Integer getRecipientTel() {
		return recipientTel;
	}
	public void setRecipientTel(Integer recipientTel) {
		this.recipientTel = recipientTel;
	}
	public String getRecipientEmail() {
		return recipientEmail;
	}
	public void setRecipientEmail(String recipientEmail) {
		this.recipientEmail = recipientEmail;
	}
	public String getRecipientAddr() {
		return recipientAddr;
	}
	public void setRecipientAddr(String recipientAddr) {
		this.recipientAddr = recipientAddr;
	}
	public Integer getProPayTypeSeqNo() {
		return proPayTypeSeqNo;
	}
	public void setProPayTypeSeqNo(Integer proPayTypeSeqNo) {
		this.proPayTypeSeqNo = proPayTypeSeqNo;
	}
	public Integer getProTransportSeqNo() {
		return proTransportSeqNo;
	}
	public void setProTransportSeqNo(Integer proTransportSeqNo) {
		this.proTransportSeqNo = proTransportSeqNo;
	}

	
	public OrderBean(Integer orderSeqNo, Integer orderproductNum, String ordererName, Integer ordererTel,
			Integer ordererHomeTel, String ordererEmail, String ordererAddr, String recipientName, Integer recipientTel,
			Integer recipientHomeTel, String recipientEmail, String recipientAddr, Integer proPayTypeSeqNo,
			Integer proTransportSeqNo, Date orderTime, Integer orderStatus) {
		super();
		this.orderSeqNo = orderSeqNo;
		this.orderproductNum = orderproductNum;
		this.ordererName = ordererName;
		this.ordererTel = ordererTel;
		this.ordererHomeTel = ordererHomeTel;
		this.ordererEmail = ordererEmail;
		this.ordererAddr = ordererAddr;
		this.recipientName = recipientName;
		this.recipientTel = recipientTel;
		this.recipientHomeTel = recipientHomeTel;
		this.recipientEmail = recipientEmail;
		this.recipientAddr = recipientAddr;
		this.proPayTypeSeqNo = proPayTypeSeqNo;
		this.proTransportSeqNo = proTransportSeqNo;
		this.orderTime = orderTime;
		this.orderStatus = orderStatus;
	}
	@Override
	public String toString() {
		return "OrderBean [orderSeqNo=" + orderSeqNo + ", orderproductNum=" + orderproductNum + ", ordererName="
				+ ordererName + ", ordererTel=" + ordererTel + ", ordererHomeTel=" + ordererHomeTel + ", ordererEmail="
				+ ordererEmail + ", ordererAddr=" + ordererAddr + ", recipientName=" + recipientName + ", recipientTel="
				+ recipientTel + ", recipientHomeTel=" + recipientHomeTel + ", recipientEmail=" + recipientEmail
				+ ", recipientAddr=" + recipientAddr + ", proPayTypeSeqNo=" + proPayTypeSeqNo + ", proTransportSeqNo="
				+ proTransportSeqNo + ", orderTime=" + orderTime + ", orderStatus=" + orderStatus + "]";
	}
	public OrderBean() {
		super();
	}

}
