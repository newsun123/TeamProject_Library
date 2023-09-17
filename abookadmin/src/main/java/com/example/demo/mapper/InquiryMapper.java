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
	public void setRownum(int start);
	public InquiryVo content(int no);
	public void writeOk(MtmVo mvo);
	public MtmVo getAnswer(int no);
	public void chgState(MtmVo mvo);
	public void updateOk(MtmVo mvo);
}
