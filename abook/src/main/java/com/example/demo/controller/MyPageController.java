package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.MypageService;

@Controller
public class MyPageController {

	@Autowired
	@Qualifier("ms")
	private MypageService service;
	
	@RequestMapping("/mypage/checkReserveSeat")
	public String checkReserveSeat(HttpSession ss,Model model ) {
		return service.checkReserveSeat(ss,model);
	}
}
