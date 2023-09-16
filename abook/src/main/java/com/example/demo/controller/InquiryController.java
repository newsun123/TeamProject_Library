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
	@Qualifier("ic")
	private InquiryService service;
	
	@RequestMapping("/inquiry/list")
	public String list(HttpServletRequest req,Model model,InquiryVo ivo,HttpSession ss)
	{
		return service.list(req,model,ivo,ss);
		// 1234 1234
	}
	
	@RequestMapping("/inquiry/write")
	public String write()
	{
		return service.write();
	}
	
	@RequestMapping("/inquiry/writeOk")
	public String writeOk(InquiryVo ivo,HttpSession ss)
	{
		return service.writeOk(ivo,ss);
	}
	
	@RequestMapping("/inquiry/readnum")
	public String readnum(InquiryVo ivo,HttpServletRequest req)
	{
		return service.readnum(ivo,req);
	}
	
	@RequestMapping("/inquiry/content")
	public String content(InquiryVo ivo,HttpServletRequest req,
			Model model,MtmVo mvo,HttpSession ss)
	{
		return service.content(ivo,req,model,mvo,ss);
	}
	
	@RequestMapping("/inquiry/delete")
	public String delete(InquiryVo ivo,HttpServletRequest req)
	{
		return service.delete(ivo,req);
	}
	
	@RequestMapping("/inquiry/update")
	public String update(InquiryVo ivo,Model model,HttpServletRequest req)
	{
		return service.update(ivo,model,req);
	}
	
	@RequestMapping("/inquiry/updateOk")
	public String updateOk(InquiryVo ivo,HttpServletRequest req)
	{
		return service.updateOk(ivo,req);
	}
}
