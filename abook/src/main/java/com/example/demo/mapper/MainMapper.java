package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainMapper {
	public int checkSeatNomal(String time);
	public int checkSeatPc(String time);

}
