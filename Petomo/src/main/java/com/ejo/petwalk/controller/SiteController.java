package com.ejo.petwalk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ejo.petwalk.service.MemberService;
import com.ejo.petwalk.service.SitterService;
import com.ejo.petwalk.vo.SitterVO;

@Controller
public class SiteController {
	
	@Autowired
	SitterService ssv;
	
	@Autowired
	MemberService msv;
	
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
	public void signupChoose(){ 
	}
	
	@RequestMapping(value="/signupSitter")
	public void signupSitter(){ 
	}
	
	
//	manager
	@RequestMapping(value="/managerMyPage")
	public String managerMyPage(){ 
		return "manager/managerMyPage";
	}
	
	@RequestMapping(value="/managerService")
	public String managerService(){ 
		return "manager/managerMyPage";
	}
	
	@RequestMapping(value="/registerService")
	public String registerService(){
		return "manager/registerService";
	}
	
	@RequestMapping(value="/serviceDetail")
	public String serviceDetail(){ 
		return "manager/serviceDetail";
	}
	
	
//	member
	@RequestMapping(value="/memberInfo")
	public String memberInfo(){ 
	return"member/memberInfo";}
	

	@RequestMapping(value="/memberProfile")
	public String memberProfile(){ 
	return "member/memberProfile";
	}
	
	@RequestMapping(value="/updateCheck")
	public String updateCheck(){ 
		return"member/updateCheck";
	}
	@RequestMapping(value="/memberResList")
	public String memberResList(){
		return"member/memberResList";
	}
	
	@RequestMapping(value="/signupPet")
	public String signupPet(){
		return"member/signupPet";
	}
	
	
	
//	res
	@RequestMapping(value="/reservation")
	public String reservation(){ 
		return "res/reservation";
	}
	
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
	
	
	
}
