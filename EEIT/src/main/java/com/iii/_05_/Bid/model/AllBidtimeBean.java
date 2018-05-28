package com.iii._05_.Bid.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;
@Entity
public class AllBidtimeBean {
@Id
	private Timestamp date;
	private Integer maxPrice;
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public Integer getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(Integer maxPrice) {
		this.maxPrice = maxPrice;
	}
	@Override
	public String toString() {
		return "AllBidtimeBean [date=" + date + ", maxPrice=" + maxPrice + "]";
	}
	
	
	
	
}
