package com.ejo.petwalk.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ejo.petwalk.service.MemberService;
import com.ejo.petwalk.service.ReservationService;
import com.ejo.petwalk.service.SitterService;
import com.ejo.petwalk.vo.NotificationVO;
import com.ejo.petwalk.vo.ReservationVO;
import com.ejo.petwalk.vo.SitterVO;

@Controller
public class ReservationController {
	
	@Autowired
	ReservationService rsv;
	@Autowired
	SitterService ssv;
	@Autowired
	MemberService msv;
	
	
	@RequestMapping(value="/streamingService",method=RequestMethod.GET)
	public String goStreamingService(Model model,String res_id) {
		ReservationVO res = rsv.selectOneRes(res_id);
		SitterVO sitter = ssv.selectOneSitter(res.getSt_id());
		List<HashMap<String,String>> cList = rsv.selectChatAll(res.getRes_id());
		
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
	
	
	
	
	@RequestMapping(value="/endedService",method=RequestMethod.GET)
	public String goEndedService(Model model,String res_id) {
		ReservationVO res = rsv.selectOneRes(res_id);
		SitterVO sitter = ssv.selectOneSitter(res.getSt_id());
		List<HashMap<String,String>> cList = rsv.selectChatAll(res.getRes_id());
		int ressize = rsv.selectAllRes().size(); //테스트용으로 고정
		model.addAttribute("ressize", ressize);
		
		model.addAttribute("cList",cList);
		model.addAttribute("sitter",sitter);
		model.addAttribute("res",res);
		return "res/endedService";
	}
	@RequestMapping(value="/sitterStreaming")
	public String sitterStreaming(Model model,String res_id){ 
		ReservationVO res = rsv.selectOneRes(res_id);
		SitterVO sitter = ssv.selectOneSitter(res.getSt_id());
		List<HashMap<String,String>> cList = rsv.selectChatAll(res.getRes_id());
		
		model.addAttribute("cList",cList);
		model.addAttribute("sitter",sitter);
		model.addAttribute("res",res);
		return "res/sitterStreaming";
	}
	@RequestMapping(value = "/streamingStart", method = RequestMethod.GET)
	public @ResponseBody int streamingStart(ReservationVO res,Model model,HttpSession session){
		res.setSt_id((String)session.getAttribute("sessionId"));
		int result = rsv.streamingStart(res);
		
		return result;
	}
	@RequestMapping(value = "/streamingEnd", method = RequestMethod.GET)
	public @ResponseBody int StreamingEnd(ReservationVO res,Model model){
		int result = rsv.StreamingEnd(res);
		
		return result;
		}
}


