package com.iii._19_.videoChat.model;

public class Sdp {
	private String type;
	private String sdp;

	public Sdp(String type, String sdp) {
		super();
		this.type = type;
		this.sdp = sdp;
	}

	public Sdp() {
		super();
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSdp() {
		return sdp;
	}

	public void setSdp(String sdp) {
		this.sdp = sdp;
	}

	@Override
	public String toString() {
		return "Sdp [type=" + type + ", sdp=" + sdp + "]";
	}

}
