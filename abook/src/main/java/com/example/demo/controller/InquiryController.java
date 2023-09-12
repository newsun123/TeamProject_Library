package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.InquiryService;
import com.example.demo.vo.InquiryVo;

@Controller
public class InquiryController {
	
	@Autowired
	@Qualifier("ic")
	private InquiryService service;
	
	@RequestMapping("/inquiry/list")
	public String list(HttpServletRequest req,Model model,InquiryVo ivo,HttpSession ss)
	{
		return service.list(req,model,ivo,ss);
		// 1234 1234
	}
	
	@RequestMapping("inquiry/write")
	public String write()
	{
		return service.write();
	}
	
	@RequestMapping("inquiry/writeOk")
	public String writeOk(InquiryVo ivo)
	{
		return service.writeOk(ivo);
	}
}
