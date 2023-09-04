package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.MemberVo;

@Mapper
public interface MemberMapper {
	public int getChong();
	public ArrayList<MemberVo> mlist(@Param("start") int start,MemberVo mvo);
	
}
