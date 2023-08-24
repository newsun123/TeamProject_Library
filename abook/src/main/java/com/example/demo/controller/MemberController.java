package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;
import com.example.demo.vo.MemberVo;

@Controller
public class MemberController {
	
	@Autowired
	@Qualifier("mems")
	private MemberService service;
	
	@RequestMapping("/member/member")
	public String member(){
		
		return service.member();
	}
	
	@RequestMapping("/member/useridCheck")
	public @ResponseBody int useridCheck(MemberVo mvo) {
		
		return service.useridCheck(mvo);
	}
	
	 @RequestMapping("/member/memberOk") 
	 public String memberOk(MemberVo mvo,HttpServletRequest request) {
	    return service.memberOk(mvo,request);
	 }

	 @RequestMapping("/member/login")
	 public String login() {
		 return service.login();
	 }
	 
	 

}
