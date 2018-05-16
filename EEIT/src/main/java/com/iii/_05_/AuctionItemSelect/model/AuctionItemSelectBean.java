package com.iii._05_.AuctionItemSelect.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Auction")
public class AuctionItemSelectBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer auctionSeqNo;
	private String account;
	private Timestamp aucBegin;
	private Timestamp aucEnd;
	private Integer liveStreamSeqNo;
	private Integer productSeqNo;
	private Integer proPrice;
	private Integer auctionStatus;
	

	
	public AuctionItemSelectBean() {
		super();

	}



	public Integer getAuctionSeqNo() {
		return auctionSeqNo;
	}



	public void setAuctionSeqNo(Integer auctionSeqNo) {
		this.auctionSeqNo = auctionSeqNo;
	}



	public String getAccount() {
		return account;
	}



	public void setAccount(String account) {
		this.account = account;
	}



	public Timestamp getAucBegin() {
		return aucBegin;
	}



	public void setAucBegin(Timestamp aucBegin) {
		this.aucBegin = aucBegin;
	}



	public Timestamp getAucEnd() {
		return aucEnd;
	}



	public void setAucEnd(Timestamp aucEnd) {
		this.aucEnd = aucEnd;
	}



	public Integer getLiveStreamSeqNo() {
		return liveStreamSeqNo;
	}



	public void setLiveStreamSeqNo(Integer liveStreamSeqNo) {
		this.liveStreamSeqNo = liveStreamSeqNo;
	}



	public Integer getProductSeqNo() {
		return productSeqNo;
	}



	public void setProductSeqNo(Integer productSeqNo) {
		this.productSeqNo = productSeqNo;
	}



	public Integer getProPrice() {
		return proPrice;
	}



	public void setProPrice(Integer proPrice) {
		this.proPrice = proPrice;
	}



	public Integer getAuctionStatus() {
		return auctionStatus;
	}



	public void setAuctionStatus(Integer auctionStatus) {
		this.auctionStatus = auctionStatus;
	}



	public AuctionItemSelectBean(Integer auctionSeqNo, String account, Timestamp aucBegin, Timestamp aucEnd,
			Integer liveStreamSeqNo, Integer productSeqNo, Integer proPrice, Integer auctionStatus) {
		super();
		this.auctionSeqNo = auctionSeqNo;
		this.account = account;
		this.aucBegin = aucBegin;
		this.aucEnd = aucEnd;
		this.liveStreamSeqNo = liveStreamSeqNo;
		this.productSeqNo = productSeqNo;
		this.proPrice = proPrice;
		this.auctionStatus = auctionStatus;
	}



	@Override
	public String toString() {
		return "AuctionItemSelectBean [auctionSeqNo=" + auctionSeqNo + ", account=" + account + ", aucBegin=" + aucBegin
				+ ", aucEnd=" + aucEnd + ", liveStreamSeqNo=" + liveStreamSeqNo + ", productSeqNo=" + productSeqNo
				+ ", proPrice=" + proPrice + ", auctionStatus=" + auctionStatus + "]";
	}

	
	
}
