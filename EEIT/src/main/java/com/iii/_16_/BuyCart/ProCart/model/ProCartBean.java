package com.iii._16_.BuyCart.ProCart.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.iii._01_.Member.bean.MemberBean;
@Entity
@Table(name="ProCart")
public class ProCartBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer proCartSeqNo;
	private java.util.Date proCreateDay;
	private String account;
	
	@Transient
	private MemberBean bean;
	
	public MemberBean getBean() {
		return bean;
	}
	public void setBean(MemberBean bean) {
		this.bean = bean;
	}
	public Integer getProCartSeqNo() {
		return proCartSeqNo;
	}
	public void setProCartSeqNo(Integer proCartSeqNo) {
		this.proCartSeqNo = proCartSeqNo;
	}
	public java.util.Date getProCreateDay() {
		return proCreateDay;
	}
	public void setProCreateDay(java.util.Date proCreateDay) {
		this.proCreateDay = proCreateDay;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	
	
	
	
}
