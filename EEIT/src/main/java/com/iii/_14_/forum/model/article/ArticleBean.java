package com.iii._14_.forum.model.article;

import java.sql.Timestamp;
import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ForumArticle")
public class ArticleBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int articleSeqNo;
	private String articleTitle;
	private String articleContent;
	private Timestamp articleUploadTime;
	private String account;
	private Timestamp articleAccountLastLogin;
	private byte[] articleAccountPic;
	
	public ArticleBean() {
		
	}
	
	@Override
	public String toString() {
		return "ArticleBean [articleSeqNo=" + articleSeqNo + ", articleTitle=" + articleTitle + ", articleContent="
				+ articleContent + ", articleUploadTime=" + articleUploadTime + ", account=" + account
				+ ", articleAccountLastLogin=" + articleAccountLastLogin + ", articleAccountPic="
				+ Arrays.toString(articleAccountPic) + "]";
	} //system.out.println測試用
	
	public ArticleBean(int articleSeqNo, String articleTitle, String articleContent, Timestamp articleUploadTime,
			String account, Timestamp articleAccountLastLogin, byte[] articleAccountPic) {
		super();
		this.articleSeqNo = articleSeqNo;
		this.articleTitle = articleTitle;
		this.articleContent = articleContent;
		this.articleUploadTime = articleUploadTime;
		this.account = account;
		this.articleAccountLastLogin = articleAccountLastLogin;
		this.articleAccountPic = articleAccountPic;
	}
	
	public int getArticleSeqNo() {
		return articleSeqNo;
	}
	public void setArticleSeqNo(int articleSeqNo) {
		this.articleSeqNo = articleSeqNo;
	}
	public String getArticleTitle() {
		return articleTitle;
	}
	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}
	public String getArticleContent() {
		return articleContent;
	}
	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}
	public Timestamp getArticleUploadTime() {
		return articleUploadTime;
	}
	public void setArticleUploadTime(Timestamp articleUploadTime) {
		this.articleUploadTime = articleUploadTime;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public Timestamp getArticleAccountLastLogin() {
		return articleAccountLastLogin;
	}
	public void setArticleAccountLastLogin(Timestamp articleAccountLastLogin) {
		this.articleAccountLastLogin = articleAccountLastLogin;
	}
	public byte[] getArticleAccountPic() {
		return articleAccountPic;
	}
	public void setArticleAccountPic(byte[] articleAccountPic) {
		this.articleAccountPic = articleAccountPic;
	}
	
	
}

