package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.GongjiVo;

@Mapper
public interface GongjiMapper {
	
	public int getChong();
	public ArrayList<GongjiVo> list(String type,String keyword,int start);
	public ArrayList<GongjiVo> list2(String keyword,int start);
	public void readnum(String no);
	public GongjiVo content(GongjiVo gvo);
}
