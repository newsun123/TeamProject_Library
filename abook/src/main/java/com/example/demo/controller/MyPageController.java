package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
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
	
	@RequestMapping("/mypage/cancelSeat")
	public String cancelSeat(HttpServletRequest req,HttpSession ss) {
		return service.cancelSeat(req,ss);
	}

	@RequestMapping("/mypage/bookreserve")
	public String bookreserve(Model model,HttpSession session) {
		return service.bookreserve(model,session);
	}
	
	@RequestMapping("/mypage/brsvCancel")
	public String brsvCancel(HttpServletRequest request) {
		return service.brsvCancel(request);
	}
	
	@RequestMapping("/mypage/giganUpdate")
	public String giganUpdate(HttpServletRequest request) {
		return service.giganUpdate(request);
	}
	
	@RequestMapping("/mypage/returnOk")
	public String returnOk(HttpServletRequest request) {
		return service.returnOk(request);
	}
	
	@RequestMapping("/mypage/loanlist")
	public String loanlist(HttpSession session,Model model) {
		return service.loanlist(session,model);
	}
}
