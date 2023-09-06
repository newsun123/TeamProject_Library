package com.example.demo.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.MypageMapper;
import com.example.demo.vo.ReserveSeatVo;
import com.example.demo.vo.TableNameVo;

@Service
@Qualifier("ms")
public class MypageServiceImple implements MypageService {

	@Autowired
	private MypageMapper mapper;
	
	@Override
	public String checkReserveSeat(HttpSession ss,Model model) {
		
		//전체 예약 현황 mapper 만들어 보내기
		String userid = ss.getAttribute("userid").toString();
		model.addAttribute("userid",userid); 
		
		//System.out.println(userid);
		
		ArrayList<ReserveSeatVo> rlist = mapper.reserveok(userid); 
		
		model.addAttribute("rlist",rlist);
		
		//시간 값이 int로 들어가서 값을 스트링으로 들여보내려고 노가다함.
		ArrayList<String> timelist = new ArrayList<String>();
		
		for (int i = 0; i < rlist.size(); i++) {
			String time = "";
			int time9 = rlist.get(i).getTime9();
			int time10 = rlist.get(i).getTime10();
			int time11 = rlist.get(i).getTime11();
			int time12 = rlist.get(i).getTime12();
			int time13 = rlist.get(i).getTime13();
			int time14 = rlist.get(i).getTime14();
			int time15 = rlist.get(i).getTime15();
			int time16 = rlist.get(i).getTime16();
			int time17 = rlist.get(i).getTime17();
			int time18 = rlist.get(i).getTime18();
			
			if(time9 == 1)
				time = time + "9시~10시,";
			if(time10 == 1)
				time = time + "10시~11시,";
			if(time11 == 1)
				time = time + "11시~12시,";
			if(time12 == 1)
				time = time + "12시~13시,";
			if(time13 == 1)
				time = time + "13시~14시,";
			if(time14 == 1) 
				time = time + "14시~15시,";
			if(time15 == 1) 
				time = time + "15시~16시,";
			if(time16 == 1) 
				time = time + "16시~17시,";			
			if(time17 == 1) 
				time= time + "17시~18시,";			
			if(time18 == 1) 
				time = time + "18시~19시,";	
			
			time=time.substring(0, time.length()-1); // 마지막 ,를 자르기 위해 사용
		    //System.out.println(time.length());
			timelist.add(time);
		}
		
		model.addAttribute("timelist",timelist);
		
		// 당일 예약현황 만들기
		
		String today = LocalDate.now().toString(); // 당일 날짜 가져오기
		
		ArrayList<HashMap> mapall = mapper.reserveToday(userid,today);
		
		model.addAttribute("mapall",mapall);
		

		return "/mypage/checkReserveSeat";
	}

	@Override
	public String cancelSeat(HttpServletRequest req,HttpSession ss) {
		String no = req.getParameter("no");
		String userid = ss.getAttribute("userid").toString();
		// tablename의 time 찾아서 0으로 만들기
		TableNameVo tvo = mapper.searchReserveSeat(userid,no);
		//지울 값은 가져왔는데, 이제 이거에서 1이 체크된 것을 골라서 0으로 바꿔야하는데
		//그걸 어떻게 할지 생각을 해야댐
		// reserveday 삭제
		mapper.cancelSeat(no);
		
		
		
		return null;
	}

	
	
	
}
