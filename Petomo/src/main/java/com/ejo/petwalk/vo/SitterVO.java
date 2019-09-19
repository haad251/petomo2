package com.ejo.petwalk.vo;

public class SitterVO {
	private String st_id,st_pw,st_name,st_email,st_sex,st_lineid,st_loc1,
				st_loc2,st_info,st_license,st_level,st_check,st_rate,st_url;

	public SitterVO(String st_id, String st_pw, String st_name, String st_email, String st_sex, String st_lineid,
			String st_loc1, String st_loc2, String st_info, String st_license, String st_level, String st_check,
			String st_rate, String st_url) {
		super();
		this.st_id = st_id;
		this.st_pw = st_pw;
		this.st_name = st_name;
		this.st_email = st_email;
		this.st_sex = st_sex;
		this.st_lineid = st_lineid;
		this.st_loc1 = st_loc1;
		this.st_loc2 = st_loc2;
		this.st_info = st_info;
		this.st_license = st_license;
		this.st_level = st_level;
		this.st_check = st_check;
		this.st_rate = st_rate;
		this.st_url = st_url;
	}

	public SitterVO() {
		super();
	}

	public String getSt_id() {
		return st_id;
	}

	public void setSt_id(String st_id) {
		this.st_id = st_id;
	}

	public String getSt_pw() {
		return st_pw;
	}

	public void setSt_pw(String st_pw) {
		this.st_pw = st_pw;
	}

	public String getSt_name() {
		return st_name;
	}

	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}

	public String getSt_email() {
		return st_email;
	}

	public void setSt_email(String st_email) {
		this.st_email = st_email;
	}

	public String getSt_sex() {
		return st_sex;
	}

	public void setSt_sex(String st_sex) {
		this.st_sex = st_sex;
	}

	public String getSt_lineid() {
		return st_lineid;
	}

	public void setSt_lineid(String st_lineid) {
		this.st_lineid = st_lineid;
	}

	public String getSt_loc1() {
		return st_loc1;
	}

	public void setSt_loc1(String st_loc1) {
		this.st_loc1 = st_loc1;
	}

	public String getSt_loc2() {
		return st_loc2;
	}

	public void setSt_loc2(String st_loc2) {
		this.st_loc2 = st_loc2;
	}

	public String getSt_info() {
		return st_info;
	}

	public void setSt_info(String st_info) {
		this.st_info = st_info;
	}

	public String getSt_license() {
		return st_license;
	}

	public void setSt_license(String st_license) {
		this.st_license = st_license;
	}

	public String getSt_level() {
		return st_level;
	}

	public void setSt_level(String st_level) {
		this.st_level = st_level;
	}

	public String getSt_check() {
		return st_check;
	}

	public void setSt_check(String st_check) {
		this.st_check = st_check;
	}

	public String getSt_rate() {
		return st_rate;
	}

	public void setSt_rate(String st_rate) {
		this.st_rate = st_rate;
	}

	public String getSt_url() {
		return st_url;
	}

	public void setSt_url(String st_url) {
		this.st_url = st_url;
	}

	@Override
	public String toString() {
		return "SitterVO [st_id=" + st_id + ", st_pw=" + st_pw + ", st_name=" + st_name + ", st_email=" + st_email
				+ ", st_sex=" + st_sex + ", st_lineid=" + st_lineid + ", st_loc1=" + st_loc1 + ", st_loc2=" + st_loc2
				+ ", st_info=" + st_info + ", st_license=" + st_license + ", st_level=" + st_level + ", st_check="
				+ st_check + ", st_rate=" + st_rate + ", st_url=" + st_url + "]";
	}
 
	
}
