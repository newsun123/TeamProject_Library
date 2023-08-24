package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.MemberVo;

@Mapper
public interface MemberMapper {	
	 public int useridCheck(MemberVo mvo);
	 public void memberOk(MemberVo mvo);
}
