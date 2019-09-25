package com.ejo.petwalk.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	@RequestMapping(value="/sitterLogin", method=RequestMethod.GET)
	public String sitterLogin(SitterVO sitter,HttpSession session){ 
		SitterVO result = null;
		sitter.setSt_pw("st1");
		sitter.setSt_id("st1");
		try {
			result = ssv.loginSitter(sitter);
		} catch (Exception e) {
		}
		session.setAttribute("loginId",result.getSt_id());
		return "home";
	}
	
	
	@RequestMapping(value = "/sitterSignup" , method = RequestMethod.POST)
	public String sitterSignup (HttpSession session,Model model,SitterVO sitter) throws Exception{
		System.out.println(sitter);
		int result = ssv.insertSitter(sitter);
		if(result == 1) {
			session.setAttribute("loginid", sitter.getSt_id());
		}
		return "home";
	}
	
	@RequestMapping(value="/updateSitter", method=RequestMethod.POST)
	public String updateSitter(SitterVO sitter,MultipartFile uploadfile) throws IOException{ 
		try {
			ssv.updateSitter(sitter);
			
			if (!(uploadfile.isEmpty() || uploadfile == null || uploadfile.getSize() == 0)) {
				String file_org = uploadfile.getOriginalFilename();
				Date date = new Date();
				String file_sav = date.getTime() + file_org;
				
				FileVO sitterFile = new FileVO(file_sav,file_org,"sitter",sitter.getSt_id()); 
				
				System.out.println(sitterFile);
				
				ssv.insertSitterImage(sitterFile);
				aws3sv.uploadObject(uploadfile, "sitter/"+file_sav);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/sitterInfoModi";
	}
	
	
	@RequestMapping(value="/sitterInfoModi")
	public String sitterInfoModi(SitterVO sitter,HttpSession session,Model model){ 
		sitter = ssv.selectOneSitter((String)session.getAttribute("loginId"));
		model.addAttribute("sitter",sitter);
		return "sitter/sitterInfoModi";
	}		
	
	
	@RequestMapping(value = "/sitterResList")
	public String sitterResList (HttpSession session,Model model){
		System.out.println((String)session.getAttribute("loginId"));
		ArrayList<ReservationVO> rList = rsv.selectResAllBySt_id((String)session.getAttribute("loginId"));
		System.out.println(rList);
		model.addAttribute("rList",rList);
		return "sitter/sitterResList";
	}

}
