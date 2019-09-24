package com.ejo.petwalk.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ejo.petwalk.service.SitterService;
import com.ejo.petwalk.vo.SitterVO;

@Controller
public class SiteController {
	
	@Autowired
	SitterService ssv;
	
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
	public void managerMyPage(){ 
	}
	
	@RequestMapping(value="/managerService")
	public void managerService(){ 
	}
	
	@RequestMapping(value="/registerService")
	public void registerService(){ 
	}
	
	@RequestMapping(value="/serviceDetail")
	public void serviceDetail(){ 
	}
	
	
	
//	member
	
	@RequestMapping(value="/memberInfo")
	public void memberInfo(){ 
	}

	@RequestMapping(value="/memberProfile")
	public void memberProfile(){ 
	}
	
	@RequestMapping(value="/updateCheck")
	public String updateCheck(){ 
		return"member/updateCheck";
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
		
	@RequestMapping(value="/streamingService")
	public String streamingService(){ 
	return"res/streamingService";
	}
	
	
//	sitter
	@RequestMapping(value="/sitterInfoModi")
	public String sitterInfoModi(SitterVO sitter,HttpSession session,Model model){ 
		sitter = ssv.selectOneSitter((String)session.getAttribute("loginId"));
		model.addAttribute("sitter",sitter);
		return "sitter/sitterInfoModi";
	}		
	
	@RequestMapping(value="/sitterResList")
	public String sitterResList(){ 
		return "siter/sitterResList";
	}
	
}
