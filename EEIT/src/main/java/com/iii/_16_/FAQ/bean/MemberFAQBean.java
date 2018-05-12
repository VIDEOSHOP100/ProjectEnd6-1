package com.iii._16_.FAQ.bean;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlTransient;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.springframework.web.multipart.MultipartFile;

import com.iii.HibernateSessionFactory.HibernateUtil;
import com.iii._01_.Member.bean.MemberBean;
import com.iii._19_.watchHistory.model.WatchHistoryBean;



@Entity
@Table(name = "MemberQues")
public class MemberFAQBean implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer memberQuesSeqNo;
	private String account;
	
	private String memTopic;
	private String memTitle;
	private String memAsk;
	private java.util.Date memQuesTime;
	private String memFileName;
	private String memFilePath;
	
	@Transient
	@XmlTransient
	private MultipartFile memPicName;
	
	public MultipartFile getMemPicName() {
		return memPicName;
	}
	public void setMemPicName(MultipartFile memPicName) {
		this.memPicName = memPicName;
	}
	
	
	@ManyToOne
	@JoinColumn(name = "account", referencedColumnName = "account", insertable = false, updatable = false)
	private MemberBean memberbean;
	

	public MemberBean getMemberbean() {
		return memberbean;
	}

	public void setMemberbean(MemberBean memberbean) {
		this.memberbean = memberbean;
	}

	public MemberFAQBean() {
	}
	
	@Override
	public String toString() {
		return "MemberFAQBean [memberQuesSeqNo=" + memberQuesSeqNo + ", account=" + account + ", memTopic=" + memTopic
				+ ", memTitle=" + memTitle + ", memAsk=" + memAsk + ", memQuesTime=" + memQuesTime + ", memFileName="
				+ memFileName   + ", memberbean=" + memberbean + "]";
	}
	public MemberFAQBean(Integer memberQuesSeqNo, String account, String memTopic, String memTitle, String memAsk,
			java.util.Date memQuesTime, String memFileName,String memFilePath) {
		super();
		this.memberQuesSeqNo = memberQuesSeqNo;
		this.account = account;
		this.memTopic = memTopic;
		this.memTitle = memTitle;
		this.memAsk = memAsk;
		this.memQuesTime = memQuesTime;
		this.memFileName = memFileName;
		this.memFilePath = memFilePath;
	}

	
	
	public String getMemFilePath() {
		return memFilePath;
	}
	public void setMemFilePath(String memFilePath) {
		this.memFilePath = memFilePath;
	}
	public Integer getMemberQuesSeqNo() {
		return memberQuesSeqNo;
	}

	public void setMemberQuesSeqNo(Integer memberQuesSeqNo) {
		this.memberQuesSeqNo = memberQuesSeqNo;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getMemTopic() {
		return memTopic;
	}

	public void setMemTopic(String memTopic) {
		this.memTopic = memTopic;
	}

	public String getMemTitle() {
		return memTitle;
	}

	public void setMemTitle(String memTitle) {
		this.memTitle = memTitle;
	}

	public String getMemAsk() {
		return memAsk;
	}

	public void setMemAsk(String memAsk) {
		this.memAsk = memAsk;
	}

	public java.util.Date getMemQuesTime() {
		return memQuesTime;
	}

	public void setMemQuesTime(java.util.Date memQuesTime) {
		this.memQuesTime = memQuesTime;
	}

	public String getMemFileName() {
		return memFileName;
	}

	public void setMemFileName(String memFileName) {
		this.memFileName = memFileName;
	}

	

	public static void main(String[] args) throws SQLException {
//		try {
//			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
//			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//			//insert			
//			MemberFAQBean insert = new MemberFAQBean();
//			insert.setMemTitle("hello");
//			insert.setMemAsk("xxxxxxxxxxxx");
//			session.save(insert);
//			
//			
//			
//			
//			
//			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
//			HibernateUtil.getSessionFactory().getCurrentSession().close();
//		
//		} finally {
//			HibernateUtil.closeSessionFactory();
//		}
		
	}

}