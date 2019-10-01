package com.ejo.petwalk.controller;

import java.util.Date;
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
import com.ejo.petwalk.service.MemberService;
import com.ejo.petwalk.vo.FileVO;
import com.ejo.petwalk.vo.MemberVO;
import com.ejo.petwalk.vo.PetVO;
import com.ejo.petwalk.vo.SitterVO;
 

@Controller
public class MemberController {
	
	@Autowired
	MemberService msv;
	@Autowired
	AwsS3Service aws3sv;
	
	
//	테스트용
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
		session.setAttribute("sessionId",result.getMb_id());
		return "home";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session){ 
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping(value="/loginMember", method=RequestMethod.POST)
	public String loginuser(HttpSession session,Model model, MemberVO member){ 
		MemberVO result = msv.login(member);
		session.setAttribute("sessionId", result.getMb_id());
		session.setAttribute("sessionName", result.getMb_name());
		

		FileVO file = msv.selectMemberProfileImg(result);
		if(file==null) 	
			session.setAttribute("sessionProfileImg", "defaultImage.png");
		else
			session.setAttribute("sessionProfileImg", file.getFile_sav());
		return "redirect:/";
	}
	
	@RequestMapping(value = "/memberSignup" , method = RequestMethod.POST)
	public String memberSignup (HttpSession session,Model model,MemberVO member)
	{
		int result = msv.signup(member);
		if(result == 1) {
			session.setAttribute("sessionId", member.getMb_id());
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
	public @ResponseBody String idpwchck(MemberVO member,SitterVO sitter,Model model){
		System.out.println(member);
		System.out.println(sitter);
		String result = "";
		if(member!=null) {
			if(msv.idpwchck(member)!=null) 
				result = "ok";
		}
		if(sitter!=null) {
			if(msv.idpwchckSitter(sitter)!=null) 
				result = "ok";
		}
			return result;
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
	
	
	@RequestMapping(value = "/deleteAccount", method = RequestMethod.POST)
	public String deleteAccount(MemberVO member) {
		int result = msv.deleteAccount(member);
			return "redirect:/logout";
	}
	
	@RequestMapping(value = "/dogIdCheck", method = RequestMethod.POST)
	public @ResponseBody MemberVO dogIdCheck(PetVO pet,Model model){
		MemberVO result = msv.dogIdCheck(pet);
		if(result == null){
		return result;
		}
		else{
			return result;
		}
	}
	@RequestMapping(value = "/petSignup", method = RequestMethod.POST)
	public String petSignup(PetVO pet) {
		int result = msv.petSignup(pet);
		return "member/memberProfile";
	}
	@RequestMapping(value = "/dogList", method = RequestMethod.GET)
	public @ResponseBody List<PetVO> dogList(PetVO pet) {
		List<PetVO> list = msv.dogList(pet);
		return list;
	}
	
	
//	멤버 사진 삭제/업로드관련
	
	@RequestMapping(value = "/deleteMemberImage")
	public String deleteMemberImage (HttpSession session){
		MemberVO member = new MemberVO();
		member.setMb_id((String)session.getAttribute("sessionId"));
		aws3sv.deleteObject("member", (String)session.getAttribute("sessionProfileImg"));
		msv.deleteMemberImage(member);
		session.setAttribute("sessionProfileImg", "defaultImage.png");
		return "redirect:/memberInfo";
	}
	
	@RequestMapping(value = "/insertMemberImage", method=RequestMethod.POST)
	public String insertMemberImage (MultipartFile uploadfile,HttpSession session,Model model){
		if (!(uploadfile.isEmpty() || uploadfile == null || uploadfile.getSize() == 0)) {
			
//			있으면 삭제
			if(session.getAttribute("sessionProfileImg")!=null) {
				MemberVO member = new MemberVO();
				member.setMb_id((String)session.getAttribute("sessionId"));
				aws3sv.deleteObject("member", (String)session.getAttribute("sessionProfileImg"));
				msv.deleteMemberImage(member);
			}
			
			String file_org = uploadfile.getOriginalFilename();
			Date date = new Date();
			String file_sav = date.getTime() + file_org;
			FileVO memberFile = new FileVO(file_sav,file_org,"member",(String)session.getAttribute("sessionId")); 
			msv.insertMemberImage(memberFile);
			aws3sv.uploadObject(uploadfile, "member/"+file_sav);
			session.setAttribute("sessionProfileImg", file_sav);
		}
		return "redirect:/memberInfo";
	}
}
