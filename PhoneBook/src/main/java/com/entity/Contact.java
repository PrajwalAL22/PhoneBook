package com.entity;

public class Contact {
	
	private int id;
	private String name;
	private String emailaddress;
	private String phone;
	private String about;
	private int userId;
	
	public Contact() {
		super();
	}

	public Contact(String name, String emailaddress, String phone, String about, int userId) {
		super();
		this.name = name;
		this.emailaddress = emailaddress;
		this.phone = phone;
		this.about = about;
		this.userId = userId;
	}	 
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmailaddress() {
		return emailaddress;
	}
	public void setEmailaddress(String emailaddress) {
		this.emailaddress = emailaddress;
	}
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
	
	@Override
	public String toString() {
		return "Contact [name=" + name + ", emailaddress=" + emailaddress + ", phone=" + phone + ", about=" + about
				+ ", userId=" + userId + "]";
	}

}
