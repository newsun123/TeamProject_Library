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
	// 0909 강서영 백업
	public ArrayList<HashMap> bookreserve(String userid);
	public ArrayList<HashMap> bookloan(String userid);
	public ArrayList<HashMap> bookrefuse(String userid);
	public void brsvCancel(String bcode);
	public void changeState(String bcode);
	public void giganUpdate(String no);
	public void returnOk(String no);
	public ArrayList<HashMap> loanlist(String userid);
	// jjim추가 0911
	public ArrayList<HashMap> myjjim(String userid);

}
