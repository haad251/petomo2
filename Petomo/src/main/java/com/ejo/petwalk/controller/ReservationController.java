package com.ejo.petwalk.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ejo.petwalk.service.ReservationService;
import com.ejo.petwalk.service.SitterService;
import com.ejo.petwalk.vo.ReservationVO;
import com.ejo.petwalk.vo.SitterVO;

@Controller
public class ReservationController {
	
	@Autowired
	ReservationService rsv;
	@Autowired
	SitterService ssv;
	
	
	@RequestMapping(value="/streamingService",method=RequestMethod.GET)
	public String goStreamingService(Model model,String res_id) {
		SitterVO sitter = null;
		List<HashMap<String,String>> cList = null;
		ReservationVO res = null;
		res = rsv.selectOneRes(res_id); //테스트용으로 고정
		sitter = ssv.selectOneSitter(res.getSt_id());
		cList = rsv.selectChatAll(res.getRes_id());
		System.out.println(res);
		System.out.println(sitter);
		System.out.println(cList);
		
		model.addAttribute("cList",cList);
		model.addAttribute("sitter",sitter);
		model.addAttribute("res",res);
		return "res/streamingService";
	}
	
	@RequestMapping(value="/insertReview",method=RequestMethod.GET)
	public String insertReview(Model model,ReservationVO res) {
		rsv.insertReview(res);
		return "redirect:/memberResList";
	}
	
}


