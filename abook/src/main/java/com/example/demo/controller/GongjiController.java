package com.example.demo.controller;

import javax.print.DocFlavor.READER;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.GongjiService;
import com.example.demo.vo.GongjiVo;

@Controller
public class GongjiController {
	
	@Autowired
	@Qualifier("gs2")
	private GongjiService service;
	
	@RequestMapping("/gongji/list")
	public String list(Model model,HttpServletRequest req,GongjiVo gvo)
	{
		return service.list(model,req,gvo);
	}
	
	@RequestMapping("/gongji/readnum")
	public String readnum(HttpServletRequest req)
	{
		return service.readnum(req);
	}
	
	@RequestMapping("/gongji/content")
	public String content(Model model,HttpServletRequest req,GongjiVo gvo)
	{
		return service.content(model,req,gvo);
	}
	
}
