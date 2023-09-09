package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.example.demo.vo.GongjiVo;

public interface MainService {

	public String main(GongjiVo gvo,Model model,HttpServletRequest req);
	public String intro();
	public String location();
}
