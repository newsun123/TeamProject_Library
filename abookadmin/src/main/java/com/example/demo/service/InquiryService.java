package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.example.demo.vo.InquiryVo;

public interface InquiryService {
	
	public String list(HttpServletRequest req,Model model,InquiryVo ivo,HttpSession ss);
	public String readnum(InquiryVo ivo,HttpServletRequest req);
	public String content(InquiryVo ivo,HttpServletRequest req,Model model);
	public String write();
	public String writeOk(InquiryVo ivo);
}