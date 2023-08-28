package com.example.demo.service;

import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;

import com.example.demo.mapper.AdminMapper;
import com.example.demo.vo.AdminVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;
	
	public String list(Model model,AdminVo avo,HttpServletRequest request)
	{
		int page;
		if(request.getParameter("page")==null)
		{
			page=1;
		}
		else
		{
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		// start구하기
		int start=(page-1)*10;
		
		// pstart,pend,chong
		int pstart=page/10;
		if(page%10==0)
		{
			pstart--;
		}
		pstart=pstart*10+1;
		
		int pend=pstart+9;
		
		// pend가 chong보다 클경우
		int chong=mapper.getChong();
		if(pend>chong)
		{
			pend=chong;
		}
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("alist",mapper.list(avo,start));
		
		return "/admin/list";
		
	}
	
	public String write()
	{
		return "/admin/write";
	}
	
	
	
	public String write_ok(AdminVo avo,HttpServletRequest request,Model model)
	{
		LocalDate today=LocalDate.now();
		int year=today.getYear();
		int month=today.getMonth().getValue();
		int date=today.getDayOfMonth();
		
		String mon=month+"";
		if(mon.length()==1)
			mon="0"+mon;
		String dat=date+"";
		if(dat.length()==1)
			dat="0"+dat;
		
		
		
		String bookcode="b"+year+mon+dat;
		
		//mapper.addbookcode(String bookcode);
		
		int num=1;
		
		String num2=num+"";
		if(num2.length()==1)
			num2="00"+num2;
		else if(num2.length()==2)
			num2="0"+num2;
		
		bookcode=bookcode+num2;
		
		model.addAttribute("bookcode",bookcode);
		
		int size=1024*1024*100;
		try
		{
			String path=ResourceUtils.getFile("classpath:static/img/admin").toPath().toString();
			MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
			avo.setBookname(multi.getParameter("bookname"));
			avo.setWriter(multi.getParameter("writer"));
			avo.setPublisher(multi.getParameter("publisher"));
			avo.setWritetime(multi.getParameter("writetime"));
			avo.setBookea(multi.getParameter("bookea"));
			String bookimg=multi.getFilesystemName("bookimg");
			System.out.println(bookimg);
			if(bookimg==null)
			{
				bookimg="";
			}
			avo.setBookimg(bookimg);
			avo.setEct(multi.getParameter("ect"));

			mapper.write_ok(avo);
			mapper.bookcodeOk();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return "redirect:/admin/list";
	}

	@Override
	public String addbookea(HttpServletRequest request) {

		String no=request.getParameter("bookId");
		// System.out.println(no);
		try
		{
			mapper.addbookea(no);
			return "200";
		}
		catch(Exception e)
		{
			return "1";
		}
	}

	@Override
	public String delbookea(HttpServletRequest request) {
		
		String no=request.getParameter("bookId");
		
		try
		{
			mapper.delbookea(no);
			return "200";
		}
		catch(Exception e)
		{
			return "1";
		}
	}

	@Override
	public String content(AdminVo avo, HttpServletRequest request, Model model) {
		
		String page=request.getParameter("page");
		String no=request.getParameter("no");
		
		model.addAttribute("page",page);
		model.addAttribute("avo",mapper.content(avo));
		
		return "/admin/content";
	
}

	@Override
	public String getBcode(Model model) {
		
			String bcode=mapper.getBcode();
			model.addAttribute("bcode",bcode);
			return bcode;

			

	}
}