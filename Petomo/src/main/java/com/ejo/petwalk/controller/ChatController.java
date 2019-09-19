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

import com.ejo.petwalk.service.ChatService;
import com.ejo.petwalk.vo.ChatVO;

@Controller
public class ChatController {
	
	@Autowired
	ChatService csv;
	
	
	@RequestMapping(value="/goChattest",method=RequestMethod.GET)
	public String goChattest(Model model) {
		String res_id = "res1";
		List<HashMap<String,String>> cList = null;
		try {
			cList = csv.selectAllChat(res_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("cList",cList);
		System.out.println(cList);
		return "chattest";
	}
	
	@MessageMapping("/chatin")
	@SendTo("/topic/chatin")
	public ChatVO chatin(ChatVO chat) throws Exception {
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date time = new Date();
		String chattime = sdf.format(time);
		chat.setChat_date(chattime);   //채팅에 현재시간넣어주기
		
		csv.insertChat(chat);   //채팅 디비로 전송
//		Thread.sleep(100); // delay
		return chat;
	}
}
