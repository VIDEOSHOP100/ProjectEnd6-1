package com.iii._03_;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "ExpressShipping")
public class ExpressShipping implements Serializable {

	@Id
	private String shippingorder;
	private String surcharges;
	private String checkvolumetricweight;
	private String packagingadvice;
	private Integer trackingnumber;
	private Integer orderseqno;

	public String getShippingorder() {
		return shippingorder;
	}

	public void setShippingorder(String shippingorder) {
		this.shippingorder = shippingorder;
	}

	public String getSurcharges() {
		return surcharges;
	}

	public void setSurcharges(String surcharges) {
		this.surcharges = surcharges;
	}

	public String getCheckvolumetricweight() {
		return checkvolumetricweight;
	}

	public void setCheckvolumetricweight(String checkvolumetricweight) {
		this.checkvolumetricweight = checkvolumetricweight;
	}

	public String getPackagingadvice() {
		return packagingadvice;
	}

	public void setPackagingadvice(String packagingadvice) {
		this.packagingadvice = packagingadvice;
	}

	public Integer getTrackingnumber() {
		return trackingnumber;
	}

	public void setTrackingnumber(Integer trackingnumber) {
		this.trackingnumber = trackingnumber;
	}

	public Integer getOrderseqno() {
		return orderseqno;
	}

	public void setOrderseqno(Integer orderseqno) {
		this.orderseqno = orderseqno;
	}

	
	@Override
	public String toString() {
		return "ExpressShipping [shippingorder=" + shippingorder + ", surcharges=" + surcharges
				+ ", checkvolumetricweight=" + checkvolumetricweight + ", packagingadvice=" + packagingadvice
				+ ", trackingnumber=" + trackingnumber + ", orderseqno=" + orderseqno + "]";
	}

	
	public ExpressShipping(String shippingorder, String surcharges, String checkvolumetricweight,
			String packagingadvice, Integer trackingnumber, Integer orderseqno) {
		super();
		this.shippingorder = shippingorder;
		this.surcharges = surcharges;
		this.checkvolumetricweight = checkvolumetricweight;
		this.packagingadvice = packagingadvice;
		this.trackingnumber = trackingnumber;
		this.orderseqno = orderseqno;
	}

	
	public ExpressShipping() {
		super();
		// TODO Auto-generated constructor stub
	}

	// @Transient

}