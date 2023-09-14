package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.MemberVo;
import com.example.demo.vo.ReserveSeatVo;

@Mapper
public interface MemberMapper {
	public ArrayList<MemberVo> memberAll();
	public HashMap detail(String userid);
	public ArrayList<ReserveSeatVo> rSeat(String userid);
	public void banOk(String userid,String breason);
	public void unsusBan(String userid);
}
