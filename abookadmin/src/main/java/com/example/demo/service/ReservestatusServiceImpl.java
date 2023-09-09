package com.example.demo.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.ReservestatusMapper;
import com.example.demo.vo.BookregiVo;

@Service
@Qualifier("rsvs")
public class ReservestatusServiceImpl implements ReservestatusService{
	
	@Autowired
	private ReservestatusMapper mapper;

	@Override
	public String list(Model model) {
		
		ArrayList<HashMap> mapall=mapper.list();
		model.addAttribute("mapall",mapall);
		
		return "/reservestatus/list";
	}

	@Override
	public String rcheck(HttpServletRequest request) {
		
		String bcode=request.getParameter("bcode");
		String userid=request.getParameter("userid");
		mapper.rcheck(bcode);
		mapper.rcheck2(bcode);
		String bcode2=bcode.substring(0,4);
		mapper.cntupdate(bcode2);
		
		BookregiVo bvo=mapper.getbook(bcode);
		String title=bvo.getTitle();
		String publi=bvo.getPubli();
		String writer=bvo.getWriter();
		
		mapper.setloan(bcode,userid,title,publi,writer);
		mapper.delbreserve(bcode,userid);
		
		return "redirect:/reservestatus/list";
	}

	@Override
	public String dcheck(HttpServletRequest request) {
		
		String bcode=request.getParameter("bcode");
		String userid=request.getParameter("userid");
		String writeday=request.getParameter("writeday");
		
		mapper.dcheck(bcode);
		
		mapper.delbreserve(bcode,userid);
		
		BookregiVo bvo=mapper.getbook(bcode);
		String title=bvo.getTitle();
		String publi=bvo.getPubli();
		String writer=bvo.getWriter();
		
		mapper.setbrefuse(bcode,userid,writeday,title,publi,writer);
		return "redirect:/reservestatus/list";
	}


}
