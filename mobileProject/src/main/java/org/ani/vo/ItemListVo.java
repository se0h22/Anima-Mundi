package org.ani.vo;

import java.sql.Date;

public class ItemListVo {
	private String item_key;
	private int point;
	private String item_image;
	private String item_name;
	private int chatDate;
	private int letter;
	private String info;
	public ItemListVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ItemListVo(String item_key, int point, String item_image, String item_name, int chatDate, int letter,
			String info) {
		super();
		this.item_key = item_key;
		this.point = point;
		this.item_image = item_image;
		this.item_name = item_name;
		this.chatDate = chatDate;
		this.letter = letter;
		this.info = info;
	}
	public String getItem_key() {
		return item_key;
	}
	public void setItem_key(String item_key) {
		this.item_key = item_key;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
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
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
}