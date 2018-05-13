package com.iii._16_.OrderSystem.Order.model;

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
	private Integer proCartListSeqNo;
	private String recipientName;
	private Integer recipientTel;
	private Integer recipientTel2;
	private Integer recipientAddr;
	private Integer recipientNum;
	private Integer proPayTypeSeqNo;
	public Integer getOrderSeqNo() {
		return orderSeqNo;
	}
	public void setOrderSeqNo(Integer orderSeqNo) {
		this.orderSeqNo = orderSeqNo;
	}
	public Integer getProCartListSeqNo() {
		return proCartListSeqNo;
	}
	public void setProCartListSeqNo(Integer proCartListSeqNo) {
		this.proCartListSeqNo = proCartListSeqNo;
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
	public Integer getRecipientTel2() {
		return recipientTel2;
	}
	public void setRecipientTel2(Integer recipientTel2) {
		this.recipientTel2 = recipientTel2;
	}
	public Integer getRecipientAddr() {
		return recipientAddr;
	}
	public void setRecipientAddr(Integer recipientAddr) {
		this.recipientAddr = recipientAddr;
	}
	public Integer getRecipientNum() {
		return recipientNum;
	}
	public void setRecipientNum(Integer recipientNum) {
		this.recipientNum = recipientNum;
	}
	public Integer getProPayTypeSeqNo() {
		return proPayTypeSeqNo;
	}
	public void setProPayTypeSeqNo(Integer proPayTypeSeqNo) {
		this.proPayTypeSeqNo = proPayTypeSeqNo;
	}
	public OrderBean(Integer orderSeqNo, Integer proCartListSeqNo, String recipientName, Integer recipientTel,
			Integer recipientTel2, Integer recipientAddr, Integer recipientNum, Integer proPayTypeSeqNo) {
		super();
		this.orderSeqNo = orderSeqNo;
		this.proCartListSeqNo = proCartListSeqNo;
		this.recipientName = recipientName;
		this.recipientTel = recipientTel;
		this.recipientTel2 = recipientTel2;
		this.recipientAddr = recipientAddr;
		this.recipientNum = recipientNum;
		this.proPayTypeSeqNo = proPayTypeSeqNo;
	}
	public OrderBean() {
		super();
	}
	@Override
	public String toString() {
		return "OrderBean [orderSeqNo=" + orderSeqNo + ", proCartListSeqNo=" + proCartListSeqNo + ", recipientName="
				+ recipientName + ", recipientTel=" + recipientTel + ", recipientTel2=" + recipientTel2
				+ ", recipientAddr=" + recipientAddr + ", recipientNum=" + recipientNum + ", proPayTypeSeqNo="
				+ proPayTypeSeqNo + "]";
	}
	
}
