package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.MemberVo;

@Mapper
public interface MemberMapper {
	public ArrayList<MemberVo> memberAll();
	public HashMap detail(String userid);
}
