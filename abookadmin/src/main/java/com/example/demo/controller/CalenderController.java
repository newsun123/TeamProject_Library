package com.example.demo.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.CalenderService;

@Controller
public class CalenderController {
	
	@Autowired
	@Qualifier("cc")
	private CalenderService service;
	

	@RequestMapping("/calender/cal1")
	public String cal1()
	{
		return "/calender/cal1";
	}
	
	@RequestMapping("/calender/cal2")
	public @ResponseBody ArrayList<HashMap> cal2(HttpServletRequest request,Model model)
	{
		return service.cal2(request,model);
	}
	
	@RequestMapping("/calender/cal4")
	public String cal4()
	{
		return "/calender/cal4";
	}
}
