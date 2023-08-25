package com.example.demo.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.ReserveSeatMapper;
import com.example.demo.vo.ReserveSeatVo;

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
	public String tableName(HttpServletRequest request, Model model) {
		try {
			String num = request.getParameter("num");			
			model.addAttribute("tvo",mapper.getTableName(num));
			return "0";
		}catch(Exception e) {
			return "1";
		}
		
	}

	@Override
	public String rulelibrary() {
		// TODO Auto-generated method stub
		return "/seat/rulelibrary";
	}

	
}
