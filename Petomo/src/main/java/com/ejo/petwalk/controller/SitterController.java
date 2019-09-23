package com.ejo.petwalk.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.ejo.petwalk.service.AwsS3Service;
import com.ejo.petwalk.service.SitterService;
import com.ejo.petwalk.vo.FileVO;
import com.ejo.petwalk.vo.MemberVO;
import com.ejo.petwalk.vo.SitterVO;

@Controller
public class SitterController {

	@Autowired
	SitterService ssv;

	@Autowired
	AwsS3Service aws3sv;
	
	@RequestMapping(value="/sitterLogin", method=RequestMethod.GET)
	public String sitterLogin(SitterVO sitter,HttpSession session){ 
		sitter.setSt_id("st1");
		sitter.setSt_pw("st1");
		SitterVO result = null;
		result = ssv.loginSitter(sitter);
		session.setAttribute("loginId",result.getSt_id());
		return "redirect:/home";
	}
	
	
	@RequestMapping(value = "/sitterSignup" , method = RequestMethod.POST)
	public String sitterSignup (HttpSession session,Model model,SitterVO sitter) throws Exception{
		System.out.println(sitter);
		int result = ssv.insertSitter(sitter);
		if(result == 1) {
			session.setAttribute("loginid", sitter.getSt_id());
		}
		return "redirect:/home";
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
		return "redirect:/goSitterInfoModi";
	}

}
