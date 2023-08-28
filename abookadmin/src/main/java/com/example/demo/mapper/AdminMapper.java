package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.AdminVo;

@Mapper
public interface AdminMapper {
	public ArrayList<AdminVo> list(AdminVo avo,@Param("start") int start);
	public String addbookcode(String bookcode);
	public void write_ok(AdminVo avo);
	public int getChong();
	public void addbookea(String no);
	public void delbookea(String no);
	public AdminVo content(AdminVo avo);
	public String getBcode();
	public void bookcodeOk();
}
