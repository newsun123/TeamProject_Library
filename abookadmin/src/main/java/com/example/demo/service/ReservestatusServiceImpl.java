package com.example.demo.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.ReservestatusMapper;

@Service
@Qualifier("rsvs")
public class ReservestatusServiceImpl implements ReservestatusService{
	
	@Autowired
	private ReservestatusMapper mapper;

	@Override
	public String rslist(Model model) {
		ArrayList<HashMap> mapall=mapper.rslist();
		model.addAttribute("mapall",mapall);
		return "/reservestatus/rslist";
	}

	@Override
	public String rcheck(HttpServletRequest request) {
		String bcode=request.getParameter("bcode");
		mapper.rcheck(bcode);
		mapper.rcheck2(bcode);
		return "redirect:/reservestatus/rslist";
	}


}
