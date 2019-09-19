package com.ejo.petwalk.vo;

public class NotificationVO {
	private String not_id, mb_id, not_message, not_status, not_time;

	public NotificationVO(String not_id, String mb_id, String not_message, String not_status, String not_time) {
		super();
		this.not_id = not_id;
		this.mb_id = mb_id;
		this.not_message = not_message;
		this.not_status = not_status;
		this.not_time = not_time;
	}

	public NotificationVO() {
		super();
	}

	public String getNot_id() {
		return not_id;
	}

	public void setNot_id(String not_id) {
		this.not_id = not_id;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public String getNot_message() {
		return not_message;
	}

	public void setNot_message(String not_message) {
		this.not_message = not_message;
	}

	public String getNot_status() {
		return not_status;
	}

	public void setNot_status(String not_status) {
		this.not_status = not_status;
	}

	public String getNot_time() {
		return not_time;
	}

	public void setNot_time(String not_time) {
		this.not_time = not_time;
	}

	@Override
	public String toString() {
		return "NotificationVO [not_id=" + not_id + ", mb_id=" + mb_id + ", not_message=" + not_message
				+ ", not_status=" + not_status + ", not_time=" + not_time + "]";
	}
	
	
}
