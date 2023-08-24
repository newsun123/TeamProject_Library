package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.ReserveSeatVo;

@Mapper
public interface ReserveSeatMapper {
public ReserveSeatVo getPc(String num);
}
