package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.AdminService;
import com.example.demo.vo.AdminVo;

@Controller
public class AdminController {

	@Autowired
	@Qualifier("as")
	private AdminService service;
	
	@RequestMapping("/")
	public String home()
	{
		return "redirect:/admin/list";
	}
	
	@RequestMapping("/admin/list")
	public String list(Model model,AdminVo avo,HttpServletRequest request)
	{
		return service.list(model,avo,request);
	}
	
	@RequestMapping("/admin/write")
	public String write()
	{
		return service.write();
	}
	
	@RequestMapping("/admin/write_ok")
	public String write_ok(AdminVo avo,HttpServletRequest request,Model model)
	{
		return service.write_ok(avo,request,model);
	}
	
	@RequestMapping("/admin/addbookea")
	public @ResponseBody String addbookea(HttpServletRequest request)
	{
		return service.addbookea(request);
	}
	
	@RequestMapping("/admin/delbookea")
	public @ResponseBody String delbookea(HttpServletRequest request)
	{
		return service.delbookea(request);
	}
	
	@RequestMapping("/admin/content")
	public String content(AdminVo avo,HttpServletRequest request,Model model)
	{
		return service.content(avo,request,model);
	}
	
	@RequestMapping("/admin/getBcode")
	public @ResponseBody String getBcode(Model model) {
		return service.getBcode(model);
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
