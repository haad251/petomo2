package com.ejo.petwalk.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ejo.petwalk.dao.ReservationMapper;
import com.ejo.petwalk.vo.ChatVO;
import com.ejo.petwalk.vo.ReservationVO;

@Service
public class ReservationService {

	@Autowired
	ReservationMapper dao;
	
	public int insertChat(ChatVO chat) throws Exception {
		return dao.insertChat(chat);
	}
	
	public List<HashMap<String,String>> selectAllChat(String res_id) throws Exception{
		return dao.selectAllChat(res_id);
	}
	
    public ReservationVO selectOneRes(String res_id) throws Exception{
    	return dao.selectOneRes(res_id);
    }
}
