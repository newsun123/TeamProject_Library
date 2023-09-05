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
	#outer {
		width:1000px;
		margin:auto;
	}
	table h3 {
		font-size:20px;
		font-weight: 600;
		margin-bottom:20px;
	}
	table {
		margin-top:40px;
		text-align: center;
	}
	table tr {
		height:35px;

	}
	table tr td {
		align:center;
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
					<li><a href="/seat/chkReserveSeat"><span>좌석예약</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>좌석 당일 예약</h3>
					<p>열람실 이용&nbsp;&nbsp;>&nbsp;&nbsp;좌석 당일 예약&nbsp;&nbsp;>&nbsp;&nbsp;예약 완료</p>
				</div>
				<div id="contents">
						<div id="rsvOkWrap">
							<div id="outer">
								<table width="1000">
								<caption><h3>예약이 완료 되었습니다.</h3></caption>
									<tr>
										<td>예약자명</td>
										<td>예약 좌석</td>
										<td>예약 시간</td>
									</tr>
									<c:forEach items="${rlist}" var="rvo" varStatus="status">
									<tr>
										<td>${rvo.userid}</td>
										<td>${rvo.tname}</td>
										<td>${timelist.get(status.index)}</td>
									</tr>
									</c:forEach>
								</table>
								<div style="margin-top:30px;">예약취소는 <b style="font-weight:600;"> 마이페이지 > 좌석예약</b> 에서 가능하십니다.</div>
							</div>	
						</div>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>