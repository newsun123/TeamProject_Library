package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.CalenderService;

@Controller
public class CalenderController {
	
	@Autowired
	@Qualifier("cc")
	private CalenderService service;
	
	@RequestMapping("/calender/calender")
	public String calender(HttpServletRequest request,Model model)
	{
		return service.calender(request,model);
	}
}
