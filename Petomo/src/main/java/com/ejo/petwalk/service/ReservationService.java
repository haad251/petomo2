package com.ejo.petwalk.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ejo.petwalk.dao.ReservationMapper;
import com.ejo.petwalk.vo.ChatVO;
import com.ejo.petwalk.vo.LocationVO;
import com.ejo.petwalk.vo.ReservationVO;

@Service
public class ReservationService {

	@Autowired
	ReservationMapper dao;
	
	////Chat
	public int insertChat(ChatVO chat) {
		return dao.insertChat(chat);
	}
	
	public List<HashMap<String,String>> selectChatAll(String res_id){
		return dao.selectChatAll(res_id);
	}
	
//	Reservation
	
	public int insertReservation(ReservationVO res)  {
	   	return dao.insertReservation(res);
	}	
	
    public ReservationVO selectOneRes(String res_id)  {
    	return dao.selectOneRes(res_id);
    }

    public List<HashMap<String,String>> selectResAllByMb_id(String mb_id){
    	return dao.selectResAllByMb_id(mb_id);
    }

    public List<HashMap<String,String>> selectResAllBySt_id(String st_id){
    	return dao.selectResAllBySt_id(st_id);
    }

    public int updateResStatus(ReservationVO res) {
		return dao.updateResStatus(res);
	}
    
    public int insertReview(ReservationVO res) {
		return dao.insertReview(res);
	}
    
    
    
    
    
	/* [map] CRUD */
    // location ���� ����
    public  int insertLoc(LocationVO loc)  {
    	return dao.insertLoc(loc);
    }
    
    // ��� loaction ���� ��������
    public ArrayList<LocationVO> selectLocationInfoAll(String res_id){
    	return dao.selectLocationInfoAll(res_id);
    }
    // 모든 리스트 불러오기
	public List<ReservationVO> selectAllRes() {
		// TODO Auto-generated method stub
		return dao.selectAllRes();
	}
}
