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
	private String proPrice;
	private Integer productSeqNo;
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
	public String getProPrice() {
		return proPrice;
	}
	public void setProPrice(String proPrice) {
		this.proPrice = proPrice;
	}
	public Integer getProductSeqNo() {
		return productSeqNo;
	}
	public void setProductSeqNo(Integer productSeqNo) {
		this.productSeqNo = productSeqNo;
	}
	@Override
	public String toString() {
		return "AuctionEndBean [auctionEndSeqNo=" + auctionEndSeqNo + ", account=" + account + ", proTime=" + proTime
				+ ", proPrice=" + proPrice + ", productSeqNo=" + productSeqNo + "]";
	}
	public AuctionEndBean(Integer auctionEndSeqNo, String account, Timestamp proTime, String proPrice,
			Integer productSeqNo) {
		super();
		this.auctionEndSeqNo = auctionEndSeqNo;
		this.account = account;
		this.proTime = proTime;
		this.proPrice = proPrice;
		this.productSeqNo = productSeqNo;
	}
	public AuctionEndBean() {
		super();
		
	}
	
	
	
	
	
	
	
}
