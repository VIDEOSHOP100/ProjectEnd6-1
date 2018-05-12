package com.iii._16_.PersonShop.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="PersonShop")
public class PersonShopBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer personShopSeqNo;
	private String personShopName;
	private String personShopCoverFileName;
	private String personShopCoverFilePath;
	private String personShopDescription;
	private String account;

	@Transient
	private MultipartFile PersonShopFile;

	public MultipartFile getPersonShopFile() {
		return PersonShopFile;
	}
	
	
	public String getAccount() {
		return account;
	}


	public void setAccount(String account) {
		this.account = account;
	}


	public void setPersonShopFile(MultipartFile personShopFile) {
		PersonShopFile = personShopFile;
	}
	
	public Integer getPersonShopSeqNo() {
		return personShopSeqNo;
	}


	public void setPersonShopSeqNo(Integer personShopSeqNo) {
		this.personShopSeqNo = personShopSeqNo;
	}


	

	public String getPersonShopName() {
		return personShopName;
	}


	public void setPersonShopName(String personShopName) {
		this.personShopName = personShopName;
	}


	
	public String getPersonShopCoverFileName() {
		return personShopCoverFileName;
	}


	public void setPersonShopCoverFileName(String personShopCoverFileName) {
		this.personShopCoverFileName = personShopCoverFileName;
	}


	public String getPersonShopCoverFilePath() {
		return personShopCoverFilePath;
	}


	public void setPersonShopCoverFilePath(String personShopCoverFilePath) {
		this.personShopCoverFilePath = personShopCoverFilePath;
	}


	public String getPersonShopDescription() {
		return personShopDescription;
	}


	public void setPersonShopDescription(String personShopDescription) {
		this.personShopDescription = personShopDescription;
	}


	public PersonShopBean() {
		super();
	}


	@Override
	public String toString() {
		return "PersonShopBean [personShopSeqNo=" + personShopSeqNo + ", personShopName=" + personShopName
				+ ", personShopCoverFileName=" + personShopCoverFileName + ", personShopCoverFilePath="
				+ personShopCoverFilePath + ", personShopDescription=" + personShopDescription + ", account=" + account
				+ ", PersonShopFile=" + PersonShopFile + "]";
	}


	
	
}
