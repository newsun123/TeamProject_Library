package com.example.demo.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.MainMapper;
import com.example.demo.vo.GongjiVo;

@Service
@Qualifier("main")
public class MainServiceImpl  implements MainService{
	@Autowired
	private MainMapper mapper;

	@Override
	public String main(GongjiVo gvo,Model model,HttpServletRequest req) {

		//String page=req.getParameter("page");
  
		LocalDate day = LocalDate.now();

		int year = day.getYear();
		int month = day.getMonthValue();

		for(int i=1;i<=day.lengthOfMonth();i++){
     
			LocalDate xday=LocalDate.of(year, month, i);
	     
			String imsi="";
			
			if(xday.getDayOfWeek().getValue()==5){
				imsi=imsi+xday.getDayOfMonth()+",";
			}
		//System.out.println(imsi);  
		}
  

		ArrayList<GongjiVo> glist=mapper.gongji(gvo);
		model.addAttribute("glist",glist);
  
		// 09월 08일 최윤도 작성- 메인 페이지 내 좌석 체크
		String allTime = LocalTime.now().toString();
		String hour = allTime.substring(0,2);
		// System.out.println(hour);
   
		// 현재 시의 숫자를 확인하여 숫자 붙이기
		String time = "time"+hour;
		// System.out.println(time); 확인 완료.
   
		// main 페이지 현재 남은 좌석 만들기
   
		int pc,nomal; // 기본 페이지 만들기       
   
		// 예약 가능한 시간이 아닐 때, 그냥 전부 없애기로 함. 0912 추가
		if(time=="time9"||time=="time10"||time=="time11"||time=="time12"||time=="time13"||time=="time14"||time=="time15"||time=="time16"||time=="time17"||time=="time18") {
  
			// 현재 시간에 좌석이 몇개 남았는지 확인할 쿼리문 작성
			pc = mapper.checkSeatPc(time);
			nomal = mapper.checkSeatNomal(time);          
			//System.out.println(nomal+"/"+pc); 
			// 총 좌석 - 가져온 값
			int setPc = 24 - pc;
			int setN = 40 - nomal;
			// System.out.println(setN);
			// 값 전달
			model.addAttribute("pc",pc);
			model.addAttribute("nomal",nomal);
			model.addAttribute("setN",setN);
			model.addAttribute("setPc",setPc);
		} else {
			pc = 24;
			nomal = 40;
			int setPc = 24 - pc;
			int setN = 40 - nomal;
      
			model.addAttribute("pc",pc);
			model.addAttribute("nomal",nomal);
			model.addAttribute("setN",setN);
			model.addAttribute("setPc",setPc);
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

