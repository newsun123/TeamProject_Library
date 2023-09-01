<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
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
    height: 430px; /* 들어갈 내용이 적어 height 적용 */
    
	}
#rsvouter {
	position: absolute;
    width: 633px;
    height: 210px;
    left: 264px;
    top: 102px;
}
#inner {
	margin-top: 40px;
}
#inner div {
	margin-bottom:10px;
	font-family: NotoSansM;
	font-size: 16px;
}
input[type=button] {
	width:100px;
	height:50px;
	border: 2px solid #f3ede3;
	background:#f3ede3;
	border-radius: 6px;
}
</style>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>열람실 이용</span></h2>
				<ul id="lnb">
					<li><a href="/seat/rulelibrary"><span>이용규칙</span></a></li>
					<li><a href="/seat/reserveseat"><span>좌석예약</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>좌석 당일 예약</h3>
					<p>열람실 이용&nbsp;&nbsp;>&nbsp;&nbsp;좌석 당일 예약&nbsp;&nbsp;>&nbsp;&nbsp;예약 완료</p>
				</div>
				<div id="contents">
					<div id="rsvOkWrap">
						<h2 style="font-size:20px; margin-top:30px;font-family: NotoSansM;"> 좌석 예약 완료</h2>
						<div id="rsvouter">
							<div id="inner">
							<div>${userid} 님의 예약내역입니다. </div>
							<c:forEach items="${rlist}" var="rvo" varStatus="status">
							<div>예약 테이블 ${rvo.tname} 예약시간: ${rvo.reserveday} / ${timelist.get(status.index)} <input type="button" value="예약취소하기"></div>
							<div></div>
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