package com.ejo.petwalk.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ejo.petwalk.service.ManagerService;
import com.ejo.petwalk.service.SitterService;
import com.ejo.petwalk.vo.ServiceVO;
import com.ejo.petwalk.vo.SitterVO;

@Controller
public class ManagerController {
	
	@Autowired
	ManagerService mservice;
	
	@Autowired
	SitterService sservice;

	@RequestMapping(value="/insertNewService",method=RequestMethod.POST)
	public String insertNewService(ServiceVO service) {
		System.out.println(service);
		int result = 0;
		try {
			result = mservice.insertNewService(service);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result == 0)
			return "registerService";
		return "manageService";
	}
	
	@RequestMapping(value = "/selectAllService", method = RequestMethod.POST)
	public @ResponseBody ArrayList<ServiceVO> selectAllService() throws Exception {
		ArrayList<ServiceVO> result = mservice.selectAllService();
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value = "/deleteOneService", method = RequestMethod.POST)
	public @ResponseBody String boardDetail(String service_id) throws Exception {
		int result = 0 ;
		result = mservice.deleteOneService(service_id);
		if(result == 1)
			return "ok";
		else
			return "no";
	}
	
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
	
	
	/* MJ - Pet Sitter에 관련된 메소드 */
	
	//모든 시터 목록 불러오기
	@RequestMapping(value = "/selectAllSitter", method = RequestMethod.POST)
	public @ResponseBody List<SitterVO> selectAllSitter() throws Exception {
		List<SitterVO> result = sservice.selectAllSitter();
		System.out.println(result);
		return result;
	}
	
	//최근 등록된 5명의 시터 목록만 불러오기
	@RequestMapping(value = "/selectNewSitterList", method = RequestMethod.POST)
	public @ResponseBody List<SitterVO> selectNewSitterList() throws Exception {
		ArrayList<SitterVO> newSitterList = new ArrayList <>();
		List<SitterVO> result = sservice.selectAllSitter();
		Collections.reverse(result); //저장된 순서대로 가져온 Sitter 리스트 역순으로 바꾸기 
		for(int i = 0 ; i < 5 ; i++) {
			newSitterList.add(result.get(i));
		}
		System.out.println(newSitterList);
		return newSitterList;
	}
	
	//시터의 활동 여부 상태 업데이트
	@RequestMapping(value = "/updateSitterCheck", method = RequestMethod.POST)
	public @ResponseBody String updateSitterCheck(SitterVO sitter) throws Exception {
		System.out.println(sitter);
		int result = 0;
		result = sservice.updateSitterCheck(sitter);
		if(result == 1)
			return "ok";
		else
			return "fail";
	}
	
	//하나의 시터 불러와서 상세 보기
	@RequestMapping(value = "/selectOneSitter", method = RequestMethod.POST)
	public @ResponseBody SitterVO selectOneSitter(String st_id) throws Exception {
		SitterVO result = sservice.selectOneSitter(st_id);
		System.out.println(result);
		return result;
	}

}
