package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.InquiryVo;

@Mapper
public interface InquiryMapper {

	public int getChong();
	public ArrayList<InquiryVo> list(@Param("start") int start);
	public void setRownum(int r);
	public void readnum(InquiryVo ivo);
	public InquiryVo content(InquiryVo ivo);
	public void writeOk(InquiryVo ivo);
	// 질문 가져오기
	public ArrayList<InquiryVo> getMtm(String userid);
}
