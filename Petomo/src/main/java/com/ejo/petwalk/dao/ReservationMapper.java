package com.ejo.petwalk.dao;

import java.util.HashMap;
import java.util.List;

import com.ejo.petwalk.vo.ChatVO;
import com.ejo.petwalk.vo.ReservationVO;

public interface ReservationMapper {
    public int insertChat(ChatVO chat) throws Exception;
    public List<HashMap<String,String>> selectAllChat(String res_id) throws Exception;
    public ReservationVO selectOneRes(String res_id) throws Exception;
}
