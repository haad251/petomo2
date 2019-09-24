package com.ejo.petwalk.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ejo.petwalk.service.MemberService;
import com.ejo.petwalk.service.SitterService;
import com.ejo.petwalk.vo.MemberVO;
 

@Controller
public class MemberController {
	
	@Autowired
	MemberService msv;
	@Autowired
	SitterService ssv;
	
	
	@RequestMapping(value="/memberLogin", method=RequestMethod.GET)
	public String memberLogin(MemberVO member,HttpSession session){ 
		member.setMb_id("mb1");
		member.setMb_pw("mb1");
		MemberVO result = null;
		try {
			result = msv.selectMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.setAttribute("loginId",result.getMb_id());
		return "home";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session){ 
		session.invalidate();
		return "home";
	}
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String gologin(HttpSession session,Model model){ 
		return "login";
	}
	@RequestMapping(value="/gosignup", method=RequestMethod.GET)
	public String gosignup(HttpSession session,Model model){ 
		return "signupChoose";
	}
	@RequestMapping(value="/loginMember", method=RequestMethod.POST)
	public String loginuser(HttpSession session,Model model, MemberVO member){ 
		MemberVO result = msv.login(member);
		session.setAttribute("sessionId", result.getMb_id());
		session.setAttribute("sessionName", result.getMb_name());
		return "redirect:/";
	}
	@RequestMapping(value="/updatecheck", method=RequestMethod.GET)
	public String updatecheck(HttpSession session,Model model){ 
		return "updateCheck";
	}
	@RequestMapping(value="/gosetting", method=RequestMethod.GET)
	public String gosetting(HttpSession session,Model model){ 
		return "customerInfo";
	}
	@RequestMapping(value="/singupmember", method=RequestMethod.GET)
	public String singupmember(HttpSession session,Model model){ 
		return "signup";
	}
	@RequestMapping(value = "/memberSignup" , method = RequestMethod.POST)
	public String memberSignup (HttpSession session,Model model,MemberVO member)
	{
		int result = msv.signup(member);
		if(result == 1) {
			session.setAttribute("loginid", member.getMb_id());
		}
		return "home";
	}
	@RequestMapping(value = "/duplchck", method = RequestMethod.POST)
	public @ResponseBody MemberVO duplcheck(MemberVO member,Model model){
		MemberVO result = msv.duplcheck(member);
		if(result == null){
		return result;
		}
		else{
			return result;
		}
	}
	@RequestMapping(value = "/idpwchck", method = RequestMethod.POST)
	public @ResponseBody MemberVO idpwchck(MemberVO member,Model model){
		MemberVO result = msv.idpwchck(member);
		if(result == null){
		return result;
		}
		else{
			return result;
		}
	}
	@RequestMapping(value="/goupdate", method=RequestMethod.POST)
	public String goupdate(MemberVO member ,HttpSession session ,Model model){ 
		MemberVO result = msv.login(member);
		model.addAttribute("mbname", result.getMb_name());
		model.addAttribute("mbnickname", result.getMb_nickname());
		model.addAttribute("mbaddress", result.getMb_addr());
		model.addAttribute("mbemailaddress",result.getMb_email());
		model.addAttribute("mblineid", result.getMb_lineid());
		return "customerInfo";
	}
	@RequestMapping(value = "/memberupdate", method = RequestMethod.POST)
	public String memberupdate(MemberVO member) {
		int result = msv.memberupdate(member);
		return "redirect:/";
	}
	@RequestMapping(value = "/gomemberprofile", method = RequestMethod.GET)
	public String gomemberprofile(MemberVO member) {
			return "memberProfile";
	}
	@RequestMapping(value="/goReservation", method=RequestMethod.GET)
	public String goReservation(){ 
		return "reservation";
	}
	@RequestMapping(value="/goFavorite", method=RequestMethod.GET)
	public String goFavorite(){ 
		return "reservation";
	}
	
	
	@RequestMapping(value = "/gomemberout", method = RequestMethod.GET)
	public String gomemberout(MemberVO member) {
			return "deleteAccount";
	}
	@RequestMapping(value = "/deleteAccount", method = RequestMethod.POST)
	public String deleteAccount(MemberVO member) {
		int result = msv.deleteAccount(member);
			return "redirect:/logout";
	}
}
