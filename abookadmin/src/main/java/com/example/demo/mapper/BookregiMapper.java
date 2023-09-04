package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.BookregiVo;

@Mapper
public interface BookregiMapper {
	public void write_ok(BookregiVo bvo);
	public String getCode();
	public ArrayList<BookregiVo> list(BookregiVo bvo,@Param("start") int start);
	public int getChong();
	public ArrayList<BookregiVo> content(String bcode);
}
