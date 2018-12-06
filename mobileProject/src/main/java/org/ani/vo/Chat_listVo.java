package org.ani.vo;

import java.sql.Date;

public class Chat_listVo {
	private int no;
	private String id;
	private String contents;
	private Date chatdate;
	private String receiver;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getChatdate() {
		return chatdate;
	}
	public void setChatdate(Date chatdate) {
		this.chatdate = chatdate;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public Chat_listVo(int no, String id, String contents, Date chatdate, String receiver) {
		super();
		this.no = no;
		this.id = id;
		this.contents = contents;
		this.chatdate = chatdate;
		this.receiver = receiver;
	}
	public Chat_listVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
