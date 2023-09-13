package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.BookregiVo;

@Mapper
public interface BreserveMapper {
	public ArrayList<BookregiVo> list(String type,String keyword,int start);
	public ArrayList<BookregiVo> list2(String title,String publi,String writer,String keyword,int start);
	public int getChong();
	public ArrayList<HashMap> content(String bcode);
	public void bresOk(String userid,String bcode);
	public void bresUpdate(String bcode);
	public int cntCheck(String userid);
	public void addjjim(String userid,String bcode);
	public void deljjim(String userid,String bcode);
	public boolean jjimCheck(String userid,String bcode);
	public ArrayList<BookregiVo> bestBookList(String type,String keyword,int start);
}
