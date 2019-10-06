package com.ejo.petwalk.vo;

public class MemberVO {
	private String mb_id, mb_pw, mb_name,mb_nickname,mb_email,mb_addr,mb_lineid,mb_status,mb_streamid;

	public MemberVO(String mb_id, String mb_pw, String mb_name, String mb_nickname, String mb_email, String mb_addr,
			String mb_lineid, String mb_status,String mb_streamid) {
		super();
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
		this.mb_name = mb_name;
		this.mb_nickname = mb_nickname;
		this.mb_email = mb_email;
		this.mb_addr = mb_addr;
		this.mb_lineid = mb_lineid;
		this.mb_status = mb_status;
		this.mb_streamid = mb_streamid;
	}

	public MemberVO() {
		super();
	}
	
	
	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public String getMb_pw() {
		return mb_pw;
	}

	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}

	public String getMb_name() {
		return mb_name;
	}

	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}

	public String getMb_nickname() {
		return mb_nickname;
	}

	public void setMb_nickname(String mb_nickname) {
		this.mb_nickname = mb_nickname;
	}

	public String getMb_email() {
		return mb_email;
	}

	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}

	public String getMb_addr() {
		return mb_addr;
	}

	public void setMb_addr(String mb_addr) {
		this.mb_addr = mb_addr;
	}

	public String getMb_lineid() {
		return mb_lineid;
	}

	public void setMb_lineid(String mb_lineid) {
		this.mb_lineid = mb_lineid;
	}

	public String getMb_status() {
		return mb_status;
	}

	public void setMb_status(String mb_status) {
		this.mb_status = mb_status;
	}
	public String getmb_streamid() {
		return mb_streamid;
	}
	public void setmb_streamid(String mb_streamid) {
		this.mb_streamid = mb_streamid;
	}

	@Override
	public String toString() {
		return "Member [mb_id=" + mb_id + ", mb_pw=" + mb_pw + ", mb_name=" + mb_name + ", mb_nickname="
				+ mb_nickname + ", mb_email=" + mb_email + ", mb_addr=" + mb_addr + ", mb_lineid=" + mb_lineid
				+ ", mb_status=" + mb_status + "]";
	}
	
}
