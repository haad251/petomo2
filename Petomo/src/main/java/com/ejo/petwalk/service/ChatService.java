package com.ejo.petwalk.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ejo.petwalk.dao.ChatMapper;
import com.ejo.petwalk.vo.ChatVO;

@Service
public class ChatService {

	@Autowired
	ChatMapper dao;
	
	public int insertChat(ChatVO chat) throws Exception {
		return dao.insertChat(chat);
	}
	
	public List<HashMap<String,String>> selectAllChat(String res_id) throws Exception{
		return dao.selectAllChat(res_id);
	}
}
