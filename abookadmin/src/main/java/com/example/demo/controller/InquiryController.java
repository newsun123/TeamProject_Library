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
import com.example.demo.vo.MtmVo;

@Controller
public class InquiryController {
	
	@Autowired
	@Qualifier("is")
	private InquiryService service;
	
	@RequestMapping("/inquiry/list")
	public String list(HttpServletRequest req,Model model,InquiryVo ivo,HttpSession ss)
	{
		return service.list(req,model,ivo,ss);
	}
	
	@RequestMapping("/inquiry/readnum")
	public String readnum(InquiryVo ivo,HttpServletRequest req)
	{
		return service.readnum(ivo,req);
	}
	
	@RequestMapping("/inquiry/content")
	public String content(InquiryVo ivo,HttpServletRequest req,Model model,MtmVo mvo)
	{
		return service.content(ivo,req,model,mvo);
	}
	
	@RequestMapping("/inquiry/write")
	public String write(HttpServletRequest req,Model model)
	{
		return service.write(req,model);
	}
	
	@RequestMapping("/inquiry/writeOk")
	public String writeOk(MtmVo mvo)
	{
		return service.writeOk(mvo);
	}
	
}