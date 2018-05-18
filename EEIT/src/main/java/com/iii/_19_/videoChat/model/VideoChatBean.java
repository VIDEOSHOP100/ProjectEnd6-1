package com.iii._19_.videoChat.model;

public class VideoChatBean {
	private String userName;
	private String type;
	private String event;
	private Data data;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getEvent() {
		return event;
	}

	public void setEvent(String event) {
		this.event = event;
	}

	public Data getData() {
		return data;
	}

	public void setData(Data data) {
		this.data = data;
	}

	public VideoChatBean(String userName, String type, String event, Data data) {
		super();
		this.userName = userName;
		this.type = type;
		this.event = event;
		this.data = data;
	}

	public VideoChatBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "VideoChatBean [userName=" + userName + ", type=" + type + ", event=" + event + ", data=" + data + "]";
	}

}
