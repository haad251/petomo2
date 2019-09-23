package com.ejo.petwalk.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ejo.petwalk.dao.ManagerMapper;
import com.ejo.petwalk.vo.ServiceVO;


@Service
public class ManagerService {
	
	@Autowired
	ManagerMapper mdao;
	
	/* ���� CRUD ���� �޼��� */
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
	
}
