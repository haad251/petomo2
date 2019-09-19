package com.ejo.petwalk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MapController {

	//[TEST] Streaming Service ∆‰¿Ã¡ˆ
		@RequestMapping(value="/mapTesting",method=RequestMethod.GET)
		public String gotoMapTesting() {
			return "mapTesting";
		}
		
		@RequestMapping(value="/mapTesting2",method=RequestMethod.GET)
		public String gotoMapTesting2() {
			return "mapTestingTwo";
		}
		
		@RequestMapping(value="/mapTesting3",method=RequestMethod.GET)
		public String gotoMapTesting3() {
			return "mapTestingThree";
		}
		
}
