package com.ejo.petwalk.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ejo.petwalk.service.ManagerService;
import com.ejo.petwalk.vo.ServiceVO;

@Controller
public class ManagerController {
	
	@Autowired
	ManagerService mservice;
	

	/*------Service CRUD���� Controller------*/
	
	// �ű� Service ���
	@RequestMapping(value="/insertNewService",method=RequestMethod.POST)
	public String insertNewService(ServiceVO service) {
		System.out.println(service);
		int result = 0;
		try {
			result = mservice.insertNewService(service);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result == 0) //���� ����� ��� �ȵ����� ��� ��� ��������
			return "registerService";
		return "manageService";
	}
	
	//Service ��ü��� ��������
	@RequestMapping(value = "/selectAllService", method = RequestMethod.POST)
	public @ResponseBody ArrayList<ServiceVO> selectAllService() throws Exception {
		ArrayList<ServiceVO> result = mservice.selectAllService();
		System.out.println(result);
		return result;
	}
	
	//�ϳ��� Service ���� ����(Ajax)
	@RequestMapping(value = "/deleteOneService", method = RequestMethod.POST)
	public @ResponseBody String boardDetail(String service_id) throws Exception {
		int result = 0 ;
		result = mservice.deleteOneService(service_id);
		if(result == 1)
			return "ok";
		else
			return "no";
	}
	
	// Service �� ������ ����
	@RequestMapping(value = "/serviceDetail", method = RequestMethod.GET)
	public String serviceDetail(String service_id, Model model) {
		System.out.println(service_id);
		try {
			ServiceVO result = mservice.selectOneService(service_id);
			System.out.println(result);
			model.addAttribute("service",result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "serviceDetail";
	}
	
	
	//Service id�� �̿��� service�� ����Ʈ �� �� ���� ���� ���� �������� �̵�
	@RequestMapping(value = "/modifyService", method = RequestMethod.GET)
	public String modifyService(String service_id, Model model) {
		System.out.println(service_id);
		try {
			ServiceVO result = mservice.selectOneService(service_id);
			System.out.println(result);
			model.addAttribute("service",result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "registerService";
	}
	
	//Service ���� ����
	@RequestMapping(value = "/updateService", method = RequestMethod.POST)
	public String updateService(ServiceVO service) {
		System.out.println(service);
		int result = 0;
		try {
			result = mservice.updateService(service);
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result==0)
			return "registerService";
		else
			return "manageService";
	}

}
