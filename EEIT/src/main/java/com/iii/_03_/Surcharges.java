package com.iii._03_;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "Surcharges")
public class Surcharges implements Serializable {

	@Id
	private String oversizepiece;
	private String nonstackablepallet;
	private String biologicalsubstances;
	private String dangerousgoods;
	private String lithiumbatteries;

	public String getOversizepiece() {
		return oversizepiece;
	}

	public void setOversizepiece(String oversizepiece) {
		this.oversizepiece = oversizepiece;
	}

	public String getNonstackablepallet() {
		return nonstackablepallet;
	}

	public void setNonstackablepallet(String nonstackablepallet) {
		this.nonstackablepallet = nonstackablepallet;
	}

	public String getBiologicalsubstances() {
		return biologicalsubstances;
	}

	public void setBiologicalsubstances(String biologicalsubstances) {
		this.biologicalsubstances = biologicalsubstances;
	}

	public String getDangerousgoods() {
		return dangerousgoods;
	}

	public void setDangerousgoods(String dangerousgoods) {
		this.dangerousgoods = dangerousgoods;
	}

	public String getLithiumbatteries() {
		return lithiumbatteries;
	}

	public void setLithiumbatteries(String lithiumbatteries) {
		this.lithiumbatteries = lithiumbatteries;
	}

	
	@Override
	public String toString() {
		return "Surcharges [oversizepiece=" + oversizepiece + ", nonstackablepallet=" + nonstackablepallet
				+ ", biologicalsubstances=" + biologicalsubstances + ", dangerousgoods=" + dangerousgoods
				+ ", lithiumbatteries=" + lithiumbatteries + "]";
	}

	
	public Surcharges(String oversizepiece, String nonstackablepallet, String biologicalsubstances,
			String dangerousgoods, String lithiumbatteries) {
		super();
		this.oversizepiece = oversizepiece;
		this.nonstackablepallet = nonstackablepallet;
		this.biologicalsubstances = biologicalsubstances;
		this.dangerousgoods = dangerousgoods;
		this.lithiumbatteries = lithiumbatteries;
	}

	
	public Surcharges() {
		super();
		// TODO Auto-generated constructor stub
	}

	// @Transient

}