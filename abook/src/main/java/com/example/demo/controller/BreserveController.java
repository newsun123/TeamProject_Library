package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.BreserveService;
import com.example.demo.vo.BookregiVo;

@Controller
public class BreserveController {

	@Autowired
	@Qualifier("brsv")
	private BreserveService service;
	
	@RequestMapping("/breserve/list")
	public String list(Model model,BookregiVo bvo,HttpServletRequest request) {
		return service.list(model,bvo,request);
	}
	
	@RequestMapping("/breserve/content")
	public String content(BookregiVo bvo,HttpServletRequest request,Model model){
		return service.content(bvo,request,model);
	}
	
	@RequestMapping("/breserve/bresOk")
	public String bresOk(HttpSession session,HttpServletRequest request) {
		return service.bresOk(session,request);
	}
}
