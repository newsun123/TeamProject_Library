package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.MemberVo;

@Mapper
public interface MemberMapper {	
	 public int useridCheck(MemberVo mvo);
	 public void memberOk(MemberVo mvo);
	 public String loginOk(MemberVo mvo);
	 public String idcheck(String name,String phone);
	 public String pwdcheck(String userid,String name,String phone);
	 
}
