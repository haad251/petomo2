package com.ejo.petwalk.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ejo.petwalk.vo.ChatVO;
import com.ejo.petwalk.vo.LocationVO;
import com.ejo.petwalk.vo.ReservationVO;

public interface ReservationMapper {
    public int insertChat(ChatVO chat);
    public List<HashMap<String,String>> selectChatAll(String res_id);

    
    public int insertReservation(ReservationVO res);
    public ReservationVO selectOneRes(String res_id);
    public ArrayList<ReservationVO> selectResAllBySt_id(String st_id);
    public ArrayList<ReservationVO> selectResAllByMb_id(String mb_id);
    
    
	/* map���� CRUD */
    public int insertLoc(LocationVO loc);
    public ArrayList<LocationVO> selectLocationInfoAll(String res_id);
    
    
    
    
    
}
