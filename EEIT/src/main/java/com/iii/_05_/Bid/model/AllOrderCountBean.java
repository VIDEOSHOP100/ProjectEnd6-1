package com.iii._05_.Bid.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class AllOrderCountBean {
@Id
private Integer orderQuantity;
private Integer day;
public Integer getOrderQuantity() {
	return orderQuantity;
}
public void setOrderQuantity(Integer orderQuantity) {
	this.orderQuantity = orderQuantity;
}
public Integer getDay() {
	return day;
}
public void setDay(Integer day) {
	this.day = day;
}
@Override
public String toString() {
	return "AllOrderCountBean [orderQuantity=" + orderQuantity + ", day=" + day + "]";
}


}
