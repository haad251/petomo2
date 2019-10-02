package com.ejo.petwalk.dao;

import java.util.ArrayList;
import java.util.List;

import com.ejo.petwalk.vo.ReservationVO;
import com.ejo.petwalk.vo.ServiceVO;

public interface ManagerMapper {
	
	/* MJ - Service관련 CRUD */
	public int insertNewService(ServiceVO service) throws Exception;
	public ArrayList<ServiceVO> selectAllService() throws Exception;
	public ServiceVO selectOneService(String service_id) throws Exception;
	public int deleteOneService(String service_id) throws Exception;
	public int updateService(ServiceVO service) throws Exception;
	
	
	/* MJ - 예약 내역 및 평균 매출관련 CRUD */
	public List<ReservationVO> selectAllRes() throws Exception; //모든 예약 목록 가져오기
	public List<ReservationVO> selectResByDate(String res_start) throws Exception; //오늘의 예약 목록 가져오기
	public List<ReservationVO> selectResByMonth(String res_start) throws Exception; //이번달 예약 목록 가져오기
	public List<ReservationVO> selectResByYear(String res_start) throws Exception; //올해의 예약 목록 가져오기
}
