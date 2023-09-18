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
	public String write(HttpServletRequest req, Model model,HttpSession session)
	{
		return service.write(req,model,session);
	}
	
	@RequestMapping("/inquiry/writeOk")
	public String writeOk(InquiryVo ivo,HttpSession ss)
	{
		return service.writeOk(ivo,ss);
	}
	
	@RequestMapping("/inquiry/readnum")
	public String readnum(HttpServletRequest req,Model model)
	{
		return service.readnum(req,model);
	}
	
	@RequestMapping("/inquiry/content")
	public String content(HttpServletRequest req,Model model,HttpSession ss)
	{
		return service.content(req,model,ss);
	}
	
	@RequestMapping("/inquiry/delete")
	public String delete(HttpServletRequest req)
	{
		return service.delete(req);
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
