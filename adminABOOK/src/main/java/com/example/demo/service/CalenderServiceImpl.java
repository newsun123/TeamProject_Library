package com.example.demo.service;

import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.CalenderMapper;

@Service
@Qualifier("cc")
public class CalenderServiceImpl implements CalenderService {

	@Autowired
	private CalenderMapper mapper;

	@Override
	public String calender(HttpServletRequest request,Model model) {
		
		LocalDate today=LocalDate.now();
		int year=today.getYear();
		int month=today.getMonthValue();
		
		LocalDate xday=LocalDate.of(year, month, 1);	
		int chong=xday.lengthOfMonth();
		int yoil=xday.getDayOfWeek().getValue();
		int ju=(int)Math.ceil( (chong+yoil)/7.0 );
		
		
		String str="";
		switch(str)
		{
			case "0" : str="class='sunday'"; break;
			case "6" : str="class='saterday'"; break;
		}
		
		model.addAttribute("str",str);
		model.addAttribute("yoil",yoil);
		model.addAttribute("chong",chong);
		model.addAttribute("ju",ju);
		
		return "/calender/calender";
	}
	
	
}
