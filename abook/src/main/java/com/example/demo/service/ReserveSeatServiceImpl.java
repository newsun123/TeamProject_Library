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
	public TableNameVo tableName(TableNameVo tvo, HttpServletRequest request, Model model) {
		String tname = request.getParameter("tname");
		tvo = mapper.tableName(tname);
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

		return "redirect:/seat/reserveseat";
	}

}
