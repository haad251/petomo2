package com.ejo.petwalk.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ejo.petwalk.service.AwsS3Service;
import com.ejo.petwalk.service.ReservationService;
import com.ejo.petwalk.service.SitterService;
import com.ejo.petwalk.vo.FileVO;
import com.ejo.petwalk.vo.ReservationVO;
import com.ejo.petwalk.vo.SitterVO;

@Controller
public class SitterController {

	@Autowired
	SitterService ssv;

	@Autowired
	AwsS3Service aws3sv;
	
	@Autowired
	ReservationService rsv;
	
	//간이 로그인용
	@RequestMapping(value="/sitterLoginTest", method=RequestMethod.GET)
	public String sitterLoginTest(SitterVO sitter,HttpSession session){ 
		SitterVO result = null;
		sitter.setSt_pw("st1");
		sitter.setSt_id("st1");
		try {
			result = ssv.loginSitter(sitter);
		} catch (Exception e) {
		}
		session.setAttribute("sessionId",result.getSt_id());
		session.setAttribute("sessionSitter","on");
		return "home";
	}
	
	@RequestMapping(value="/loginSitter", method=RequestMethod.POST)
	public String loginSitter(SitterVO sitter,HttpSession session){ 
		SitterVO result = ssv.loginSitter(sitter);
		session.setAttribute("sessionId",result.getSt_id());
		session.setAttribute("sessionName", result.getSt_name());
		session.setAttribute("sessionSitter","on");

		FileVO file = ssv.selectSitterProfileImg(sitter);
		if(file==null) 	
			session.setAttribute("sessionProfileImg", "defaultImage.png");
		else
			session.setAttribute("sessionProfileImg", file.getFile_sav());
		return "home";
	}
	
	
	@RequestMapping(value = "/sitterSignup" , method = RequestMethod.POST)
	public String sitterSignup (HttpSession session,Model model,SitterVO sitter) throws Exception{
		System.out.println(sitter);
		int result = ssv.insertSitter(sitter);
		if(result == 1) {
			session.setAttribute("sessionId", sitter.getSt_id());
		}
		return "home";
	}
	
	@RequestMapping(value="/updateSitter", method=RequestMethod.POST)
	public String updateSitter(SitterVO sitter) throws IOException{ 
			ssv.updateSitter(sitter);
		return "redirect:/sitterInfoModi";
	}
	
	
	@RequestMapping(value="/sitterInfoModi")
	public String sitterInfoModi(SitterVO sitter,HttpSession session,Model model){ 
		sitter = ssv.selectOneSitter((String)session.getAttribute("sessionId"));
		model.addAttribute("sitter",sitter);
		return "sitter/sitterInfoModi";
	}		
	
	
	@RequestMapping(value = "/sitterResList")
	public String sitterResList (HttpSession session,Model model){
		 List<HashMap<String,String>> rList = rsv.selectResAllBySt_id((String)session.getAttribute("sessionId"));
		System.out.println(rList);
		model.addAttribute("rList",rList);
		return "sitter/sitterResList";
	}
	
	@RequestMapping(value = "/deleteSitterImage")
	public String deleteSitterImage (HttpSession session){
		String sessionP = (String)session.getAttribute("sessionProfileImg");
		String st_id = (String)session.getAttribute("sessionId");
		
		if(sessionP.equals("defaultImage.png")) 
			return "redirect:/sitterInfoModi";
		SitterVO sitter = new SitterVO();
		sitter.setSt_id(st_id);
		aws3sv.deleteObject("sitter", sessionP);
		ssv.deleteSitterImage(sitter);
		session.setAttribute("sessionProfileImg", "defaultImage.png");
		return "redirect:/sitterInfoModi";
	}
	
	@RequestMapping(value = "/insertSitterImage", method=RequestMethod.POST)
	public String insertSitterImage (MultipartFile uploadfile,HttpSession session,Model model){
		if (!(uploadfile.isEmpty() || uploadfile == null || uploadfile.getSize() == 0)) {
			
			String sessionP = (String)session.getAttribute("sessionProfileImg");
			String st_id = (String)session.getAttribute("sessionId");
			
			if(sessionP!=null && !sessionP.equals("defaultImage.png")) {
				SitterVO sitter = new SitterVO();
				sitter.setSt_id(st_id);
				aws3sv.deleteObject("sitter", sessionP);
				ssv.deleteSitterImage(sitter);
			}
			
			String file_org = uploadfile.getOriginalFilename();
			String file_sav = st_id+".png";
			FileVO sitterFile = new FileVO(file_sav,file_org,"sitter",st_id); 
			ssv.insertSitterImage(sitterFile);
			aws3sv.uploadObject(uploadfile, "sitter/"+file_sav);
			session.setAttribute("sessionProfileImg", file_sav);
		}
		return "redirect:/sitterInfoModi";
	}
	
