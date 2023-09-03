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
		position: relative;
		border:4px solid #f1f1f1;
	    padding: 7px;
	    text-align: center;
	}
	#mypage {
		padding: 50px 0;
	}
	#mypage h3{
		color:#333;
		font-size:25px;
		font-family: NotoSansM;
		margin-bottom: 20px;
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
					<li><a href="/mypage/mypage"><span>회원정보 수정</span></a></li>
					<li class="on"><a><span>좌석 예약현황</span></a></li>
					<li><a href=""><span>도서 예약현황</span></a></li>
					<li><a href=""><span>1:1 문의 현황</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>좌석 예약현황</h3>
					<p>마이페이지&nbsp;&nbsp;>&nbsp;&nbsp;좌석 예약현황</p>
				</div>
				<div id="contents">
					<div id="rsvOkWrap">
					<h2 style="font-size:20px; margin-top:30px;font-family: NotoSansM;"> 좌석 예약 완료</h2>
					<div id="rsvouter">
						<div id="inner">
						<div>${userid} 님의 예약내역입니다. </div>
						<c:forEach items="${rlist}" var="rvo" varStatus="status">
						<div>예약 테이블 : ${rvo.tname} &nbsp; 예약시간: ${rvo.reserveday} / ${timelist.get(status.index)} &nbsp; <input type="button" value="예약취소하기"></div>
						</c:forEach>
						</div>
					</div>
				</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>