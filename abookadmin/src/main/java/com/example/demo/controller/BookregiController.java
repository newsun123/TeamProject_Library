package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.BookregiService;
import com.example.demo.vo.BookregiVo;

@Controller
public class BookregiController {
	
	@Autowired
	@Qualifier("br")
	private BookregiService service;
	
	@RequestMapping("/")
	public String home(){
		return "redirect:/bookregi/list";
	}
	
	@RequestMapping("/bookregi/list")
	public String list(Model model,BookregiVo bvo,HttpServletRequest request){
		return service.list(model,bvo,request);
	}
	
	@RequestMapping("/bookregi/write")
	public String write() {
		return service.write();
	}
	
	@RequestMapping("/bookregi/write_ok")
	public String write_ok(BookregiVo bvo,HttpServletRequest request){
		return service.write_ok(bvo,request);
	}
	
	@RequestMapping("/bookregi/content")
	public String content(BookregiVo bvo,HttpServletRequest request,Model model){
		return service.content(bvo,request,model);
	}
	
}
