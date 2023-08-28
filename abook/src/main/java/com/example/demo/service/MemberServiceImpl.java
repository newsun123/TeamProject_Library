package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.MemberMapper;
import com.example.demo.vo.MemberVo;

@Service
@Qualifier("mems")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public String member() {
	
		return "/member/member";
	}

	@Override
	public int useridCheck(MemberVo mvo) {

		return mapper.useridCheck(mvo); 
	}

	@Override
	public String memberOk(MemberVo mvo,HttpServletRequest request) {

		mapper.memberOk(mvo); 
		
		return "/member/login";
	}

	@Override
	public String login() {
		
		return "/member/login";
	}

	@Override
	public String loginOk(MemberVo mvo, HttpSession session) {
		
		String name=mapper.loginOk(mvo);
		
		if(name==null){
			return "redirect:/member/login?chk=1";
		}else{
			session.setAttribute("userid", mvo.getUserid());
			session.setAttribute("name", name);

			return "/main/main";
		}

	}
	
	@Override
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/main";
	}

	@Override
	public String idfind() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String idcheck(HttpServletRequest request) {
		
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");	
		String userid=mapper.idcheck(name,phone);
		
		return userid;
	}

	@Override
	public String pwdfind() {
		
		return "/member/pwdfind";
	}

	@Override
	public String pwdcheck(HttpServletRequest request) {
		
		String userid=request.getParameter("userid");
		String name=request.getParameter("name");	
		String phone=request.getParameter("phone");	
		
		String n=mapper.pwdcheck(userid, name, phone);
		
		System.out.println(n);
		return n;
	}	
}