	@RequestMapping(value="/confirmReservation",method=RequestMethod.POST)
	public String confirmReservation(ReservationVO res) {
		res.setRes_status("予約完了");
		rsv.updateResStatus(res);
		return "redirect:/sitterResList";
	}
	
	@RequestMapping(value="/cancelReservation",method=RequestMethod.POST)
	public String cancelReservation(ReservationVO res) {
		res.setRes_status("キャンセル");
		rsv.updateResStatus(res);
		return "redirect:/sitterResList";
	}
	
	@RequestMapping(value = "/duplsitterchck", method = RequestMethod.POST)
	public @ResponseBody SitterVO duplcheck(SitterVO sitter,Model model){
		SitterVO result = ssv.duplcheck(sitter);
		return result;
	}
	
	//KMJ-[Sitter] 통계용 메서드 모음
	
	//Sitter 아이디로 최근에 등록된 5개의 예약만 가져옴
	@RequestMapping(value="/selectResBySitterId",method=RequestMethod.POST)
	public @ResponseBody ArrayList<ReservationVO> selectResBySitterId(String st_id) {
		ArrayList<ReservationVO> newResList = new ArrayList <>();
		List<ReservationVO> result = ssv.selectResBySitterId(st_id);
		Collections.reverse(result);
		for(int i = 0 ; i < result.size() ; i++) {
			if(i==5)
				break;
			newResList.add(result.get(i));
		}
		return newResList;
	}
	
	//Sitter아이디 최근에 등록된 리뷰 5개를 가져옴
	@RequestMapping(value="/selectNewReviewList",method=RequestMethod.POST)
	public @ResponseBody ArrayList<ReservationVO> selectNewReviewList(String st_id) {
		ArrayList<ReservationVO> newReviewList = new ArrayList <>();
		List<ReservationVO> result = ssv.selectResBySitterId(st_id);
		Collections.reverse(result);
		for(int i = 0 ; i < result.size() ; i++) {
			if(result.get(i).getRes_review()!= null)
				newReviewList.add(result.get(i));
		}
		return newReviewList;
	}
	
	//Sitter아이디로 이용 완료된 예약의 수익금 계산
	@RequestMapping(value="/selectAllResComStatusBySitterId",method=RequestMethod.POST)
	public @ResponseBody int selectAllResComStatusBySitterId(String st_id) {
		int allAmount = 0;
		List<ReservationVO> result = ssv.selectResBySitterId(st_id); // 모든 예약 리스트 가져옴
		for(int i = 0 ; i < result.size() ; i++) {
			if(result.get(i).getRes_status().equals("利用済み"))
				allAmount += Integer.parseInt(result.get(i).getRes_amount());
		}
		return allAmount;
	}
	
	// SitterId  + 오늘(서버 날짜)의 매출 액수
	@RequestMapping(value = "/selectResByDateAndSitterId", method = RequestMethod.POST)
	public @ResponseBody int selectResByDateAndSitterId(String res_start, String st_id){
		int allAmount = 0;
		List<ReservationVO> result = ssv.selectDateFormatResBySitterId(st_id); //오늘의 예약 리스트를 가져옴
		for(int i = 0 ; i < result.size() ; i++) {
			String eachResDate = result.get(i).getRes_start();
			if(eachResDate.equals(res_start) && result.get(i).getRes_status().equals("利用済み"))
				allAmount += Integer.parseInt(result.get(i).getRes_amount());
		}
		return allAmount;
	}
	
