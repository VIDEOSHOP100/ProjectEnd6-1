package com.iii._19_.videoChat.model;

public class Data {
	private Candidate candidate;
	private Sdp sdp;

	public Data(Candidate candidate, Sdp sdp) {
		super();
		this.candidate = candidate;
		this.sdp = sdp;
	}

	public Data() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Candidate getCandidate() {
		return candidate;
	}

	public void setCandidate(Candidate candidate) {
		this.candidate = candidate;
	}

	public Sdp getSdp() {
		return sdp;
	}

	public void setSdp(Sdp sdp) {
		this.sdp = sdp;
	}

	@Override
	public String toString() {
		return "Data [candidate=" + candidate + ", sdp=" + sdp + "]";
	}

}
