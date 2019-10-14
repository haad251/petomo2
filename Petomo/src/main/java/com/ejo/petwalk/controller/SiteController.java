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
	
	@RequestMapping(value="/managePetSitter")
	public String managePetSitter(){
		return "manager/managePetSitter";
	}
	
	
	
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

	@RequestMapping(value="/selectAllSitter")
	public String selectAllSitter(){ 
		return "res/selectAllSitter";
	}
	
	@RequestMapping(value="/sitterDetail")
	public String sitterDetail(SitterVO st_id, Model model){
		List<HashMap<String, String>> rList = rsv.selectResAllBySt_id(st_id.getSt_id());
		model.addAttribute("sitter", ssv.selectOneSitter(st_id.getSt_id()));
		model.addAttribute("rList",rList);
		model.addAttribute("rCount",rList.size());
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

	@RequestMapping(value="/sitterChartPage")
	public String sitterChartPage(){ 
		return "sitter/sitterChartPage";
	}
}
