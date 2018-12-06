package org.ani.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class QABoardVo {
	private int bno;
	private String category;
	private String id;
	private String title;
	private String content;
	private String filename;
	private Date writeDate;
	private String state;
	private MultipartFile upload;
	
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public QABoardVo(int bno, String category, String id, String title, String content, String filename, Date writeDate,
			String state) {
		super();
		this.bno = bno;
		this.category = category;
		this.id = id;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.writeDate = writeDate;
		this.state = state;
	}
	public QABoardVo() {
		super();
	}
	
}
