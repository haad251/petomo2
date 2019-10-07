package com.ejo.petwalk.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ejo.petwalk.dao.ReservationMapper;
import com.ejo.petwalk.vo.ChatVO;
import com.ejo.petwalk.vo.LocationVO;
import com.ejo.petwalk.vo.NotificationVO;
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
    
    public int insertNoti(NotificationVO noti) {
		return dao.insertNoti(noti);
	}
    
    public ArrayList<NotificationVO> selectNotiUnreadAll(String id){
    	return dao.selectNotiUnreadAll(id);
    }
    
    public String selectMaxNoti(){
    	return dao.selectMaxNoti();
    }
    
    public int updateNoti(NotificationVO noti){
    	return dao.updateNoti(noti);
    }
    
    
    // 모든 리스트 불러오기
	public List<ReservationVO> selectAllRes() {
		// TODO Auto-generated method stub
		return dao.selectAllRes();
	}

	public int streamingStart(ReservationVO res) {
		return dao.insertStreamId(res);
	}

	public int StreamingEnd(ReservationVO res) {
		return dao.deleteStreamingId(res);
	}

    public List<HashMap<String,String>> selectResTime(HashMap<String,String> hMap){
    	return dao.selectResTime(hMap);
    }

	public List<ReservationVO> selectResByMb_id(String mb_id) {
		return dao.selectResByMb_id(mb_id);
	}

	public List<ReservationVO> selectResListBySt_id(ReservationVO res) {
		
		return dao.selectResListBySt_id(res);
	}

}
