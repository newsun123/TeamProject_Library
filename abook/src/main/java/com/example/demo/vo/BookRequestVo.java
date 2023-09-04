package com.example.demo.vo;

import lombok.Data;

@Data
public class BookRequestVo {
	private int no,gonge;
	private String bname,writer,writetime,publisher,ect,userid,bwriteday;
	private int state;
	
	private String type; // 검색 타입
	private String keyword; // 검색 내용
}
