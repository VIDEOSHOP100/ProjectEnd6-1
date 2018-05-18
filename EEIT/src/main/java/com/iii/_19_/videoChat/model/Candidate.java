package com.iii._19_.videoChat.model;

public class Candidate {
	private String candidate;
	private String sdpMid;
	private String sdpMLineIndex;

	public String getCandidate() {
		return candidate;
	}

	public void setCandidate(String candidate) {
		this.candidate = candidate;
	}

	public String getSdpMid() {
		return sdpMid;
	}

	public void setSdpMid(String sdpMid) {
		this.sdpMid = sdpMid;
	}

	public String getSdpMLineIndex() {
		return sdpMLineIndex;
	}

	public void setSdpMLineIndex(String sdpMLineIndex) {
		this.sdpMLineIndex = sdpMLineIndex;
	}

	public Candidate(String candidate, String sdpMid, String sdpMLineIndex) {
		super();
		this.candidate = candidate;
		this.sdpMid = sdpMid;
		this.sdpMLineIndex = sdpMLineIndex;
	}

	public Candidate() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Candidate [candidate=" + candidate + ", sdpMid=" + sdpMid + ", sdpMLineIndex=" + sdpMLineIndex + "]";
	}

}
