package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.BookregiVo;
import com.example.demo.vo.GongjiVo;

@Mapper
public interface MainMapper {

	public ArrayList<GongjiVo> gongji(GongjiVo gvo);
	public int checkSeatNomal(String time);
	public int checkSeatPc(String time);
	public ArrayList<BookregiVo> bookList();
	public ArrayList<BookregiVo> bestBookList();
	public ArrayList<BookregiVo> list2(String keyword);

}
