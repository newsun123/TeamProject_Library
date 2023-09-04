package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.BookRequestVo;

@Mapper
public interface BookRequestMapper {
	public void requestwrite_ok(BookRequestVo brvo);
	public int getChong();
	public ArrayList<BookRequestVo> rlist(@Param("start") int start,BookRequestVo brvo);
	public BookRequestVo rcontent(BookRequestVo brvo);
	public BookRequestVo rupdate(String no);
	public void rupdate_ok(BookRequestVo brvo);
	public void delete(BookRequestVo brvo);
}
