package com.example.demo.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.LoanstatusMapper;
import com.example.demo.vo.BookLoanVo;

@Service
@Qualifier("loans")
public class LoanstatusServiceImpl implements LoanstatusService{
	@Autowired
	private LoanstatusMapper mapper;

	@Override
	public String list(Model model) {
		ArrayList<BookLoanVo> blist=mapper.list();
		model.addAttribute("blist",blist);
		
		
		// 대여기간이 지난 책을 자동으로 반납상태로 만들기 (state=1로 만들기)
		LocalDate date = LocalDate.now();
		String today = date.toString().substring(0,10);
		// System.out.println(today); 2023-09-15 확인 완료
		for(int i=0;i < blist.size(); i++) {
			String rday = blist.get(i).getReturnday(); 
			
		}
		
		return "/loanstatus/list";
	}

	@Override
	public String loanBook(HttpServletRequest req) {
		String no = req.getParameter("no");
		
		mapper.loanBook(no);
		
		return "redirect:/loanstatus/list";
	}
}
