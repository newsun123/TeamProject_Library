package com.example.demo.service;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.MainMapper;

@Service
@Qualifier("main")
public class MainServiceImpl  implements MainService{
	@Autowired
	private MainMapper mapper;

	@Override
	public String main() {
		
		
		LocalDate day = LocalDate.now();

		int year = day.getYear();
		int month = day.getMonthValue();
	 
		for(int i=1;i<=day.lengthOfMonth();i++){
		   
			LocalDate xday=LocalDate.of(year, month, i);
			
			String imsi="";
		    if(xday.getDayOfWeek().getValue()==5){
			    imsi=imsi+xday.getDayOfMonth()+",";
		    }
		    System.out.println(imsi);
		    
		}
		
		return "/main/main";
	}

	@Override
	public String intro() {
		
		return "/introduce/intro";
	}

	@Override
	public String location() {
		
		return "/introduce/location";
	}
}

