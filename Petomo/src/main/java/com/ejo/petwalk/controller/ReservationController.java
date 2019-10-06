package com.ejo.petwalk.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import com.ejo.petwalk.service.ReservationService;
import com.ejo.petwalk.service.SitterService;
import com.ejo.petwalk.vo.ChatVO;
import com.ejo.petwalk.vo.MemberVO;
import com.ejo.petwalk.vo.ReservationVO;
import com.ejo.petwalk.vo.ServiceVO;
import com.ejo.petwalk.vo.SitterVO;

@Controller
public class ReservationController {

	@Autowired
	ReservationService rsv;
	@Autowired
	SitterService ssv;
	@Autowired
	ManagerController msv;

	@RequestMapping(value = "/streamingService", method = RequestMethod.GET)
	public String goStreamingService(Model model, String res_id) {
		SitterVO sitter = null;
		List<HashMap<String, String>> cList = null;
		ReservationVO res = null;
		res = rsv.selectOneRes("8"); // 테스트용으로 고정
		sitter = ssv.selectOneSitter(res.getSt_id());
		cList = rsv.selectChatAll(res.getRes_id());

		model.addAttribute("cList", cList);
		model.addAttribute("sitter", sitter);
		model.addAttribute("res", res);
		return "res/streamingService";
	}

	@MessageMapping("/hello")
	@SendTo("/topic/chats")
	public ChatVO chatin(ChatVO chat) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date time = new Date();
		String chattime = sdf.format(time);
		chat.setChat_date(chattime); // 채팅에 현재시간넣어주기

		rsv.insertChat(chat); // 채팅 디비로 전송

		SimpleDateFormat sdf2 = new SimpleDateFormat("MM/dd HH:mm");
		String chattime2 = sdf2.format(time);
		chat.setChat_date(chattime2);
//		Thread.sleep(100); // delay
		return chat;
	}

	@RequestMapping(value = "/insertReview", method = RequestMethod.GET)
	public String insertReview(Model model, ReservationVO res) {
		rsv.insertReview(res);
		return "redirect:/memberResList";
	}

	@RequestMapping(value = "/reservation")
	public String reservation(Model model, String st_id) throws Exception {
		SitterVO sitter = ssv.selectOneSitter(st_id);
		ArrayList<ServiceVO> sList = msv.selectAllService();
		model.addAttribute("sitter", sitter);
		model.addAttribute("sList", sList);
		return "res/reservation";
	}

	@RequestMapping(value = "/selectTimes", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Integer> selectTimes(String st_id, String selectDate) {
		System.out.println(st_id);
		System.out.println(selectDate);

		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("st_id", st_id);
		hMap.put("selectDate", selectDate);

		List<HashMap<String, String>> result = rsv.selectResTime(hMap);
		System.out.println(result);

		ArrayList<Integer> tList = new ArrayList<Integer>();
		for (HashMap<String, String> res : result) {
			int end = Integer.parseInt(res.get("endtime"));
			int start = Integer.parseInt(res.get("starttime"));

			if (end - start == 1)
				tList.add(start);
			else if (end - start == 2) {
				tList.add(start);
				tList.add(start + 1);
			} else if (end - start == 3) {
				tList.add(start);
				tList.add(start + 1);
				tList.add(start + 2);
			}
		}
		System.out.println(tList);
		return tList;
	}

	
	  @RequestMapping(value="/insertReservation", method=RequestMethod.POST) 
	  public String insertReservation(ReservationVO res, ServiceVO sv, SitterVO svo,HttpSession session, Model model) throws Exception{ 
		  rsv.insertReservation(res);
		  String mb_id = (String)session.getAttribute("sessionId");
		 
			model.addAttribute("rList",rsv.selectResByMb_id(mb_id));
	System.out.println(rsv.selectResByMb_id(mb_id).get(0));
		  return "res/complete";
	  
	  }
}
