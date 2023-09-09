package com.example.demo.service;

import org.springframework.ui.Model;

import com.example.demo.vo.GongjiVo;

public interface MainService {

	public String main(GongjiVo gvo,Model model);
	public String intro();
	public String location();
}
