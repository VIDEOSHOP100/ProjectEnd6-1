package com.iii._16_.StreetName.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="streetname")
public class StreetBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer uid;
	private String mailcode;
	private String city;
	private String country;
	private String road;
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getMailcode() {
		return mailcode;
	}
	public void setMailcode(String mailcode) {
		this.mailcode = mailcode;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getRoad() {
		return road;
	}
	public void setRoad(String road) {
		this.road = road;
	}
	@Override
	public String toString() {
		return "StreetBean [uid=" + uid + ", mailcode=" + mailcode + ", city=" + city + ", country=" + country
				+ ", road=" + road + "]";
	}
	public StreetBean(Integer uid, String mailcode, String city, String country, String road) {
		super();
		this.uid = uid;
		this.mailcode = mailcode;
		this.city = city;
		this.country = country;
		this.road = road;
	}
	public StreetBean() {
		super();
	}
	
}
