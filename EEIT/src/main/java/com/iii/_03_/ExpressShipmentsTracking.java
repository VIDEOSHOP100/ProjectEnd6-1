package com.iii._03_;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "ExpressShipmentsTracking")
public class ExpressShipmentsTracking implements Serializable {
  
	@Id
	private String shipmenttype;
	private String trackingnumber;
	private Integer orderseqno;
	private String sendstatus;
	private String trackingfaqs;

	
	public String getShipmenttype() {
		return shipmenttype;
	}

	public void setShipmenttype(String shipmenttype) {
		this.shipmenttype = shipmenttype;
	}

	public String getTrackingnumber() {
		return trackingnumber;
	}

	public void setTrackingnumber(String trackingnumber) {
		this.trackingnumber = trackingnumber;
	}

	public Integer getOrderseqno() {
		return orderseqno;
	}

	public void setOrderseqno(Integer orderseqno) {
		this.orderseqno = orderseqno;
	}

	public String getSendstatus() {
		return sendstatus;
	}

	public void setSendstatus(String sendstatus) {
		this.sendstatus = sendstatus;
	}

	public String getTrackingfaqs() {
		return trackingfaqs;
	}

	public void setTrackingfaqs(String trackingfaqs) {
		this.trackingfaqs = trackingfaqs;
	}

	
	@Override
	public String toString() {
		return "ExpressShipmentsTracking [shipmenttype=" + shipmenttype + ", trackingnumber=" + trackingnumber
				+ ", orderseqno=" + orderseqno + ", sendstatus=" + sendstatus + ", trackingfaqs=" + trackingfaqs + "]";
	}

	
	public ExpressShipmentsTracking(String shipmenttype, String trackingnumber, Integer orderseqno, String sendstatus,
			String trackingfaqs) {
		super();
		this.shipmenttype = shipmenttype;
		this.trackingnumber = trackingnumber;
		this.orderseqno = orderseqno;
		this.sendstatus = sendstatus;
		this.trackingfaqs = trackingfaqs;
	}

	
	public ExpressShipmentsTracking() {
		super();
		// TODO Auto-generated constructor stub
	}

	// @Transient

}
