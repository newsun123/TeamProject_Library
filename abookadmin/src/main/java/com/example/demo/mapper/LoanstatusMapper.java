package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.BookLoanVo;

@Mapper
public interface LoanstatusMapper {
	public ArrayList<BookLoanVo> list();
	public void loanBook(String no);
}
