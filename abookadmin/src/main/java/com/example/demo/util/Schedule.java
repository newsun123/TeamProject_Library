package com.example.demo.util;

import java.time.LocalDate;
import java.time.chrono.ChronoLocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.ScheduleMapper;

@Service
public class Schedule {
	
	@Autowired
	private ScheduleMapper mapper;

//	@Scheduled(cron="0 0 6 * * *")
//	public void firstSchedule() {
//		LocalDate date = LocalDate.now();
//		String day = date.toString();
//	} 하래서 하고 있었는데 갑자기 다릏게 하래. 아오 
	
	//@Scheduled(cron="")
}
