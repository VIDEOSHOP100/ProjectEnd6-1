package com.iii._14_.forum.model.comment;

import java.sql.Timestamp;
import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ForumComment")
public class CommentBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int commentSeqNo;
	private int articleSeqNo;
	private String commentContent;
	private String account;
	private Timestamp commentAccountLastLogin;
	private byte[] commentAccountPic;
	
	@Override
	public String toString() {
		return "CommentBean [commentSeqNo=" + commentSeqNo + ", articleSeqNo=" + articleSeqNo + ", commentContent="
				+ commentContent + ", account=" + account + ", commentAccountLastLogin=" + commentAccountLastLogin
				+ ", commentAccountPic=" + Arrays.toString(commentAccountPic) + "]";
	}

	public CommentBean(int commentSeqNo, int articleSeqNo, String commentContent, String account,
			Timestamp commentAccountLastLogin, byte[] commentAccountPic) {
		super();
		this.commentSeqNo = commentSeqNo;
		this.articleSeqNo = articleSeqNo;
		this.commentContent = commentContent;
		this.account = account;
		this.commentAccountLastLogin = commentAccountLastLogin;
		this.commentAccountPic = commentAccountPic;
	}

	public int getCommentSeqNo() {
		return commentSeqNo;
	}

	public void setCommentSeqNo(int commentSeqNo) {
		this.commentSeqNo = commentSeqNo;
	}

	public int getArticleSeqNo() {
		return articleSeqNo;
	}

	public void setArticleSeqNo(int articleSeqNo) {
		this.articleSeqNo = articleSeqNo;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public Timestamp getCommentAccountLastLogin() {
		return commentAccountLastLogin;
	}

	public void setCommentAccountLastLogin(Timestamp commentAccountLastLogin) {
		this.commentAccountLastLogin = commentAccountLastLogin;
	}

	public byte[] getCommentAccountPic() {
		return commentAccountPic;
	}

	public void setCommentAccountPic(byte[] commentAccountPic) {
		this.commentAccountPic = commentAccountPic;
	}
	
	
	
}
