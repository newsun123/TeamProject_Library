package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.BookRequestVo;
import com.example.demo.vo.BookregiVo;

@Mapper
public interface BookregiMapper {
	public void write_ok(BookregiVo bvo);
	public void write_ok(BookregiVo bvo,BookRequestVo brvo);
	public String getCode();
	public ArrayList<BookregiVo> list(BookregiVo bvo, int start);
	public int getChong();
	public ArrayList<BookregiVo> content(String bcode);
	// 0909 강서영
	public BookregiVo getlist(String bcode);
	public void add(BookregiVo bvo);
	public void beaUpdate(String bcode,int n);
	public void del(String bcode);
	public int getcnt(String bcode);
	public void statechange(BookRequestVo brvo);
}
