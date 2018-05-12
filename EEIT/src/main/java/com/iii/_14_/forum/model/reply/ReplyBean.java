package com.iii._14_.forum.model.reply;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ForumReply")
public class ReplyBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int replySeqNo;
	private int commentSeqNo;
	private String account;
	private String replyContent;
	private Timestamp replyUploadTime;
	
	
	@Override
	public String toString() {
		return "replyBean [replySeqNo=" + replySeqNo + ", commentSeqNo=" + commentSeqNo + ", account=" + account
				+ ", replyContent=" + replyContent + ", replyUploadTime=" + replyUploadTime + "]";
	}


	public ReplyBean(int replySeqNo, int commentSeqNo, String account, String replyContent, Timestamp replyUploadTime) {
		super();
		this.replySeqNo = replySeqNo;
		this.commentSeqNo = commentSeqNo;
		this.account = account;
		this.replyContent = replyContent;
		this.replyUploadTime = replyUploadTime;
	}


	public int getReplySeqNo() {
		return replySeqNo;
	}


	public void setReplySeqNo(int replySeqNo) {
		this.replySeqNo = replySeqNo;
	}


	public int getCommentSeqNo() {
		return commentSeqNo;
	}


	public void setCommentSeqNo(int commentSeqNo) {
		this.commentSeqNo = commentSeqNo;
	}


	public String getAccount() {
		return account;
	}


	public void setAccount(String account) {
		this.account = account;
	}


	public String getReplyContent() {
		return replyContent;
	}


	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}


	public Timestamp getReplyUploadTime() {
		return replyUploadTime;
	}


	public void setReplyUploadTime(Timestamp replyUploadTime) {
		this.replyUploadTime = replyUploadTime;
	}
	
	
	
}
