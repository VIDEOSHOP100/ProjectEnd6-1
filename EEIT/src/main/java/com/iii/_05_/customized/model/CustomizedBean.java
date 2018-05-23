package com.iii._05_.customized.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "Customized")
public class CustomizedBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer customizedSeqNo;
	private String customizedPic;
	private String customizedTitle;
	private Timestamp customizedTime;
	private String customizedDesc;
	private Integer customizedStatus;
	private String account;
	private Integer sortNum;
	@Transient
	private MultipartFile photo; // 照片 
	public Integer getCustomizedSeqNo() {
		return customizedSeqNo;
	}
	public void setCustomizedSeqNo(Integer customizedSeqNo) {
		this.customizedSeqNo = customizedSeqNo;
	}
	public String getCustomizedPic() {
		return customizedPic;
	}
	public void setCustomizedPic(String customizedPic) {
		this.customizedPic = customizedPic;
	}
	public String getCustomizedTitle() {
		return customizedTitle;
	}
	public void setCustomizedTitle(String customizedTitle) {
		this.customizedTitle = customizedTitle;
	}
	public Timestamp getCustomizedTime() {
		return customizedTime;
	}
	public void setCustomizedTime(Timestamp customizedTime) {
		this.customizedTime = customizedTime;
	}
	public String getCustomizedDesc() {
		return customizedDesc;
	}
	public void setCustomizedDesc(String customizedDesc) {
		this.customizedDesc = customizedDesc;
	}
	public Integer getCustomizedStatus() {
		return customizedStatus;
	}
	public void setCustomizedStatus(Integer customizedStatus) {
		this.customizedStatus = customizedStatus;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public Integer getSortNum() {
		return sortNum;
	}
	public void setSortNum(Integer sortNum) {
		this.sortNum = sortNum;
	}
	public MultipartFile getPhoto() {
		return photo;
	}
	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}
	public CustomizedBean(Integer customizedSeqNo, String customizedPic, String customizedTitle,
			Timestamp customizedTime, String customizedDesc, Integer customizedStatus, String account, Integer sortNum,
			MultipartFile photo) {
		super();
		this.customizedSeqNo = customizedSeqNo;
		this.customizedPic = customizedPic;
		this.customizedTitle = customizedTitle;
		this.customizedTime = customizedTime;
		this.customizedDesc = customizedDesc;
		this.customizedStatus = customizedStatus;
		this.account = account;
		this.sortNum = sortNum;
		this.photo = photo;
	}
	public CustomizedBean() {
		super();
		
	}
	@Override
	public String toString() {
		return "CustomizedBean [customizedSeqNo=" + customizedSeqNo + ", customizedPic=" + customizedPic
				+ ", customizedTitle=" + customizedTitle + ", customizedTime=" + customizedTime + ", customizedDesc="
				+ customizedDesc + ", customizedStatus=" + customizedStatus + ", account=" + account + ", sortNum="
				+ sortNum + ", photo=" + photo + "]";
	}
	
	
	
	
	
}