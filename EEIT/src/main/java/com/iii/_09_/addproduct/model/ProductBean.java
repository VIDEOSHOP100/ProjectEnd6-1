package com.iii._09_.addproduct.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlTransient;

import org.springframework.web.multipart.MultipartFile;

//商城商品
@Entity
@Table(name = "Product")
public class ProductBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productSeqNo; // 	產品編號
	private String proName;       //   	產品名稱
	private String proPicPath;    //    商品圖片路徑
	private double price;         //   	產品價格
	private Integer brandSeqNo;   //  	品牌
	private String proSpeicNo1;   //   	產品敘述 1
	private String proSpeicNo2;   //   	產品敘述 2
	private Integer picSeqNo;     //  	產品圖片編號
	private double prostock;      //  	庫存
	private double prodiscount;   //  	折扣
//	private String className;     //  	商品名稱(刪除)
	private String account;       //   	賣家帳號
	private java.util.Date proDate;//	上架時間
	private String proStatus;     //   	商品狀態
	private String volume;//         	商品材積
	private double weight;//         	商品重量(單位:公斤)
	private String transport;//      	運送方式
//	private String proPicFileName;// 	商品圖片名
//	private String proPicFilePath;// 	商品圖片路徑
	private Integer categorySeqNo;// 	廠牌編號

	@Transient
	@XmlTransient
	private MultipartFile proPic;//  商品圖片

	public MultipartFile getProPic() {
		return proPic;
	}

	public void setProPic(MultipartFile proPic) {
		this.proPic = proPic;
	}
	
	
	public Integer getProductSeqNo() {
		return productSeqNo;
	}

	public void setProductSeqNo(Integer productSeqNo) {
		this.productSeqNo = productSeqNo;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getProPicPath() {
		return proPicPath;
	}

	public void setProPicPath(String proPicPath) {
		this.proPicPath = proPicPath;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Integer getBrandSeqNo() {
		return brandSeqNo;
	}

	public void setBrandSeqNo(Integer brandSeqNo) {
		this.brandSeqNo = brandSeqNo;
	}

	public String getProSpeicNo1() {
		return proSpeicNo1;
	}

	public void setProSpeicNo1(String proSpeicNo1) {
		this.proSpeicNo1 = proSpeicNo1;
	}

	public String getProSpeicNo2() {
		return proSpeicNo2;
	}

	public void setProSpeicNo2(String proSpeicNo2) {
		this.proSpeicNo2 = proSpeicNo2;
	}

	public Integer getPicSeqNo() {
		return picSeqNo;
	}

	public void setPicSeqNo(Integer picSeqNo) {
		this.picSeqNo = picSeqNo;
	}

	public double getProstock() {
		return prostock;
	}

	public void setProstock(double prostock) {
		this.prostock = prostock;
	}

	public double getProdiscount() {
		return prodiscount;
	}

	public void setProdiscount(double prodiscount) {
		this.prodiscount = prodiscount;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public java.util.Date getProDate() {
		return proDate;
	}

	public void setProDate(java.util.Date proDate) {
		this.proDate = proDate;
	}

	public String getProStatus() {
		return proStatus;
	}

	public void setProStatus(String proStatus) {
		this.proStatus = proStatus;
	}

	public String getVolume() {
		return volume;
	}

	public void setVolume(String volume) {
		this.volume = volume;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public String getTransport() {
		return transport;
	}

	public void setTransport(String transport) {
		this.transport = transport;
	}

	public Integer getCategorySeqNo() {
		return categorySeqNo;
	}

	public void setCategorySeqNo(Integer categorySeqNo) {
		this.categorySeqNo = categorySeqNo;
	}



	@Override
	public String toString() {
		return "ProductBean [productSeqNo=" + productSeqNo + ", proName=" + proName + ", proPicPath=" + proPicPath
				+ ", price=" + price + ", brandSeqNo=" + brandSeqNo + ", proSpeicNo1=" + proSpeicNo1 + ", proSpeicNo2="
				+ proSpeicNo2 + ", picSeqNo=" + picSeqNo + ", prostock=" + prostock + ", prodiscount=" + prodiscount
				+ ", account=" + account + ", proDate=" + proDate + ", proStatus=" + proStatus + ", volume=" + volume
				+ ", weight=" + weight + ", transport=" + transport + ", categorySeqNo=" + categorySeqNo + ", proPic="
				+ proPic + "]";
	}



	public ProductBean(Integer productSeqNo, String proName, String proPicPath, double price, Integer brandSeqNo,
			String proSpeicNo1, String proSpeicNo2, Integer picSeqNo, double prostock, double prodiscount,
			String account, Date proDate, String proStatus, String volume, double weight, String transport,
			Integer categorySeqNo, MultipartFile proPic) {
		super();
		this.productSeqNo = productSeqNo;
		this.proName = proName;
		this.proPicPath = proPicPath;
		this.price = price;
		this.brandSeqNo = brandSeqNo;
		this.proSpeicNo1 = proSpeicNo1;
		this.proSpeicNo2 = proSpeicNo2;
		this.picSeqNo = picSeqNo;
		this.prostock = prostock;
		this.prodiscount = prodiscount;
		this.account = account;
		this.proDate = proDate;
		this.proStatus = proStatus;
		this.volume = volume;
		this.weight = weight;
		this.transport = transport;
		this.categorySeqNo = categorySeqNo;
		this.proPic = proPic;
	}

	public ProductBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	
}
