package com.example.demo.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.LoanstatusMapper;

@Service
@Qualifier("loans")
public class LoanstatusServiceImpl implements LoanstatusService{
	@Autowired
	private LoanstatusMapper mapper;

	@Override
	public String list(Model model) {
		ArrayList<HashMap> mapall=mapper.list();
		model.addAttribute("mapall",mapall);
		return "/loanstatus/list";
	}
}
