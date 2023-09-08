package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.ReservestatusVo;

@Mapper
public interface ReservestatusMapper {
	public ArrayList<HashMap> rslist();
	public void rcheck(String bcode);
	public void rcheck2(String bcode); 
}
