package com.ejo.petwalk.dao;

import java.util.ArrayList;

import com.ejo.petwalk.vo.ServiceVO;

public interface ManagerMapper {
	
	/*서비스 CRUD관련 Mapper*/
	public int insertNewService(ServiceVO service) throws Exception;
	public ArrayList<ServiceVO> selectAllService() throws Exception;
	public ServiceVO selectOneService(String service_id) throws Exception;
	public int deleteOneService(String service_id) throws Exception;
	public int updateService(ServiceVO service) throws Exception;
	
	
}
