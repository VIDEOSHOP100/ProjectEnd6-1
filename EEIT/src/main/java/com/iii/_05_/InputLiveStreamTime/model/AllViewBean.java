package com.iii._05_.InputLiveStreamTime.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class AllViewBean {
	@Id
	private String account;
	private Integer views;
	
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public Integer getViews() {
		return views;
	}
	public void setViews(Integer views) {
		this.views = views;
	}
	@Override
	public String toString() {
		return "AllViewBean [account=" + account + ", views=" + views + "]";
	}
	
	
	
}
