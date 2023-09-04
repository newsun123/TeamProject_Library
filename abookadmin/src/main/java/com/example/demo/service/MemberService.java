package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.example.demo.vo.MemberVo;

public interface MemberService {
	public String mlist(HttpServletRequest request,Model model,MemberVo mvo);
	
}
