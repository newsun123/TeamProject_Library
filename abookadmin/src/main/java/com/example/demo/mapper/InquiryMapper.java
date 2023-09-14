package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.InquiryVo;
import com.example.demo.vo.MtmVo;

@Mapper
public interface InquiryMapper {

	public int getChong();
	public ArrayList<InquiryVo> list(@Param("start") int start);
	public void setRownum(int r);
	public void readnum(InquiryVo ivo);
	public InquiryVo content(InquiryVo ivo);
	public void writeOk(MtmVo mvo);
	public MtmVo getAnswer(String no);
	
}
