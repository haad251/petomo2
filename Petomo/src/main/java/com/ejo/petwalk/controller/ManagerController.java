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
import com.ejo.petwalk.vo.ReservationAddrVO;
import com.ejo.petwalk.vo.ReservationVO;
import com.ejo.petwalk.vo.ServiceVO;
import com.ejo.petwalk.vo.SitterVO;

@Controller
public class ManagerController {
	
	@Autowired
	ManagerService mservice;
	
	@Autowired
	SitterService sservice;
	
	/* KMJ - Service에 관련된 메소드 */

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
			return "manager/registerService";
		return "manager/manageService";
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
		return "manager/serviceDetail";
	}
	
	@RequestMapping(value="/selectAllResBySerId", method=RequestMethod.POST)
	public @ResponseBody List<ReservationVO> selectAllResBySerId(String service_id) throws Exception{
		List<ReservationVO> allres = mservice.selectAllResBySerId(service_id);
		return allres;
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
		return "manager/registerService";
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
			return "manager/registerService";
		else
			return "manager/manageService";
	}
	
	
	/* KMJ - Pet Sitter에 관련된 메소드 */
	
	//모든 시터 목록 불러오기
	@RequestMapping(value = "/selectAllSitter", method = RequestMethod.POST)
	public @ResponseBody List<SitterVO> selectAllSitter() throws Exception {
		List<SitterVO> result = sservice.selectAllSitter();
		System.out.println(result);
		return result;
	}
	
	//최근 등록된 5명의 시터 목록만 불러오기
	@RequestMapping(value = "/selectNewSitterList", method = RequestMethod.POST)
	public @ResponseBody ArrayList<SitterVO> selectNewSitterList() throws Exception {
		ArrayList<SitterVO> newSitterList = new ArrayList <>();
		List<SitterVO> result = sservice.selectAllSitter();
		Collections.reverse(result); //저장된 순서대로 가져온 Sitter 리스트 역순으로 바꾸기 
		for(int i = 0 ; i < 5 ; i++) {
			newSitterList.add(result.get(i));
		}
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
		return result;
	}
	
	
	/* KMJ - 최근 예약과 지역별 매출 금액관련한 메소드*/
	
	//최근에 등록된 5개 예약만을 가져오기
	@RequestMapping(value = "/selectNewResList", method = RequestMethod.POST)
	public @ResponseBody ArrayList<ReservationVO> selectNewResList() throws Exception {
		ArrayList<ReservationVO> newResList = new ArrayList <>();
		List<ReservationVO> result = mservice.selectAllRes();
		Collections.reverse(result); //저장된 순서대로 가져온 예약 리스트 역순으로 바꾸기 
		System.out.println(result);
		for(int i = 0 ; i < result.size() ; i++) { //오류가 나는데 아마 예약 수가 5개 이하라서 그런 것 같음
			if(i==5)
				break;
			newResList.add(result.get(i));
		}
		return newResList;
	}
	
	//서비스 이용이 끝난 예약의 전체 매출 액수
	@RequestMapping(value = "/selectAllResByComStatus", method = RequestMethod.POST)
	public @ResponseBody int selectAllResByComStatus() throws Exception {
		int allAmount = 0;
		List<ReservationVO> result = mservice.selectAllRes(); // 모든 예약 리스트 가져옴
		for(int i = 0 ; i < result.size() ; i++) {
			if(result.get(i).getRes_status().equals("利用済み"))
				allAmount += Integer.parseInt(result.get(i).getRes_amount());
		}
		return allAmount;
	}
	
	
	//오늘(서버 날짜)의 매출 액수
	@RequestMapping(value = "/selectResByDate", method = RequestMethod.POST)
	public @ResponseBody int selectResByDate(String res_start) throws Exception {
		System.out.println(res_start);
		int allAmount = 0;
		List<ReservationVO> result = mservice.selectResByDate(res_start); //오늘의 예약 리스트를 가져옴
		for(int i = 0 ; i < result.size() ; i++) {
			if(result.get(i).getRes_status().equals("利用済み"))
				allAmount += Integer.parseInt(result.get(i).getRes_amount());
		}	
		return allAmount;
	}

	//이달의(서버 날짜) 매출 액수
	@RequestMapping(value = "/selectResByMonth", method = RequestMethod.POST)
	public @ResponseBody int selectResByMonth(String res_start) throws Exception {
		int allAmount = 0;
		List<ReservationVO> result = mservice.selectResByMonth(res_start); //이번달의 예약 리스트를 가져옴
		for(int i = 0 ; i < result.size() ; i++) {
			if(result.get(i).getRes_status().equals("利用済み"))
				allAmount += Integer.parseInt(result.get(i).getRes_amount());
		}	
		return allAmount;
	}
	
	// 올해(서버 날짜)의 매출 액수
	@RequestMapping(value = "selectResByYear", method = RequestMethod.POST)
	public @ResponseBody int selectResByYear(String res_start) throws Exception{
		int allAmount = 0;
		List<ReservationVO> result = mservice.selectResByYear(res_start); //올해의 예약 리스트를 가져옴
		for(int i = 0 ; i < result.size() ; i++) {
			if(result.get(i).getRes_status().equals("利用済み"))
				allAmount += Integer.parseInt(result.get(i).getRes_amount());
		}	
		return allAmount;
	}
	
	//그 해(chart에서 선택한 연도)의 예약 수, 예약 취소 수, 서비스 이용 완료된 예약 수
	@RequestMapping(value="/thisYearResCount", method=RequestMethod.POST)
	public @ResponseBody int[] thisYearResCount(String res_start) throws Exception{
		System.out.println(res_start);
		int [] ResCountArray = new int[3]; 
		//index 0 => 그 해 저체 예약 수 
		//index 1 =>그 해 전체 예약 취소 수
		//index 2 => 그 해 전체 서비스 이용 완료된 예약 수
		List<ReservationVO> result = mservice.selectResByYear(res_start); // 선택된 그 해의 예약 리스트를 가져옴
		for(int i = 0 ; i < result.size() ; i++) {
			ResCountArray[0]++;
			if(result.get(i).getRes_status().equals("キャンセル"))
				ResCountArray[1]++;
			if(result.get(i).getRes_status().equals("利用済み"))
				ResCountArray[2]++;
		}
		System.out.println("전체 예약 수="+ResCountArray[0]+"캔슬 수="+ResCountArray[1]+"완료 수="+ResCountArray[2]);
		return ResCountArray;
	}
	
	//차트에서 연도를 선택할 때마다 보일 데이터 배열을 담는 함수
	@RequestMapping(value = "selectResBySelectedYear", method = RequestMethod.POST)
	public @ResponseBody int[] selectResBySelectedYear(String res_start) throws Exception{
		
		int[] resMonthCountData = new int[12]; //각 월별 예약 수(전체 예약 수 - 취소된 예약 수)를 담기 위한 배열
		List<ReservationVO> result = mservice.selectResByYear(res_start); //선택한 해의 예약 리스트를 가져옴
		
		for(int i = 0 ; i < result.size() ; i++) {
			String eachResDate = result.get(i).getRes_start();
			String[] eachResMonthDate = eachResDate.split("-");
			String eachResMonth= eachResMonthDate[1]; //예약마다 '월'을 구함			
			if (!result.get(i).getRes_status().equals("キャンセル")) {
				resMonthCountData[Integer.parseInt(eachResMonth)-1]++;
			}
		}
		System.out.println(resMonthCountData[9]);
		return resMonthCountData;
	}
	
	// 일본 지도에 선택한 지역의 예약 데이터 전체를 가져오는 함수
	@RequestMapping(value = "selectResFromAddr", method = RequestMethod.POST)
	public @ResponseBody List<ReservationAddrVO> selectResFromAddr(String address) throws Exception {
		List<ReservationAddrVO> resultList = mservice.selectMemberFromRes(address);
		return resultList;
	}
	
	
	/*
	@RequestMapping(value="", method = RequestMethod.POST)
	public @ResponseBody int  selectResCountFromAddr()  throws Exception{
		int result = 0;
		
		return result; 
	}*/
}