	// SitterId + 올해 (서버 날짜)의 매출 액수
	@RequestMapping(value = "/selectResByYearAndSitterId", method = RequestMethod.POST)
	public @ResponseBody int selectResByYearAndSitterId(String res_start, String st_id){
		int allAmount = 0;
		List<ReservationVO> result = ssv.selectDateFormatResBySitterId(st_id); //오늘의 예약 리스트를 가져옴
		for(int i = 0 ; i < result.size() ; i++) {
			String eachResDate = result.get(i).getRes_start();
			String eachResYear = eachResDate.substring(0, 4);
			if(eachResYear.equals(res_start) && result.get(i).getRes_status().equals("利用済み"))
				allAmount += Integer.parseInt(result.get(i).getRes_amount());
		}
		return allAmount;
	}
	
	// SitterId + 이번 달(서버 날짜)의 매출 액수
	@RequestMapping(value = "/selectResByMonthAndSitterId", method = RequestMethod.POST)
	public @ResponseBody int selectResByMonthAndSitterId(String res_start, String st_id){
		int allAmount = 0;
		List<ReservationVO> result = ssv.selectDateFormatResBySitterId(st_id); //오늘의 예약 리스트를 가져옴
		for(int i = 0 ; i < result.size() ; i++) {
			String eachResDate = result.get(i).getRes_start();
			String eachResMonth = eachResDate.substring(0, 7);
			if(eachResMonth.equals(res_start) && result.get(i).getRes_status().equals("利用済み"))
				allAmount += Integer.parseInt(result.get(i).getRes_amount());
		}
		return allAmount;
	}
	
	//그 해(chart에서 선택한 연도)의 예약 수, 예약 취소 수, 서비스 이용 완료된 예약 수
	@RequestMapping(value="/thisYearResCountForSitter", method=RequestMethod.POST)
	public @ResponseBody int[] thisYearResCountForSitter(String st_id,String res_start){
		System.out.println(res_start);
		int [] ResCountArray = new int[3]; 
		//index 0 => 그 해 저체 예약 수 
		//index 1 =>그 해 전체 예약 취소 수
		//index 2 => 그 해 전체 서비스 이용 완료된 예약 수
		List<ReservationVO> result = ssv.selectResBySitterId(st_id); // 선택된 그 해의 예약 리스트를 가져옴
		for(int i = 0 ; i < result.size() ; i++) {
			String eachResDate = result.get(i).getRes_start();
			String eachResYear = eachResDate.substring(0, 4);
			if(eachResYear.equals(res_start))
				ResCountArray[0]++;
			if(eachResYear.equals(res_start) && result.get(i).getRes_status().equals("キャンセル"))
				ResCountArray[1]++;
			if(eachResYear.equals(res_start) && result.get(i).getRes_status().equals("利用済み"))
				ResCountArray[2]++;
		}
		System.out.println("전체 예약 수="+ResCountArray[0]+"캔슬 수="+ResCountArray[1]+"완료 수="+ResCountArray[2]);
		return ResCountArray;
	}
	
	//차트에서 연도를 선택할 때마다 보일 데이터 배열을 담는 함수
	@RequestMapping(value = "selectResBySelectedYearForSitter", method = RequestMethod.POST)
	public @ResponseBody int[] selectResBySelectedYearForSitter(String st_id, String res_start){
			
		int[] resMonthCountData = new int[12]; //각 월별 예약 수(전체 예약 수 - 취소된 예약 수)를 담기 위한 배열
		List<ReservationVO> result = ssv.selectDateFormatResBySitterId(st_id); //접속한 시터의 모든 예약 리스트를 날짜 형식에 맞게 가져옴
		ArrayList<ReservationVO> thisYearResult = new ArrayList <>();
		
		for(int i = 0 ; i < result.size() ; i++) {
			String eachResDataFromResult = result.get(i).getRes_start();
			String eachResYearDataFromResult = eachResDataFromResult.substring(0, 4);
			if(eachResYearDataFromResult.equals(res_start))
				thisYearResult.add(result.get(i));
		}
		
		for(int i = 0 ; i < thisYearResult.size() ; i++) {
			String eachResDate = thisYearResult.get(i).getRes_start();
			String[] eachResMonthDate = eachResDate.split("-");
			String eachResMonth= eachResMonthDate[1]; //예약마다 '월'을 구함			
			if (!thisYearResult.get(i).getRes_status().equals("キャンセル")) {
				resMonthCountData[Integer.parseInt(eachResMonth)-1]++;
			}
		}
		
		for(int i = 0 ; i < resMonthCountData.length ; i++) {
			System.out.println(resMonthCountData[i]);
		}
		return resMonthCountData;
	}
}
