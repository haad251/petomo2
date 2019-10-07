package com.ejo.petwalk.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ejo.petwalk.service.ManagerService;
import com.ejo.petwalk.service.MemberService;
import com.ejo.petwalk.service.ReservationService;
import com.ejo.petwalk.service.SitterService;
import com.ejo.petwalk.vo.ReservationVO;
import com.ejo.petwalk.vo.ServiceVO;
import com.ejo.petwalk.vo.SitterVO;

@Controller
public class SiteController {
	
	@Autowired
	SitterService ssv;
	@Autowired
	MemberService msv;
	@Autowired
	ReservationService rsv;
	@Autowired
	ManagerService masv;
	
	
	@RequestMapping(value="/")
	public String home() {	
		return "home";
	}
	
	@RequestMapping(value="/introducePetomo")
	public void introducePetomo(){ 
	}
	
	@RequestMapping(value="/login")
	public void login(){ 
	}
	
	@RequestMapping(value="/searchBar")
	public void searchBar(){ 
	}

	@RequestMapping(value="/signupMember")
	public void signupMember(){ 
	}
	
	@RequestMapping(value="/signupChoose")
	public void signupChoose(Model model){ 
	int member = msv.selectAllMember().size();
	int sitter = ssv.selectAllSitter().size();
	model.addAttribute("memberNumber", member);
	model.addAttribute("sitterNumber", sitter);
	}
	
	@RequestMapping(value="/signupSitter")
	public void signupSitter(){ 
	}
	
	@RequestMapping(value="/notification")
	public void notification(){ 
	}
	
	
	
//	manager
	@RequestMapping(value="/managerMyPage")
	public String managerMyPage(){ 
		return "manager/managerMyPage";
	}
	
	@RequestMapping(value="/manageService")
	public String managerService(){ 
		return "manager/manageService";
	}
	
	@RequestMapping(value="/registerService")
	public String registerService(){
		return "manager/registerService";
	}
	
	@RequestMapping(value="/userMapTesting")
	public String userMapTesting(){
		return "userMapTesting";
	}
	
	/*
	 * @RequestMapping(value="/serviceDetail") 
	 * public String serviceDetail(String service_id, Model model) throws Exception{ ServiceVO result =
	 * masv.selectOneService(service_id); System.out.println("현재 선택된 서비스"+result);
	 * model.addAttribute("service", result); return "manager/serviceDetail"; }
	 */
	
	@RequestMapping(value="/managePetSitter")
	public String managePetSitter(){
		return "manager/managePetSitter";
	}
	
	
//	member

	
	@RequestMapping(value="/memberInfo", method=RequestMethod.GET)
	public String memberInfo(){ 
		return "member/memberInfo";
	}
	

	@RequestMapping(value="/memberProfile")
	public String memberProfile(Model model,HttpSession session){ 
	List<HashMap<String,String>> rList = rsv.selectResAllByMb_id((String)session.getAttribute("sessionId"));
	model.addAttribute("resNumber",rList.size());
	return "member/memberProfile";
	}
	
	@RequestMapping(value="/updateCheck")
	public String updateCheck(){ 
		return"member/updateCheck";
	}
	@RequestMapping(value="/memberResList")
	public String memberResList(HttpSession session,Model model){
		List<HashMap<String,String>> rList = rsv.selectResAllByMb_id((String)session.getAttribute("sessionId"));
		System.out.println(rList);
		model.addAttribute("rList",rList);
		return"member/memberResList";
	}
	
	@RequestMapping(value="/signupPet")
	public String signupPet(){
		return"member/signupPet";
	}
	@RequestMapping(value="/sitterMemberCheck")
	public String sitterMemberChecks(String mb_id,HttpSession session,Model model){ 
	List<HashMap<String,String>> rList = rsv.selectResAllByMb_id(mb_id);
	model.addAttribute("resNumber",rList.size());
	model.addAttribute("mb_id", mb_id);
	return "sitter/sitterMemberCheck";
	}

	//	res
	
	@RequestMapping(value="/selectAllSitter")
	public String selectAllSitter(){ 
		return "res/selectAllSitter";
	}
	
	@RequestMapping(value="/sitterDetail")
	public String sitterDetail(SitterVO st_id, Model model){ 
		model.addAttribute("sitter", ssv.selectOneSitter(st_id.getSt_id()));
		return "res/sitterDetail";
	}
	 
	@RequestMapping(value="/sitterList")
	public String sitterList(Model model){ 
		List<SitterVO> result = ssv.selectAllSitter();
		model.addAttribute("result", result);
		return "res/sitterList";
	}
	
	@RequestMapping(value="/sitterMapTest")
	public String siterMapTest(){ 
		return "sitter/sitterMapTest";
	}
	
	@RequestMapping(value = "/selectAllSitterByLoc",method=RequestMethod.GET)
	public String selectAllSitterByLoc(Model model,String st_loc1) {
		List<SitterVO> result = ssv.selectAllSitterByLoc(st_loc1);
		model.addAttribute("result", result);
		model.addAttribute("st_loc1",st_loc1);
		return  "res/sitterList";
	}

	@RequestMapping(value="/complete", method=RequestMethod.GET) 
	  public String complete(ReservationVO res, ServiceVO sv, SitterVO svo,HttpSession session, Model model) throws Exception{ 
		  rsv.insertReservation(res);
		  String mb_id = (String)session.getAttribute("sessionId");
			model.addAttribute("rList",rsv.selectResByMb_id(mb_id));
			System.out.println(rsv.selectResByMb_id(mb_id).get(0));
		  return "res/complete";
	  
	  }
//sitter
	@RequestMapping(value="/sitterChartPage")
	public String sitterChartPage(){ 
		return "sitter/sitterChartPage";
	}
}
