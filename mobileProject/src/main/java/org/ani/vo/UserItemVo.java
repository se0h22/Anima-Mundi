package org.ani.vo;

import java.util.Date;

public class UserItemVo {
	private String item_key;
	private String id;
	private Date buy_date;
	private String now;
	private String item_image;
	private String item_name;
	private int chatDate;
	private int letter;
	private int point;
	private String info;
	private int no;
	private int lcount;
	
	public String getItem_key() {
		return item_key;
	}
	public void setItem_key(String item_key) {
		this.item_key = item_key;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}
	public String getNow() {
		return now;
	}
	public void setNow(String now) {
		this.now = now;
	}
	public String getItem_image() {
		return item_image;
	}
	public void setItem_image(String item_image) {
		this.item_image = item_image;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getChatDate() {
		return chatDate;
	}
	public void setChatDate(int chatDate) {
		this.chatDate = chatDate;
	}
	public int getLetter() {
		return letter;
	}
	public void setLetter(int letter) {
		this.letter = letter;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public int getLcount() {
		return lcount;
	}
	public void setLcount(int lcount) {
		this.lcount = lcount;
	}
	public UserItemVo(String item_key, String id, Date buy_date, String now, String item_image, String item_name,
			int chatDate, int letter, int point, String info, int no, int lcount) {
		super();
		this.item_key = item_key;
		this.id = id;
		this.buy_date = buy_date;
		this.now = now;
		this.item_image = item_image;
		this.item_name = item_name;
		this.chatDate = chatDate;
		this.letter = letter;
		this.point = point;
		this.info = info;
		this.no = no;
		this.lcount = lcount;
	}
	public UserItemVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
