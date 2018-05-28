package com.iii._05_.Bid.model;




import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class AllBidBean {

	@Id
	private Integer day;
	private Integer maxPrice;


	public Integer getDay() {
		return day;
	}
	public void setDay(Integer day) {
		this.day = day;
	}
	public Integer getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(Integer maxPrice) {
		this.maxPrice = maxPrice;
	}
	@Override
	public String toString() {
		return "AllBidBean [day=" + day + ", maxPrice=" + maxPrice + "]";
	}
	
	
	
	
}
