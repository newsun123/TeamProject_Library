package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.example.demo.vo.InquiryVo;
import com.example.demo.vo.MtmVo;

public interface InquiryService {
	
	public String list(HttpServletRequest req,Model model,InquiryVo ivo,HttpSession ss);
	public String write(HttpServletRequest req,Model model,HttpSession session);
	public String writeOk(InquiryVo ivo,HttpSession ss);
	public String readnum(HttpServletRequest req);
	public String content(HttpServletRequest req,Model model,HttpSession ss);
	public String delete(HttpServletRequest req);
	public String update(InquiryVo ivo,Model model,HttpServletRequest req);
	public String updateOk(InquiryVo ivo,HttpServletRequest req);
}
