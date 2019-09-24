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
	

	/*------Service CRUD관련 Controller------*/
	
	// 신규 Service 등록
	@RequestMapping(value="/insertNewService",method=RequestMethod.POST)
	public String insertNewService(ServiceVO service) {
		System.out.println(service);
		int result = 0;
		try {
			result = mservice.insertNewService(service);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result == 0) //값이 제대로 등록 안됐으면 계속 등록 페이지에
			return "registerService";
		return "manageService";
	}
	
	//Service 전체목록 가져오기
	@RequestMapping(value = "/selectAllService", method = RequestMethod.POST)
	public @ResponseBody ArrayList<ServiceVO> selectAllService() throws Exception {
		ArrayList<ServiceVO> result = mservice.selectAllService();
		System.out.println(result);
		return result;
	}
	
	//하나의 Service 서비스 삭제(Ajax)
	@RequestMapping(value = "/deleteOneService", method = RequestMethod.POST)
	public @ResponseBody String boardDetail(String service_id) throws Exception {
		int result = 0 ;
		result = mservice.deleteOneService(service_id);
		if(result == 1)
			return "ok";
		else
			return "no";
	}
	
	// Service 상세 페이지 보기
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
	
	
	//Service id를 이용해 service를 셀렉트 해 온 다음 정보 수정 페이지로 이동
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
	
	//Service 정보 수정
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
