package com.example.demo.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.MemberMapper;
import com.example.demo.vo.MemberVo;

@Service
@Qualifier("ms")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Override
	public String member(Model model) {
		ArrayList<MemberVo> mlist = mapper.memberAll();
		model.addAttribute("mlist",mlist);
		return "/member/member";
	}

	@Override
	public String memberBan(Model model) {
		ArrayList<MemberVo> mlist = mapper.memberAll();
		model.addAttribute("mlist",mlist);
		return "member/memberBan";
	}

	@Override
	public String detail(Model model,HttpServletRequest req) {
		String userid = req.getParameter("userid");
		HashMap map = mapper.detail(userid);
		model.addAttribute("map",map);
		return null;
	}
	
	
}
