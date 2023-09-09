<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#MypageWrap{
		padding-bottom:80px; 
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
					<li class="on"><a href="/mypage/loanlist"><span>도서대출리스트</span></a></li>
					<li><a href="#"><span>1:1문의현황</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>도서대출리스트</h3>
					<p>마이페이지&nbsp;&nbsp;>&nbsp;&nbsp;도서대출리스트</p>
				</div>
				<div id="contents">
					<div id="MypageWrap">
						<table>
							<tr>
								<td>도서명</td>
								<td>출판사</td>
								<td>저자</td>
								<td>대출일</td>
								<td>반납일</td>
							</tr>
						<c:forEach items="${mapall}" var="map">
							<tr>
								<td>${map.title}</td>
								<td>${map.publi}</td>
								<td>${map.writer}</td>
								<td>${map.rental}</td>
								<td>${map.writeday}</td>
							</tr>
						</c:forEach>
						</table>			
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>