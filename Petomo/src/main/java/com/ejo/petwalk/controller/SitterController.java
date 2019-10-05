package com.ejo.petwalk.controller;

import java.io.IOException;
import java.util.Date;
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
import com.ejo.petwalk.vo.MemberVO;
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
		SitterVO sitter = new SitterVO();
		sitter.setSt_id((String)session.getAttribute("sessionId"));
		aws3sv.deleteObject("sitter", (String)session.getAttribute("sessionProfileImg"));
		ssv.deleteSitterImage(sitter);
		session.setAttribute("sessionProfileImg", "defaultImage.png");
		return "redirect:/sitterInfoModi";
	}
	
	@RequestMapping(value = "/insertSitterImage", method=RequestMethod.POST)
	public String insertSitterImage (MultipartFile uploadfile,HttpSession session,Model model){
		if (!(uploadfile.isEmpty() || uploadfile == null || uploadfile.getSize() == 0)) {
			
			if(session.getAttribute("sessionProfileImg")!=null) {
				SitterVO sitter = new SitterVO();
				sitter.setSt_id((String)session.getAttribute("sessionId"));
				aws3sv.deleteObject("sitter", (String)session.getAttribute("sessionProfileImg"));
				ssv.deleteSitterImage(sitter);
			}
			
			String file_org = uploadfile.getOriginalFilename();
			Date date = new Date();
			String file_sav = date.getTime() + file_org;
			FileVO sitterFile = new FileVO(file_sav,file_org,"sitter",(String)session.getAttribute("sessionId")); 
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
		if(result == null){
		return result;
		}
		else{
			return result;
		}
	}
	
	
}
