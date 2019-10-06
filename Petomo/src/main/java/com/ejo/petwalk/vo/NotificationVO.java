package com.ejo.petwalk.vo;

public class NotificationVO {
	private String not_id, res_id, not_receiver, not_sender, not_message, not_status, not_time;
	
	public NotificationVO() {
		super();
	}

	public NotificationVO(String not_id, String res_id, String not_receiver, String not_sender, String not_message,
			String not_status, String not_time) {
		super();
		this.not_id = not_id;
		this.res_id = res_id;
		this.not_receiver = not_receiver;
		this.not_sender = not_sender;
		this.not_message = not_message;
		this.not_status = not_status;
		this.not_time = not_time;
	}

	public String getNot_id() {
		return not_id;
	}

	public void setNot_id(String not_id) {
		this.not_id = not_id;
	}

	public String getRes_id() {
		return res_id;
	}

	public void setRes_id(String res_id) {
		this.res_id = res_id;
	}

	public String getNot_receiver() {
		return not_receiver;
	}

	public void setNot_receiver(String not_receiver) {
		this.not_receiver = not_receiver;
	}

	public String getNot_sender() {
		return not_sender;
	}

	public void setNot_sender(String not_sender) {
		this.not_sender = not_sender;
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
		return "NotificationVO [not_id=" + not_id + ", res_id=" + res_id + ", not_receiver=" + not_receiver
				+ ", not_sender=" + not_sender + ", not_message=" + not_message + ", not_status=" + not_status
				+ ", not_time=" + not_time + "]";
	}

}