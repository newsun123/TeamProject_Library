package com.example.demo.service;

import java.time.LocalDate;
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

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Service
@Qualifier("rs")
public class ReserveSeatServiceImpl implements ReserveSeatService {

	@Autowired
	private ReserveSeatMapper mapper;

	
	@Override
	public String chkReserveSeat(HttpSession session, Model model) {
		String userid = session.getAttribute("userid").toString();
		String time = LocalDate.now().toString();
		System.out.println(time);
		int total = mapper.totalTime(userid,time);
		model.addAttribute("total",total);
		return "redirect:/seat/reserveseat?total="+total;
	}
	
	
	@Override
	public String reserveseat(HttpSession session, Model model,HttpServletRequest req) {
		ArrayList<TableNameVo> list =mapper.searchTable();
		model.addAttribute("list",list);
		String total = req.getParameter("total");
		
		if (session.getAttribute("userid") == null) {
			return "redirect:/member/login";
		} else {
			String name = session.getAttribute("name").toString();
			model.addAttribute(name);
			model.addAttribute("total",total);
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
		
		
		model.addAttribute("userid",userid);
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
		
		return "/seat/reserveok";
	}

	

}
