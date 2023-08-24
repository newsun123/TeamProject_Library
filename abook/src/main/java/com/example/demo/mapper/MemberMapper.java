package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.MemberVo;

@Mapper
public interface MemberMapper {	
	 public int useridCheck(MemberVo mvo);
	 public void memberOk(MemberVo mvo);
	 public ArrayList<HashMap> jjimView(String userid);
}
