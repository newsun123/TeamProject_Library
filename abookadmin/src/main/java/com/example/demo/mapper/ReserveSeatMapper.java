package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.TableNameVo;

@Mapper
public interface ReserveSeatMapper {
	public void stopTable(String tname);
	public void startTable(String tname);
	public ArrayList<TableNameVo> searchTable();
	
}
