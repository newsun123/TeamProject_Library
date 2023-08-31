package com.example.demo.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.ReserveSeatMapper;
import com.example.demo.vo.ReserveSeatVo;
import com.example.demo.vo.TableNameVo;

@Service
@Qualifier("rs")
public class ReserveSeatServiceImpl implements ReserveSeatService {

	@Autowired
	private ReserveSeatMapper mapper;

	@Override
	public String reserveseat(HttpSession session, Model model) {
		if (session.getAttribute("userid") == null) {
			return "redirect:/member/login";
		} else {
			String name = session.getAttribute("name").toString();
			model.addAttribute(name);
			return "/seat/reserveseat";
		}
	}

	@Override
	public String rulelibrary() {
		// TODO Auto-generated method stub
		return "/seat/rulelibrary";
	}

	@Override
	public TableNameVo tableName(HttpServletRequest request, Model model) {
		String tname = request.getParameter("tname");
		
		TableNameVo tvo = mapper.tableName(tname);
		return tvo;
	}

	@Override
	public String reserveSeater(ReserveSeatVo rvo, HttpSession session, HttpServletRequest request) {
		String userid = session.getAttribute("userid").toString();
		// 배열로 만들어 time value값 가져오기
		String aa = request.getParameter("arrychktime");
		String[] imsi = aa.split(",");

		rvo.setUserid(userid);
		rvo.setTname(request.getParameter("tname"));
		System.out.println(rvo.getTime12());

		mapper.reserveSeater(rvo); // 유저아이디 값 들어간 예약테이블
		// tablename 테이블에 시간 추가 적기(배열이용하기)
		for (int i = 0; i < imsi.length; i++) {
			if (imsi[i].equals("1")) {
				mapper.updateTableName("time" + (i + 9), rvo.getTname()); // time+숫자 , tname 사용
			}
		}

		return "redirect:/seat/reserveok?userid="+userid;
	}

	@Override
	public String reserveok(HttpServletRequest req, Model model) {
		String userid=req.getParameter("userid");
		ReserveSeatVo rvo = mapper.reserveok(userid);
		model.addAttribute("rvo",rvo);
		//시간 값이 int로 들어가서 값을 스트링으로 들여보내려고 노가다함.
		int time9 = rvo.getTime9();
		int time10 = rvo.getTime10();
		int time11 = rvo.getTime11();
		int time12 = rvo.getTime12();
		int time13 = rvo.getTime13();
		int time14 = rvo.getTime14();
		int time15 = rvo.getTime15();
		int time16 = rvo.getTime16();
		int time17 = rvo.getTime17();
		int time18 = rvo.getTime18();
		
		String times = "";
		if(time9 == 1)
			times = times + "9시~10시, ";
		if(time10 == 1)
			times = times + "10시~11시, ";
		if(time11 == 1)
			times = times + "11시~12시, ";
		if(time12 == 1)
			times = times + "12시~13시, ";
		if(time13 == 1)
			times = times + "13시~14시, ";
		if(time14 == 1) 
			times = times + "14시~15시, ";
		if(time15 == 1) 
			times = times + "15시~16시, ";
		if(time16 == 1) 
			times = times + "16시~17시, ";			
		if(time17 == 1) 
			times = times + "17시~18시, ";			
		if(time18 == 1) 
			times = times + "18시~19시, ";	
		String time = times.substring(0, times.length()-2); // 마지막 ,를 자르기 위해 사용
		
		
		model.addAttribute("time",time);
		
		return "/seat/reserveok";
	}

}
