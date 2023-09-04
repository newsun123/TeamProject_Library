package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.ReserveSeatService;

@Controller
public class ReserveSeatController {

	@Autowired
	@Qualifier("rs")
	private ReserveSeatService service;
	
	@RequestMapping("/rsvseat/reserveseat")
	public String reserveseat() {
		return service.reserveseat();
	}
}
