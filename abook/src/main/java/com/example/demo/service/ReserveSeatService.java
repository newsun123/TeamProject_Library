package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.example.demo.vo.TableNameVo;

public interface ReserveSeatService {

	public String reserveseat();
	public String rulelibrary();
	public String tableName(TableNameVo tvo, HttpServletRequest request,Model model);
	
}
