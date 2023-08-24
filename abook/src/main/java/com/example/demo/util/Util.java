package com.example.demo.util;

import java.time.LocalDate;

public class Util {
	
	public static void main(String[] args) {
		
		for(int i=1;i<=12;i++) {
			LocalDate mt=LocalDate.of(2023, i, 1);
			System.out.println(mt);
		}
	}
}
