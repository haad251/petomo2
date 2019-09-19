package com.ejo.petwalk.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ejo.petwalk.vo.MemberVO;

@Controller
public class SiteController {
	
	@RequestMapping(value="/introducePetomo", method=RequestMethod.GET)
	public String introducePetomo(){ 

		return "introducePetomo";
	}
}
