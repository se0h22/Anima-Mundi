package org.ani.vo;

public class TestListVo {
	private String testTable_name;
	private String test_name;
	private int point;
	
	public TestListVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TestListVo(String testTable_name, String test_name, int point) {
		super();
		this.testTable_name = testTable_name;
		this.test_name = test_name;
		this.point = point;
	}
	public String getTestTable_name() {
		return testTable_name;
	}
	public void setTestTable_name(String testTable_name) {
		this.testTable_name = testTable_name;
	}
	public String getTest_name() {
		return test_name;
	}
	public void setTest_name(String test_name) {
		this.test_name = test_name;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}	
}
