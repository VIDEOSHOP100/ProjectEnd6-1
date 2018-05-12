package com.iii._19_.notificationRecording.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "NotificationRecording")
public class NotificationRecordingBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer notificationRecordingSeqNo;
	private String account;
	private String receiverAccount;
	private Integer notificationSeqNo;
	private String notificationRecordingStatus;
	private Timestamp notificationDate;
	private Timestamp notificationReadDate;
	private String notificationArticle;
	public NotificationRecordingBean(Integer notificationRecordingSeqNo, String account, String receiverAccount,
			Integer notificationSeqNo, String notificationRecordingStatus, Timestamp notificationDate,
			Timestamp notificationReadDate, String notificationArticle) {
		super();
		this.notificationRecordingSeqNo = notificationRecordingSeqNo;
		this.account = account;
		this.receiverAccount = receiverAccount;
		this.notificationSeqNo = notificationSeqNo;
		this.notificationRecordingStatus = notificationRecordingStatus;
		this.notificationDate = notificationDate;
		this.notificationReadDate = notificationReadDate;
		this.notificationArticle = notificationArticle;
	}
	public NotificationRecordingBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getNotificationRecordingSeqNo() {
		return notificationRecordingSeqNo;
	}
	public void setNotificationRecordingSeqNo(Integer notificationRecordingSeqNo) {
		this.notificationRecordingSeqNo = notificationRecordingSeqNo;
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
	public Integer getNotificationSeqNo() {
		return notificationSeqNo;
	}
	public void setNotificationSeqNo(Integer notificationSeqNo) {
		this.notificationSeqNo = notificationSeqNo;
	}
	public String getNotificationRecordingStatus() {
		return notificationRecordingStatus;
	}
	public void setNotificationRecordingStatus(String notificationRecordingStatus) {
		this.notificationRecordingStatus = notificationRecordingStatus;
	}
	public Timestamp getNotificationDate() {
		return notificationDate;
	}
	public void setNotificationDate(Timestamp notificationDate) {
		this.notificationDate = notificationDate;
	}
	public Timestamp getNotificationReadDate() {
		return notificationReadDate;
	}
	public void setNotificationReadDate(Timestamp notificationReadDate) {
		this.notificationReadDate = notificationReadDate;
	}
	public String getNotificationArticle() {
		return notificationArticle;
	}
	public void setNotificationArticle(String notificationArticle) {
		this.notificationArticle = notificationArticle;
	}
	@Override
	public String toString() {
		return "NotificationRecordingBean [notificationRecordingSeqNo=" + notificationRecordingSeqNo + ", account="
				+ account + ", receiverAccount=" + receiverAccount + ", notificationSeqNo=" + notificationSeqNo
				+ ", notificationRecordingStatus=" + notificationRecordingStatus + ", notificationDate="
				+ notificationDate + ", notificationReadDate=" + notificationReadDate + ", notificationArticle="
				+ notificationArticle + "]";
	}

	

}
