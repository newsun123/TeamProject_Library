package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.ReserveSeatVo;
import com.example.demo.vo.TableNameVo;

@Mapper
public interface MypageMapper {
	public ArrayList<ReserveSeatVo> reserveok(String userid);
	public ArrayList<HashMap> reserveToday(String userid, String today);
	public void cancelSeat(String no);
	public void resetTablename(String time,String tname);
}
