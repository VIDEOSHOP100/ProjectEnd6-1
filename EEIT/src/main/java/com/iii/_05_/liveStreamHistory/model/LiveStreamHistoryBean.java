package com.iii._05_.liveStreamHistory.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "LiveStreamHistory")
public class LiveStreamHistoryBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer LiveStreamHistorySeqNo;
	private String account;
	private Integer liveStreamSeqNo;
	private Timestamp HistoryTime;
	private String LiveStreamStatus;

	/**
	 * @param liveStreamHistorySeqNo
	 * @param account
	 * @param liveStreamSeqNo
	 * @param historyTime
	 * @param liveStreamStatus
	 */
	public LiveStreamHistoryBean(Integer liveStreamHistorySeqNo, String account, Integer liveStreamSeqNo,
			Timestamp historyTime, String liveStreamStatus) {
		super();
		LiveStreamHistorySeqNo = liveStreamHistorySeqNo;
		this.account = account;
		this.liveStreamSeqNo = liveStreamSeqNo;
		HistoryTime = historyTime;
		LiveStreamStatus = liveStreamStatus;
	}



	@Override
	public String toString() {
		return "LiveStreamBean [LiveStreamHistorySeqNo=" + LiveStreamHistorySeqNo + ", account=" + account
				+ ", liveStreamSeqNo=" + liveStreamSeqNo + ", HistoryTime=" + HistoryTime + ", LiveStreamStatus="
				+ LiveStreamStatus + "]";
	}

	

	public LiveStreamHistoryBean() {
		super();
		
	}
	public Integer getLiveStreamHistorySeqNo() {
		return LiveStreamHistorySeqNo;
	}
	public void setLiveStreamHistorySeqNo(Integer liveStreamHistorySeqNo) {
		LiveStreamHistorySeqNo = liveStreamHistorySeqNo;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public Integer getLiveStreamSeqNo() {
		return liveStreamSeqNo;
	}
	public void setLiveStreamSeqNo(Integer liveStreamSeqNo) {
		this.liveStreamSeqNo = liveStreamSeqNo;
	}
	public Timestamp getHistoryTime() {
		return HistoryTime;
	}
	public void setHistoryTime(Timestamp historyTime) {
		HistoryTime = historyTime;
	}
	public String getLiveStreamStatus() {
		return LiveStreamStatus;
	}
	public void setLiveStreamStatus(String liveStreamStatus) {
		LiveStreamStatus = liveStreamStatus;
	}
	
	
	
}
