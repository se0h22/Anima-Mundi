package org.ani.vo;

public class UserCustomVo {
	private String item_key;
	private String id;
	private String buy_date;
	private boolean now;
	private int count;
	private int lcount;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public UserCustomVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getLcount() {
		return lcount;
	}
	public void setLcount(int lcount) {
		this.lcount = lcount;
	}
	public UserCustomVo(String item_key, String id, String buy_date, boolean now, int count, int lcount) {
		super();
		this.item_key = item_key;
		this.id = id;
		this.buy_date = buy_date;
		this.now = now;
		this.count = count;
		this.lcount = lcount;
	}
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
	public String getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(String buy_date) {
		this.buy_date = buy_date;
	}
	public boolean isNow() {
		return now;
	}
	public void setNow(boolean now) {
		this.now = now;
	}
}

