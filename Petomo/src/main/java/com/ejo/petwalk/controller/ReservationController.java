package com.ejo.petwalk.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ejo.petwalk.service.ReservationService;
import com.ejo.petwalk.service.SitterService;
import com.ejo.petwalk.vo.ChatVO;
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
		res = rsv.selectOneRes("8"); //테스트용으로 고정
		sitter = ssv.selectOneSitter(res.getSt_id());
		cList = rsv.selectChatAll(res.getRes_id());
		
		model.addAttribute("cList",cList);
		model.addAttribute("sitter",sitter);
		model.addAttribute("res",res);
		return "res/streamingService";
	}
	
	@MessageMapping("/hello")
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
//		Thread.sleep(100); // delay
		return chat;
	}
}


