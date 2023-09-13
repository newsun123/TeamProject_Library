package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.InquiryVo;

@Mapper
public interface InquiryMapper {
	
	public int getChong();
	public ArrayList<InquiryVo> list(@Param("start") int start);
	public void writeOk(InquiryVo ivo);
	public void setRownum(int r);
	public void readnum(InquiryVo ivo);
}
