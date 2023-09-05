package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.ReserveSeatVo;

@Mapper
public interface MypageMapper {
	public ArrayList<ReserveSeatVo> reserveok(String userid);
	public ArrayList<HashMap> bookReserve(String userid);
}
