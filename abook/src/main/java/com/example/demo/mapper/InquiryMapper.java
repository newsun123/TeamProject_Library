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
	public void writeOk(InquiryVo ivo);
	public void setRownum(int r);
	public void readnum(InquiryVo ivo);
	public InquiryVo content(InquiryVo ivo);
	public void delete(InquiryVo ivo);
	public void update(InquiryVo ivo);
	public void updateOk(InquiryVo ivo);
	public MtmVo getAnswer(String no);
	public InquiryVo getState(int state,int no);

}
