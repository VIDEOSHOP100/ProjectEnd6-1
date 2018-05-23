package com.iii._05_.auctionEnd.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "AuctionEnd")
public class AuctionEndBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer auctionEndSeqNo;
	private String account;
	private Timestamp proTime;
	private Integer proPrice;
	private Integer productSeqNo;
	private Integer picSeqNo;
	private String proName;
	public Integer getAuctionEndSeqNo() {
		return auctionEndSeqNo;
	}
	public void setAuctionEndSeqNo(Integer auctionEndSeqNo) {
		this.auctionEndSeqNo = auctionEndSeqNo;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public Timestamp getProTime() {
		return proTime;
	}
	public void setProTime(Timestamp proTime) {
		this.proTime = proTime;
	}
	public Integer getProPrice() {
		return proPrice;
	}
	public void setProPrice(Integer proPrice) {
		this.proPrice = proPrice;
	}
	public Integer getProductSeqNo() {
		return productSeqNo;
	}
	public void setProductSeqNo(Integer productSeqNo) {
		this.productSeqNo = productSeqNo;
	}
	public Integer getPicSeqNo() {
		return picSeqNo;
	}
	public void setPicSeqNo(Integer picSeqNo) {
		this.picSeqNo = picSeqNo;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	@Override
	public String toString() {
		return "AuctionEndBean [auctionEndSeqNo=" + auctionEndSeqNo + ", account=" + account + ", proTime=" + proTime
				+ ", proPrice=" + proPrice + ", productSeqNo=" + productSeqNo + ", picSeqNo=" + picSeqNo + ", proName="
				+ proName + "]";
	}
	public AuctionEndBean(Integer auctionEndSeqNo, String account, Timestamp proTime, Integer proPrice,
			Integer productSeqNo, Integer picSeqNo, String proName) {
		super();
		this.auctionEndSeqNo = auctionEndSeqNo;
		this.account = account;
		this.proTime = proTime;
		this.proPrice = proPrice;
		this.productSeqNo = productSeqNo;
		this.picSeqNo = picSeqNo;
		this.proName = proName;
	}
	public AuctionEndBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
	
}
