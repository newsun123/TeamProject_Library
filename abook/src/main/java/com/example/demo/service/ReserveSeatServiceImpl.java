package com.example.demo.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.ReserveSeatMapper;
import com.example.demo.vo.ReserveSeatVo;
import com.example.demo.vo.TableNameVo;

@Service
@Qualifier("rs")
public class ReserveSeatServiceImpl implements ReserveSeatService {

	@Autowired
	private ReserveSeatMapper mapper;

	@Override
	public String reserveseat() {
		// TODO Auto-generated method stub
		return "/seat/reserveseat";
	}

	@Override
	public String rulelibrary() {
		// TODO Auto-generated method stub
		return "/seat/rulelibrary";
	}

	@Override
	public TableNameVo tableName(TableNameVo tvo, HttpServletRequest request, Model model) {
		String tname = request.getParameter("tname");
		tvo = mapper.tableName(tname);
		return tvo;
	}
	
	
	
	
}
