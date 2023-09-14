<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#gongjiWrap{
		padding-bottom: 30px;
	}
	table{
		border-top: 2px solid #cecece;
	}
	table tr{
		height: 55px;
	}
	table tr td{
		border-bottom: 1px solid #e4e4e4;
		padding:0 10px;
	}
	table tr td:first-child {
		padding-left: 10px;
	    background: #f8f8fa;
	    width: 121px;
	    border-right: 1px solid #e4e4e4;
	    font-size: 15px;
	    font-family: 'NotoSansM';
	    color: #555;
	    letter-spacing: 1px;
	}
	table tr:nth-child(2){
		height: 300px;
	}
	table tr td#cont{
		vertical-align: top;
    	padding: 13px 10px;
	}
	#btn{
		text-align: center;
		padding: 30px 0;
	}
	#btn a{
		color: #fff;
	    text-align: center;
	    background: #4e68b9;
	    font-family: 'NotoSansM';
	    height: 50px;
	    width: 130px;
	    line-height:50px;
	    cursor: pointer;
	    margin: 0 2px;
	    border-radius: 3px;
	    display:inline-block;
	}
	#btn a.dis{
		background: #e0e3e6;
	    color: #6e7277;
	}
</style>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>묻고 답하기</span></h2>
				<ul id="lnb">
					<li class="on"><a href="/gongji/list"><span>공지사항</span></a></li>
					<li><a href="/inquiry/list"><span>묻고 답하기</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>묻고 답하기</h3>
					<p>열린공간&nbsp;&nbsp;>&nbsp;&nbsp;묻고 답하기</p>
				</div>
				<div id="contents">
					<div id="gongjiWrap">				
						<table> 
							<tr>
								<td>제목</td>
								<td>${ivo.title}</td>
							</tr>
							<tr>
								<td>내용</td>
								<td class="tl" id="cont"> 
									${ivo.content}
								</td>
							</tr>
							<tr>	
								<td> 답변 </td>
								<td class="tl" id="cont"> 
									${ivo.content}
								</td>	
							</tr>
							<tr>
								<td>등록일</td>
								<td class="tl">${ivo.writeday}</td>
							</tr>
						 </table>
						<div id="btn">
							<a href="list?no=${ivo.no}&page=${page}" class="dis">목록 </a>
							<a href="write"> 답변 등록 </a>
						</div>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>