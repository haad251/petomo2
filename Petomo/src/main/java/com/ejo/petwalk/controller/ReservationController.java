package com.ejo.petwalk.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ejo.petwalk.service.ManagerService;
import com.ejo.petwalk.service.ReservationService;
import com.ejo.petwalk.service.SitterService;
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
	ManagerService msv;
	
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

	@RequestMapping(value = "/insertReview", method = RequestMethod.GET)
	public String insertReview(Model model, ReservationVO res) {
		rsv.insertReview(res);
		String st_id = res.getSt_id();		
		List<ReservationVO> list  =  rsv.selectResListBySt_id(res);
		int totalrate = 0;
		for(int i = 0 ; i < list.size() ; i++) {
		totalrate += Integer.parseInt(list.get(i).getRes_rate());
		}
		double average = Math.round(totalrate/list.size()*10)/10;
		
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
	
	  @RequestMapping(value="/insertReservation", method=RequestMethod.POST) 
	  public String insertReservation(ReservationVO res, ServiceVO sv, SitterVO svo,HttpSession session, Model model) throws Exception{ 
		  rsv.insertReservation(res);
		  String mb_id = (String)session.getAttribute("sessionId");
			model.addAttribute("rList",rsv.selectResByMb_id(mb_id));
			System.out.println(rsv.selectResByMb_id(mb_id).get(0));
		  return "res/complete";
	  }
}
