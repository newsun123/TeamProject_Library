package com.example.demo.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.ReserveSeatMapper;
import com.example.demo.vo.TableNameVo;

@Service
@Qualifier("rs")
public class ReserveSeatServiceImpl implements ReserveSeatService {

	@Autowired
	private ReserveSeatMapper mapper;

	@Override
	public String reserveseat(Model model) {
		ArrayList<TableNameVo> list = mapper.searchTable();
		model.addAttribute("list",list);
		return "/rsvseat/reserveseat";
	}

	@Override
	public String stopTable(HttpServletRequest req, Model model) {
		String tname= req.getParameter("tname");
		mapper.stopTable(tname);
		return "redirect:/rsvseat/reserveseat";
	}

	@Override
	public String startTable(HttpServletRequest req, Model model) {
		String tname= req.getParameter("tname");
		mapper.startTable(tname);
		return "redirect:/rsvseat/reserveseat";
	}

	@Override
	public String cancelseat() {
		// TODO Auto-generated method stub
		return "rsvseat/cancelseat";
	}
	
}
