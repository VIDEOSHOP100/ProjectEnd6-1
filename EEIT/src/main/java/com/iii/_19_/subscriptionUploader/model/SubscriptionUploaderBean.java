package com.iii._19_.subscriptionUploader.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "subscriptionUploader")
public class SubscriptionUploaderBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer subscriptionUploaderSeqNo;
	private String account;
	private String uploaderAccount;
	private String subscriptionUploaderStatus;
	private Timestamp subscriptionUploaderDate;
	private Integer subscriptionUploaderScore;

	public SubscriptionUploaderBean(Integer subscriptionUploaderSeqNo, String account, String uploaderAccount,
			String subscriptionUploaderStatus, Timestamp subscriptionUploaderDate, Integer subscriptionUploaderScore) {
		super();
		this.subscriptionUploaderSeqNo = subscriptionUploaderSeqNo;
		this.account = account;
		this.uploaderAccount = uploaderAccount;
		this.subscriptionUploaderStatus = subscriptionUploaderStatus;
		this.subscriptionUploaderDate = subscriptionUploaderDate;
		this.subscriptionUploaderScore = subscriptionUploaderScore;
	}

	public SubscriptionUploaderBean() {
		super();
	}

	@Override
	public String toString() {
		return "SubscriptionUploaderBean [subscriptionUploaderSeqNo=" + subscriptionUploaderSeqNo + ", account="
				+ account + ", uploaderAccount=" + uploaderAccount + ", subscriptionUploaderStatus="
				+ subscriptionUploaderStatus + ", subscriptionUploaderDate=" + subscriptionUploaderDate
				+ ", subscriptionUploaderScore=" + subscriptionUploaderScore + "]";
	}

	public Integer getSubscriptionUploaderSeqNo() {
		return subscriptionUploaderSeqNo;
	}

	public void setSubscriptionUploaderSeqNo(Integer subscriptionUploaderSeqNo) {
		this.subscriptionUploaderSeqNo = subscriptionUploaderSeqNo;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getUploaderAccount() {
		return uploaderAccount;
	}

	public void setUploaderAccount(String uploaderAccount) {
		this.uploaderAccount = uploaderAccount;
	}

	public String getSubscriptionUploaderStatus() {
		return subscriptionUploaderStatus;
	}

	public void setSubscriptionUploaderStatus(String subscriptionUploaderStatus) {
		this.subscriptionUploaderStatus = subscriptionUploaderStatus;
	}

	public Timestamp getSubscriptionUploaderDate() {
		return subscriptionUploaderDate;
	}

	public void setSubscriptionUploaderDate(Timestamp subscriptionUploaderDate) {
		this.subscriptionUploaderDate = subscriptionUploaderDate;
	}

	public Integer getSubscriptionUploaderScore() {
		return subscriptionUploaderScore;
	}

	public void setSubscriptionUploaderScore(Integer subscriptionUploaderScore) {
		this.subscriptionUploaderScore = subscriptionUploaderScore;
	}

}
