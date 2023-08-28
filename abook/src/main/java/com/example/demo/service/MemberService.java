package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.example.demo.vo.MemberVo;

public interface MemberService {	
	public String member();
    public int useridCheck(MemberVo mvo);
    public String memberOk(MemberVo mvo,HttpServletRequest request);
    public String login();
    public String loginOk(MemberVo mvo, HttpSession session);
    public String logout(HttpSession session);
    public String idfind();
    public String idcheck(HttpServletRequest request);
    public String pwdfind();
    public String pwdcheck(HttpServletRequest request);
    public String newPwdCheck(HttpServletRequest request);
    public String updatePwd(MemberVo mvo);
}
