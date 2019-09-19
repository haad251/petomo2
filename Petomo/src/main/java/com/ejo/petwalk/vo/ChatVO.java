package com.ejo.petwalk.vo;

import lombok.Data;

//@Data
public class ChatVO {
	private String chat_id,res_id,chat_sender,chat_receiver,chat_content,chat_date;

	public ChatVO(String res_id, String chat_sender, String chat_receiver, String chat_content) {
		super();
		this.res_id = res_id;
		this.chat_sender = chat_sender;
		this.chat_receiver = chat_receiver;
		this.chat_content = chat_content;
	}
	
	
	public ChatVO(String chat_id, String res_id, String chat_sender, String chat_receiver, String chat_content,
			String chat_date) {
		super();
		this.chat_id = chat_id;
		this.res_id = res_id;
		this.chat_sender = chat_sender;
		this.chat_receiver = chat_receiver;
		this.chat_content = chat_content;
		this.chat_date = chat_date;
	}

	public ChatVO() {
		super();
	}

	public String getChat_id() {
		return chat_id;
	}

	public void setChat_id(String chat_id) {
		this.chat_id = chat_id;
	}

	public String getRes_id() {
		return res_id;
	}

	public void setRes_id(String res_id) {
		this.res_id = res_id;
	}

	public String getChat_sender() {
		return chat_sender;
	}

	public void setChat_sender(String chat_sender) {
		this.chat_sender = chat_sender;
	}

	public String getChat_receiver() {
		return chat_receiver;
	}

	public void setChat_receiver(String chat_receiver) {
		this.chat_receiver = chat_receiver;
	}

	public String getChat_content() {
		return chat_content;
	}

	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}

	public String getChat_date() {
		return chat_date;
	}

	public void setChat_date(String chat_date) {
		this.chat_date = chat_date;
	}

	@Override
	public String toString() {
		return "Chat [chat_id=" + chat_id + ", res_id=" + res_id + ", chat_sender=" + chat_sender + ", chat_receiver="
				+ chat_receiver + ", chat_content=" + chat_content + ", chat_date=" + chat_date + "]";
	}

	
	
}
