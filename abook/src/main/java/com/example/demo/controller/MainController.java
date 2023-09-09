package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.MainService;
import com.example.demo.vo.GongjiVo;

@Controller
public class MainController {
	
	@Autowired
	@Qualifier("main")
	private MainService service;
	
	@RequestMapping("/")
	public String home(){
		return "redirect:/main/main";
	}
	
	@RequestMapping("/main/main")
	public String main(GongjiVo gvo,Model model,HttpServletRequest req){
		return service.main(gvo,model,req);
	}	
	
	@RequestMapping("/introduce/intro")
	public String intro(){
		return service.intro();
	}	
	
	@RequestMapping("/introduce/location")
	public String location(){
		return service.location();
	}
}
