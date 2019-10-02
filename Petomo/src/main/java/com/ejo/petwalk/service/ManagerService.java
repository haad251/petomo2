package com.ejo.petwalk.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ejo.petwalk.dao.ManagerMapper;
import com.ejo.petwalk.vo.ReservationVO;
import com.ejo.petwalk.vo.ServiceVO;


@Service
public class ManagerService {
	
	@Autowired
	ManagerMapper mdao;
	
	
	/* MJ - [Service] CRUD  */
	public int insertNewService(ServiceVO service) throws Exception {
		return mdao.insertNewService(service);
	};
	
	public ArrayList<ServiceVO> selectAllService() throws Exception{
		return mdao.selectAllService();
	};
	
	public ServiceVO selectOneService(String service_id) throws Exception{
		return mdao.selectOneService(service_id);
	};
	
	public int deleteOneService(String service_id) throws Exception{
		return mdao.deleteOneService(service_id);
	};
	
	public int updateService(ServiceVO service) throws Exception{
		return mdao.updateService(service);
	};
	
    
    /* MJ- 예약 및 매출 관련*/
	//모든 예약 목록
    public List<ReservationVO> selectAllRes() throws Exception{
    	return mdao.selectAllRes();
    }
    
    // 오늘 날짜의 예약 목록
    public List<ReservationVO> selectResByDate(String res_start) throws Exception{
    	return mdao.selectResByDate(res_start);
    }
    
    //이번달 예약 목록
    public List<ReservationVO> selectResByMonth(String res_start) throws Exception{
    	return mdao.selectResByMonth(res_start);
    }
    
    //올해 예약 목록
    public List<ReservationVO> selectResByYear(String res_start) throws Exception{
    	return mdao.selectResByYear(res_start);
    }
	
}
