package com.iii._19_.notificationSystem.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Notification")
public class NotificationSystemBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer notificationSeqNo;
	private String notificationArticle;
	private String notificationType;
	private Timestamp notificationDate;
	private String notificationStatus;
	private String account;
	private String eventPK;

	public NotificationSystemBean(Integer notificationSeqNo, String notificationArticle, String notificationType,
			Timestamp notificationDate, String notificationStatus, String account, String eventPK) {
		super();
		this.notificationSeqNo = notificationSeqNo;
		this.notificationArticle = notificationArticle;
		this.notificationType = notificationType;
		this.notificationDate = notificationDate;
		this.notificationStatus = notificationStatus;
		this.account = account;
		this.eventPK = eventPK;
	}

	public NotificationSystemBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "NotificationSystemBean [notificationSeqNo=" + notificationSeqNo + ", notificationArticle="
				+ notificationArticle + ", notificationType=" + notificationType + ", notificationDate="
				+ notificationDate + ", notificationStatus=" + notificationStatus + ", account=" + account
				+ ", eventPK=" + eventPK + "]";
	}

	public Integer getNotificationSeqNo() {
		return notificationSeqNo;
	}

	public void setNotificationSeqNo(Integer notificationSeqNo) {
		this.notificationSeqNo = notificationSeqNo;
	}

	public String getNotificationArticle() {
		return notificationArticle;
	}

	public void setNotificationArticle(String notificationArticle) {
		this.notificationArticle = notificationArticle;
	}

	public String getNotificationType() {
		return notificationType;
	}

	public void setNotificationType(String notificationType) {
		this.notificationType = notificationType;
	}

	public Timestamp getNotificationDate() {
		return notificationDate;
	}

	public void setNotificationDate(Timestamp notificationDate) {
		this.notificationDate = notificationDate;
	}

	public String getNotificationStatus() {
		return notificationStatus;
	}

	public void setNotificationStatus(String notificationStatus) {
		this.notificationStatus = notificationStatus;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getEventPK() {
		return eventPK;
	}

	public void setEventPK(String eventPK) {
		this.eventPK = eventPK;
	}

}
