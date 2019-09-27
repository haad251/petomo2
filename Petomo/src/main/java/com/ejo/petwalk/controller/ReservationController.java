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
	
	
	@RequestMapping(value="/goStreamingService",method=RequestMethod.GET)
	public String goStreamingService(Model model) {
		System.out.println("test");
		SitterVO sitter = null;
		List<HashMap<String,String>> cList = null;
		ReservationVO res = null;
		
		try {
			sitter = ssv.selectOneSitter("st1"); //시터정보가져오기
			cList = rsv.selectAllChat("res1"); //예약번호기준 채팅가져오기
			res = rsv.selectOneRes("res1");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("cList",cList);
		model.addAttribute("sitter",sitter);
		model.addAttribute("res",res);
		return "res/streamingService";
	}
	
	@MessageMapping("/chatin")
	@SendTo("/topic/chatin")
	public ChatVO chatin(ChatVO chat) throws Exception {
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date time = new Date();
		String chattime = sdf.format(time);
		chat.setChat_date(chattime);   //채팅에 현재시간넣어주기
		
		rsv.insertChat(chat);   //채팅 디비로 전송
//		Thread.sleep(100); // delay
		return chat;
	}
}


