package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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
		
		String email1=request.getParameter("email1");
		String email2=request.getParameter("email2");
		String email=email1+"@"+email2;
		
		String zip_code=request.getParameter("zip_code");
		String addr=request.getParameter("addr");
		String addr_dtl=request.getParameter("addr_dtl");
		String juso=zip_code+" "+addr+" "+addr_dtl;
		
		mvo.setEmail(email);
		mvo.setJuso(juso);
		
		mapper.memberOk(mvo); 
		
		return "/member/login";
	}
	
	
}
