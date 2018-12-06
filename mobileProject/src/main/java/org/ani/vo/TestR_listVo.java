package org.ani.vo;

public class TestR_listVo {
	private int index;
	private String id;
	private String testdate;
	private String testTable_name;
	private String result;
	private int count;
	
	public TestR_listVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TestR_listVo(int index, String id, String testdate, String testTable_name, String result, int count) {
		super();
		this.index = index;
		this.id = id;
		this.testdate = testdate;
		this.testTable_name = testTable_name;
		this.result = result;
		this.count = count;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTestdate() {
		return testdate;
	}
	public void setTestdate(String testdate) {
		this.testdate = testdate;
	}
	public String getTestTable_name() {
		return testTable_name;
	}
	public void setTestTable_name(String testTable_name) {
		this.testTable_name = testTable_name;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
}
