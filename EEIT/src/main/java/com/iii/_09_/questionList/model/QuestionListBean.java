package com.iii._09_.questionList.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "QuestionList")
public class QuestionListBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer questionListSeqNo;
	private String questionListTitle;
	private String questionListArticle;
	private String questionListStatus;
	private Timestamp questionListUploadDate;
	private String managerId;

	public QuestionListBean(Integer questionListSeqNo, String questionListTitle, String questionListArticle,
			String questionListStatus, Timestamp questionListUploadDate, String managerId) {
		super();
		this.questionListSeqNo = questionListSeqNo;
		this.questionListTitle = questionListTitle;
		this.questionListArticle = questionListArticle;
		this.questionListStatus = questionListStatus;
		this.questionListUploadDate = questionListUploadDate;
		this.managerId = managerId;
	}

	public QuestionListBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getQuestionListSeqNo() {
		return questionListSeqNo;
	}

	public void setQuestionListSeqNo(Integer questionListSeqNo) {
		this.questionListSeqNo = questionListSeqNo;
	}

	public String getQuestionListTitle() {
		return questionListTitle;
	}

	public void setQuestionListTitle(String questionListTitle) {
		this.questionListTitle = questionListTitle;
	}

	public String getQuestionListArticle() {
		return questionListArticle;
	}

	public void setQuestionListArticle(String questionListArticle) {
		this.questionListArticle = questionListArticle;
	}

	public String getQuestionListStatus() {
		return questionListStatus;
	}

	public void setQuestionListStatus(String questionListStatus) {
		this.questionListStatus = questionListStatus;
	}

	public Timestamp getQuestionListUploadDate() {
		return questionListUploadDate;
	}

	public void setQuestionListUploadDate(Timestamp questionListUploadDate) {
		this.questionListUploadDate = questionListUploadDate;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	@Override
	public String toString() {
		return "QuestionListBean [questionListSeqNo=" + questionListSeqNo + ", questionListTitle=" + questionListTitle
				+ ", questionListArticle=" + questionListArticle + ", questionListStatus=" + questionListStatus
				+ ", questionListUploadDate=" + questionListUploadDate + ", managerId=" + managerId + "]";
	}

}
