package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.example.demo.vo.GongjiVo;

public interface GongjiService {
	public String list(Model model,HttpServletRequest req,GongjiVo gvo);
	public String readnum(HttpServletRequest req);
	public String content(Model model,HttpServletRequest req,GongjiVo gvo);
}
