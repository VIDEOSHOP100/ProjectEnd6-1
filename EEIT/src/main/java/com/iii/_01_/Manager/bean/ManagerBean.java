package com.iii._01_.Manager.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="Manager")
public class ManagerBean {

	@Transient
	private Integer managerSeqNo;
	@Id
	private String managerId;
	private String managerPwd;
	private String managerName;
	private Integer managerStatus;

	@Override
	public String toString() {
		return "ManagerBean [managerSeqNo=" + managerSeqNo + ", managerId=" + managerId + ", managerPwd=" + managerPwd
				+ ", managerName=" + managerName + ", managerStatus=" + managerStatus + "]";
	}

	public ManagerBean() {
		super();
	}

	public ManagerBean(String managerId, String managerPwd, String managerName, Integer managerStatus) {
		super();
		this.managerId = managerId;
		this.managerPwd = managerPwd;
		this.managerName = managerName;
		this.managerStatus = managerStatus;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getManagerPwd() {
		return managerPwd;
	}

	public void setManagerPwd(String managerPwd) {
		this.managerPwd = managerPwd;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public Integer getManagerStatus() {
		return managerStatus;
	}

	public void setManagerStatus(Integer managerStatus) {
		this.managerStatus = managerStatus;
	}

	public Integer getManagerSeqNo() {
		return managerSeqNo;
	}

	
}
