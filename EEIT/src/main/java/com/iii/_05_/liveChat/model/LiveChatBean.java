package com.iii._05_.liveChat.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "LiveChat")
public class LiveChatBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer liveChatSesNo;
	private String liveChatArticle;
	private String account;
	private Timestamp liveChatDate;
	private String liveChatStatus;
	private String liveChatType;
	private Integer liveStreamSeqNo;
	public LiveChatBean() {
		super();	
	}
	public LiveChatBean(Integer liveChatSesNo, String liveChatArticle, String account, Timestamp liveChatDate,
			String liveChatStatus, String liveChatType, Integer liveStreamSeqNo) {
		super();
		this.liveChatSesNo = liveChatSesNo;
		this.liveChatArticle = liveChatArticle;
		this.account = account;
		this.liveChatDate = liveChatDate;
		this.liveChatStatus = liveChatStatus;
		this.liveChatType = liveChatType;
		this.liveStreamSeqNo = liveStreamSeqNo;
	}
	@Override
	public String toString() {
		return "LiveChatBean [liveChatSesNo=" + liveChatSesNo + ", liveChatArticle=" + liveChatArticle + ", account="
				+ account + ", liveChatDate=" + liveChatDate + ", liveChatStatus=" + liveChatStatus + ", liveChatType="
				+ liveChatType + ", liveStreamSeqNo=" + liveStreamSeqNo + "]";
	}
	public Integer getLiveChatSesNo() {
		return liveChatSesNo;
	}
	public void setLiveChatSesNo(Integer liveChatSesNo) {
		this.liveChatSesNo = liveChatSesNo;
	}
	public String getLiveChatArticle() {
		return liveChatArticle;
	}
	public void setLiveChatArticle(String liveChatArticle) {
		this.liveChatArticle = liveChatArticle;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public Timestamp getLiveChatDate() {
		return liveChatDate;
	}
	public void setLiveChatDate(Timestamp liveChatDate) {
		this.liveChatDate = liveChatDate;
	}
	public String getLiveChatStatus() {
		return liveChatStatus;
	}
	public void setLiveChatStatus(String liveChatStatus) {
		this.liveChatStatus = liveChatStatus;
	}
	public String getLiveChatType() {
		return liveChatType;
	}
	public void setLiveChatType(String liveChatType) {
		this.liveChatType = liveChatType;
	}
	public Integer getLiveStreamSeqNo() {
		return liveStreamSeqNo;
	}
	public void setLiveStreamSeqNo(Integer liveStreamSeqNo) {
		this.liveStreamSeqNo = liveStreamSeqNo;
	}
	
	
	
	
}
