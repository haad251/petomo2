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
		
		
}
