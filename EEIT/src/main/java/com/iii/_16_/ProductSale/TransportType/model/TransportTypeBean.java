package com.iii._16_.ProductSale.TransportType.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ProTransport")
public class TransportTypeBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer proTransSeqNo;
	private String proTransType;
	private Integer proTransStatus;
	public Integer getProTransSeqNo() {
		return proTransSeqNo;
	}
	public void setProTransSeqNo(Integer proTransSeqNo) {
		this.proTransSeqNo = proTransSeqNo;
	}
	public String getProTransType() {
		return proTransType;
	}
	public void setProTransType(String proTransType) {
		this.proTransType = proTransType;
	}
	public Integer getProTransStatus() {
		return proTransStatus;
	}
	public void setProTransStatus(Integer proTransStatus) {
		this.proTransStatus = proTransStatus;
	}
	
}
