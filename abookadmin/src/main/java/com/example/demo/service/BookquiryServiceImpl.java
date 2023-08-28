package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.BookquiryMapper;

@Service
@Qualifier("bq")
public class BookquiryServiceImpl {

	@Autowired
	@Qualifier("bq")
	private BookquiryMapper mapper;
}
