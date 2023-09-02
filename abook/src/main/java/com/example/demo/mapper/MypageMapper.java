package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.ReserveSeatVo;

@Mapper
public interface MypageMapper {
	public ArrayList<ReserveSeatVo> reserveok(String userid);

}
