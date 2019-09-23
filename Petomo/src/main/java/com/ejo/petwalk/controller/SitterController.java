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
		try {
			result = ssv.selectSitter(sitter);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.setAttribute("loginId",result.getSt_id());
		return "home";
	}
	
	
	@RequestMapping(value="/goSitterInfoModi", method=RequestMethod.GET)
	public String goSitterInfoModi(SitterVO sitter,HttpSession session,Model model){ 
		try {
			sitter = ssv.selectOneSitter(sitter);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("sitter",sitter);
		return "sitterInfoModi";
	}
	
	@RequestMapping(value="/goSitterList", method=RequestMethod.GET)
	public String goSitterList(Model model){ 
		List<SitterVO> result = null;
		try {
			result = ssv.selectAllSitter();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("result", result);
		
		return "sitterList";
	}
	
	
	@RequestMapping(value="/updateSitter", method=RequestMethod.POST)
	public String updateSitter(SitterVO sitter,MultipartFile uploadfile) throws IOException{ 
		try {
			ssv.updateSitter(sitter);
			System.out.println(sitter);
			
			
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
		
	@RequestMapping(value="/goSitterDetail", method=RequestMethod.GET)
	public String goSitterDetail(SitterVO st_id, Model model){ 
			
		try {
			model.addAttribute("sitter", ssv.selectOneSitter(st_id));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "sitterDetail";
	}

}
