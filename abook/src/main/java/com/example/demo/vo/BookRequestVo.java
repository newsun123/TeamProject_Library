package com.example.demo.vo;

import lombok.Data;

@Data
public class BookRequestVo {
	private int no,gonge;
	private String bname,writer,writetime,publisher,ect,userid,bwriteday;
	private int state;
}
