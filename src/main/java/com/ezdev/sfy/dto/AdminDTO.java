package com.ezdev.sfy.dto;

public class AdminDTO {
	
	private String admin_id;
	private String admin_name;
	private String admin_passwd;
	private String admin_passwd_confirm;
	private String admin_email;
	private String admin_profileImg;
	
	
	public String getAdmin_passwd_confirm() {
		return admin_passwd_confirm;
	}
	public void setAdmin_passwd_confirm(String admin_passwd_confirm) {
		this.admin_passwd_confirm = admin_passwd_confirm;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_passwd() {
		return admin_passwd;
	}
	public void setAdmin_passwd(String admin_passwd) {
		this.admin_passwd = admin_passwd;
	}
	public String getAdmin_email() {
		return admin_email;
	}
	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}
	public String getAdmin_profileImg() {
		return admin_profileImg;
	}
	public void setAdmin_profileImg(String admin_profileImg) {
		this.admin_profileImg = admin_profileImg;
	}

}
