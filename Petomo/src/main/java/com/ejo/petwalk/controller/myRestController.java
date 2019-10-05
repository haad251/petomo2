package com.ejo.petwalk.controller;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class myRestController {
	@ExceptionHandler(Exception.class)
	public Object nullex(Exception e)
	{ System.err.println(e.getClass()); return "error"; }

}
