<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#cancelWrap{
		position: relative;
		border:4px solid #f1f1f1;
	    padding: 7px;
	    text-align: center;
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
	}
</style>
</head>
<body>
<div id="secWrap">
	<div class="sImg"></div>
	<div id="section">
		<div id="labNav">
			<h2><span>좌석 관리</span></h2>
			<ul id="lnb">
				<li><a href="reserveseat"><span>사용불가 지정</span></a></li>
				<li class="on"><a><span>퇴실 처리</span></a></li>
			</ul>
		</div>
		<div id="contentCore">
				<div class="naviTit">
					<h3>퇴실 처리</h3>
					<p>좌석 관리&nbsp;&nbsp;>&nbsp;&nbsp;퇴실 처리</p>
				</div>
				<div id="contents">
					<div id="cancelWrap">
						<div id="outer">
							<table width="1000" align="center">
							<caption><h3>예약자 명단</h3></caption>
								<tr>
									<td>예약자 명</td>
									<td>예약 좌석</td>
									<td>예약일</td>
									<td>예약 시간</td>
									<td>퇴실 처리</td>
								</tr>
								<c:forEach items="${rlist}" var="rvo" varStatus="status">
								<tr>
									<td>${rvo.userid}</td>
									<td>${rvo.tname}</td>
									<td>${rvo.reserveday}</td>
									<td>${timelist.get(status.index)}</td>
									<td>s</td>
								</tr>
								</c:forEach>
							</table>
						</div>					
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>