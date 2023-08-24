package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import com.example.demo.vo.MemberVo;

public interface MemberService {	
	public String member();
    public int useridCheck(MemberVo mvo);
    public String memberOk(MemberVo mvo,HttpServletRequest request);
}
