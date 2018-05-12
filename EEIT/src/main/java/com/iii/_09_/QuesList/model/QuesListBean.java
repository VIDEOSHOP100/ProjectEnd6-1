package com.iii._09_.QuesList.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "QuesList")
public class QuesListBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer queSeqNo;
	private String queTitle;
	private String queReply;
	
	public Integer getQueSeqNo() {
		return queSeqNo;
	}
	public void setQueSeqNo(Integer queSeqNo) {
		this.queSeqNo = queSeqNo;
	}
	public String getQueTitle() {
		return queTitle;
	}
	public void setQueTitle(String queTitle) {
		this.queTitle = queTitle;
	}
	public String getQueReply() {
		return queReply;
	}
	public void setQueReply(String queReply) {
		this.queReply = queReply;
	}
	
	@Override
	public String toString() {
		return "QuesListBean [queSeqNo=" + queSeqNo + ", queTitle=" + queTitle + ", queReply=" + queReply + "]";
	}
	
	public QuesListBean(Integer queSeqNo, String queTitle, String queReply) {
		super();
		this.queSeqNo = queSeqNo;
		this.queTitle = queTitle;
		this.queReply = queReply;
	}
	
	public QuesListBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
