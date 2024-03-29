package com.ejo.petwalk.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ejo.petwalk.service.ReservationService;
import com.ejo.petwalk.vo.LocationVO;

@Controller
public class MapController {
	
	@Autowired
	ReservationService rservice;

		@RequestMapping(value="/mapTesting",method=RequestMethod.GET)
		public String gotoMapTesting() {
			return "manager/mapTesting";
		}
		
		@RequestMapping(value="/setWalkingLoc",method=RequestMethod.POST)
		public @ResponseBody int setWalkingLoc(LocationVO loc) {
			int result = 0 ;
			try {
				result = rservice.insertLoc(loc);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;  
		}
		
		
		
		
		
		@RequestMapping(value="/allLocData",method=RequestMethod.POST)
		public @ResponseBody ArrayList<LocationVO> setWalkingLoc(String res_id) {
			ArrayList<LocationVO> result = null;
			try {
				result = rservice.selectLocationInfoAll(res_id);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;  
		}
}
