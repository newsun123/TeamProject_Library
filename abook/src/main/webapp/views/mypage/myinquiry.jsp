<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#rsvOkWrap{
		padding-bottom: 30px;
	}
	h4{
		font-size: 20px;
    	font-family: 'NotoSansM';
	}
	table{
		border-bottom: 1px solid #ddd;
    	border-top: 2px solid #cecece;
    	margin-top:30px;
		text-align: center;
	}
	table tr td {
    	border-bottom: 1px solid #ddd;
    	letter-spacing: 0.5px;
    	height: 60px;
	}
	table tr:last-child td{
		border-bottom: none;
	}
	table#table1{
		margin-bottom: 110px;
	}
	table tr:first-child td {
	    background-color: #f9f9fb;
	    border-bottom: 1px solid #ddd;
	    height: 55px;
	    color: #333;
	    font-family: 'NotoSansM';
	    text-align: center;
	} 
	table tr td.no{
		color: #666;
    	font-size: 14px;
    	text-align: center;
	}
	.btn1{
		background: #fff;
	    border: 1px solid #967759;
	    color: #967759;
	    font-size: 14px;
	    width: 110px;
	    height: 40px;
	    border-radius: 3px;
	}
	.el{
		width: 860px;
	   	padding: 0 20px 0 40px;
	    box-sizing: border-box;
	    height: 100%;
	    line-height: 60px;
	    text-align: left;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
</style>
</head>
<body>
<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>마이페이지</span></h2>
				<ul id="lnb">
					<li><a href="/mypage/mypage"><span>회원정보수정</span></a></li>
					<li><a href="/mypage/checkReserveSeat"><span>좌석예약현황</span></a></li>
					<li><a href="/mypage/bookreserve"><span>도서예약현황</span></a></li>
					<li><a href="/mypage/loanlist"><span>도서대출이력</span></a></li>
					<li><a href="/mypage/myjjim">도서찜리스트<span></span></a></li>
					<li class="on"><a href="/mypage/myinquiry"><span>문의현황</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>문의현황</h3>
					<p>마이페이지&nbsp;&nbsp;>&nbsp;&nbsp;문의현황</p>
				</div>
				<div id="contents">
					<div id="MypageWrap">
						<h4>답변 대기</h4>
						<table id="table1"> <!-- state=0 테이블 -->
							<tr>
								<td width="860">제목</td>
								<td width="180">등록일</td>
								<td width="130">조회수</td>
							</tr>
							<c:if test="${ilist.size()==0}">
							<tr>
								<td colspan="3" class="no">※문의한 내역이 없습니다</td>
							</tr>
							</c:if>
							<c:if test="${ilist.size()!=0}">
							<c:forEach items="${ilist}" var="ivo">
							<tr>
								<td><div class="el"><a href="/inquiry/content?no=${ivo.no}&mchk=1"">${ivo.title}</a></div></td>
								<td>${ivo.writeday }</td>
								<td>${ivo.readnum}</td>
							</tr>
							</c:forEach>
							</c:if>	
						</table>
						<h4>문의 완료</h4>
						<table id="table2"> <!-- state=1 테이블 -->
							<tr>
								<td width="860">제목</td>
								<td width="180">등록일</td>
								<td width="130">조회수</td>
							</tr>
							<c:if test="${alist.size()==0}">
							<tr>
								<td colspan="3" class="no">※문의한 내역이 없습니다</td>
							</tr>
							</c:if>
							<c:if test="${alist.size()!=0}">
							<c:forEach items="${alist}" var="ivo2">
							<tr>
								<td><div class="el"><a href="/inquiry/content?no=${ivo2.no}&mchk=1">${ivo2.title}</a></div></td>
								<td>${ivo2.writeday }</td>
								<td>${ivo2.readnum}</td>
							</tr>
							</c:forEach>
							</c:if>	
						</table>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>