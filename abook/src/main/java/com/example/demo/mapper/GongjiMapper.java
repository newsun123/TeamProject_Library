package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.GongjiVo;

@Mapper
public interface GongjiMapper {
	
	public int getChong();
	public ArrayList<GongjiVo> list(@Param("start") int start);
	public void readnum(String no);
	public GongjiVo content(GongjiVo gvo);
}
