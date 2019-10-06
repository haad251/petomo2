package com.ejo.petwalk.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.ejo.petwalk.vo.ChatVO;
import com.ejo.petwalk.vo.MemberVO;
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
		SitterVO sitter = null;
		List<HashMap<String,String>> cList = null;
		ReservationVO res = null;
		res = rsv.selectOneRes("8"); //테스트용으로 고정
		sitter = ssv.selectOneSitter(res.getSt_id());
		cList = rsv.selectChatAll(res.getRes_id());
		
		model.addAttribute("cList",cList);
		model.addAttribute("sitter",sitter);
		model.addAttribute("res",res);
		return "res/streamingService";
	}
	
	@MessageMapping("/chats")
	@SendTo("/topic/chats")
	public ChatVO chatin(ChatVO chat) throws Exception {
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date time = new Date();
		String chattime = sdf.format(time);
		chat.setChat_date(chattime);   //채팅에 현재시간넣어주기
		
		rsv.insertChat(chat);   //채팅 디비로 전송
		
		SimpleDateFormat sdf2 =new SimpleDateFormat("MM/dd HH:mm");
		String chattime2 = sdf2.format(time);
		chat.setChat_date(chattime2);
		return chat;
	}
	
	@RequestMapping(value="/insertReview",method=RequestMethod.GET)
	public String insertReview(Model model,ReservationVO res) {
		rsv.insertReview(res);
		return "redirect:/memberResList";
	}
	@RequestMapping(value="/endedService",method=RequestMethod.GET)
	public String goEndedService(Model model,String res_id) {
		SitterVO sitter = null;
		List<HashMap<String,String>> cList = null;
		ReservationVO res = null;
		res = rsv.selectOneRes("8"); //테스트용으로 고정
		sitter = ssv.selectOneSitter(res.getSt_id());
		cList = rsv.selectChatAll(res.getRes_id());
		int ressize = rsv.selectAllRes().size(); //테스트용으로 고정
		model.addAttribute("cList",cList);
		model.addAttribute("sitter",sitter);
		model.addAttribute("res",res);
		model.addAttribute("ressize", ressize);
		return "res/endedService";
	}
	@RequestMapping(value="/sitterStreaming")
	public String sitterStreaming(Model model,String res_id){ 
		SitterVO sitter = null;
		List<HashMap<String,String>> cList = null;
		ReservationVO res = null;
		res = rsv.selectOneRes("8"); //테스트용으로 고정
		sitter = ssv.selectOneSitter(res.getSt_id());
		cList = rsv.selectChatAll(res.getRes_id());
		
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
	
	@MessageMapping("/noti")
	@SendTo("/topic/noti")
	public NotificationVO notiin(NotificationVO noti) throws Exception {
		System.out.println("노티노티");
		System.out.println(noti);
		return noti;

	}
}


