package com.iii._19_.messageSystem.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "message")
public class MessageBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer messageSeqNo;
	private String messageArticle;
	private String account;
	private String receiverAccount;
	private Timestamp messageDate;
	private String messageStatus;
	private String messageType;

	public MessageBean(Integer messageSeqNo, String messageArticle, String account, String receiverAccount,
			Timestamp messageDate, String messageStatus, String messageType) {
		super();
		this.messageSeqNo = messageSeqNo;
		this.messageArticle = messageArticle;
		this.account = account;
		this.receiverAccount = receiverAccount;
		this.messageDate = messageDate;
		this.messageStatus = messageStatus;
		this.messageType = messageType;
	}

	public MessageBean() {
		super();
	}

	@Override
	public String toString() {
		return "MessageBean [messageSeqNo=" + messageSeqNo + ", messageArticle=" + messageArticle + ", account="
				+ account + ", receiverAccount=" + receiverAccount + ", messageDate=" + messageDate + ", messageStatus="
				+ messageStatus + ", messageType=" + messageType + "]";
	}

	public Integer getMessageSeqNo() {
		return messageSeqNo;
	}

	public void setMessageSeqNo(Integer messageSeqNo) {
		this.messageSeqNo = messageSeqNo;
	}

	public String getMessageArticle() {
		return messageArticle;
	}

	public void setMessageArticle(String messageArticle) {
		this.messageArticle = messageArticle;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getReceiverAccount() {
		return receiverAccount;
	}

	public void setReceiverAccount(String receiverAccount) {
		this.receiverAccount = receiverAccount;
	}

	public Timestamp getMessageDate() {
		return messageDate;
	}

	public void setMessageDate(Timestamp messageDate) {
		this.messageDate = messageDate;
	}

	public String getMessageStatus() {
		return messageStatus;
	}

	public void setMessageStatus(String messageStatus) {
		this.messageStatus = messageStatus;
	}

	public String getMessageType() {
		return messageType;
	}

	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}

}
