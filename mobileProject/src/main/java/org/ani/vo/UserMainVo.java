package org.ani.vo;

public class UserMainVo {
	private String id;
	private String nickname;
	private String pwd;
	private String phone;
	private String email;
	private int point;
	
	
	public UserMainVo(String id, String nickname, String pwd, String phone, String email, int point) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.pwd = pwd;
		this.phone = phone;
		this.email = email;
		this.point = point;
	}
	
	public UserMainVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "UserMainVo [id=" + id + ", nickname=" + nickname + ", pwd=" + pwd + ", phone=" + phone + ", email="
				+ email + ", point=" + point + "]";
	}
	
	
}
