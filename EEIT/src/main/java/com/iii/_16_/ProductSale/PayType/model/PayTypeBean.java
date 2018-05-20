package com.iii._16_.ProductSale.PayType.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ProPayType")
public class PayTypeBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer proPayTypeSeqNo;
	private String payType;
	private Integer payTypeStatus;
	public Integer getProPayTypeSeqNo() {
		return proPayTypeSeqNo;
	}
	public void setProPayTypeSeqNo(Integer proPayTypeSeqNo) {
		this.proPayTypeSeqNo = proPayTypeSeqNo;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public Integer getPayTypeStatus() {
		return payTypeStatus;
	}
	public void setPayTypeStatus(Integer payTypeStatus) {
		this.payTypeStatus = payTypeStatus;
	}
	
}