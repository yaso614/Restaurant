package com.RestaurantProject.www.user.vo;

	
public class User {
	private String userid;
	private String password;
	private String name;
	private String email;
	private String sex;
	private String birthday;
	private String loyalty;
	private String address;
	private String phone;
	
	public User(){}
	public User(String userid, String password, String name, String email, String sex, String birthday, String loyalty,
			String address, String phone) {
		this.userid = userid;
		this.password = password;
		this.name = name;
		this.email = email;
		this.sex = sex;
		this.birthday = birthday;
		this.loyalty = loyalty;
		this.address = address;
		this.phone = phone;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getLoyalty() {
		return loyalty;
	}
	public void setLoyalty(String loyalty) {
		this.loyalty = loyalty;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "User [userid=" + userid + ", password=" + password + ", name=" + name + ", email=" + email + ", sex="
				+ sex + ", birthday=" + birthday + ", loyalty=" + loyalty + ", address=" + address + ", phone=" + phone
				+ "]";
	}
	
	
	
	
	
	
	
}
