package com.iii._05_.Bid.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "Bid")
public class BidBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer bidSeqNo;
	private Integer auctionSeqNo;
	private Timestamp bidTime;
	private Integer bidPrice;
	private String account;
	private Integer productSeqNo;
	

	
	
	public BidBean() {
		super();

	}




	public Integer getBidSeqNo() {
		return bidSeqNo;
	}




	public void setBidSeqNo(Integer bidSeqNo) {
		this.bidSeqNo = bidSeqNo;
	}




	public Integer getAuctionSeqNo() {
		return auctionSeqNo;
	}




	public void setAuctionSeqNo(Integer auctionSeqNo) {
		this.auctionSeqNo = auctionSeqNo;
	}




	public Timestamp getBidTime() {
		return bidTime;
	}




	public void setBidTime(Timestamp bidTime) {
		this.bidTime = bidTime;
	}




	public Integer getBidPrice() {
		return bidPrice;
	}




	public void setBidPrice(Integer bidPrice) {
		this.bidPrice = bidPrice;
	}




	public String getAccount() {
		return account;
	}




	public void setAccount(String account) {
		this.account = account;
	}




	public Integer getProductSeqNo() {
		return productSeqNo;
	}




	public void setProductSeqNo(Integer productSeqNo) {
		this.productSeqNo = productSeqNo;
	}




	public BidBean(Integer bidSeqNo, Integer auctionSeqNo, Timestamp bidTime, Integer bidPrice, String account,
			Integer productSeqNo) {
		super();
		this.bidSeqNo = bidSeqNo;
		this.auctionSeqNo = auctionSeqNo;
		this.bidTime = bidTime;
		this.bidPrice = bidPrice;
		this.account = account;
		this.productSeqNo = productSeqNo;
	}




	@Override
	public String toString() {
		return "BidBean [bidSeqNo=" + bidSeqNo + ", auctionSeqNo=" + auctionSeqNo + ", bidTime=" + bidTime
				+ ", bidPrice=" + bidPrice + ", account=" + account + ", productSeqNo=" + productSeqNo + "]";
	}
	
	
	
	
	
	
	
	
}
