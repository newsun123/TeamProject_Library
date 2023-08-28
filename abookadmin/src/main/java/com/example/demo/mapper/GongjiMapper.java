package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.GongjiVo;

@Mapper
public interface GongjiMapper {
	
	public ArrayList<GongjiVo> list(@Param("start") int start);
	public void writeOk(GongjiVo gvo);
	public GongjiVo content(GongjiVo gvo);
	public void delete(GongjiVo gvo);
	public void update(GongjiVo gvo);
	public void updateOk(GongjiVo gvo);
	public int getChong();
}
