<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#MemberWrap{
		position: relative;
		border:4px solid #f1f1f1;
	    padding: 7px;
	    text-align: center;
	}
</style>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>회원 정보</span></h2>
				<ul id="lnb">
					<li class="on"><a href=""><span>회원 조회</span></a></li>
					<li><a href="/member/memberBan"><span>임시정지/삭제</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>회원 조회</h3>
					<p>회원 관리&nbsp;&nbsp;>&nbsp;&nbsp;회원 조회</p>
				</div>
				<div id="contents">
				<a href="/member/member">뒤로가기</a>
					<div id="MemberWrap">
						<table style="padding-bottom:20px;" class="table1">
							<h3 style="font-size:20px;padding-bottom:20px;padding-top:20px;">${map.name}님의 상세 정보</h3>
								<tr>
									<td>아이디</td>
									<td>${map.userid}</td>
								</tr>
								<tr>
									<td>이름</td>
									<td>${map.name}</td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td>${map.phone}</td>
								</tr>
								<tr>
									<td>이메일</td>
									<td>${map.email1}@${map.email2}</td>
								</tr>
								<tr>
									<td>주소</td>
									<td>${map.addr} ${map.addtDtl}</td>
								</tr>
								<tr>
									<td>가입일</td>
									<td>${map.writeday}</td>
								</tr>
								<tr>
									<td>도서 대출 횟수</td>
									<td>${map.writeday}</td>
								</tr>
						</table>
						<table style="padding-bottom:20px;" class="table2">
							<h3 style="font-size:20px;padding-bottom:20px;padding-top:20px;">작성글</h3>
							<tr>
								<td></td>
								<td></td>
							</tr>
						</table>
						<table style="padding-bottom:20px;" class="table3">
							<h3 style="font-size:20px;padding-bottom:20px;padding-top:20px;">대출이력</h3>
							<tr>
								<td></td>
								<td></td>
							</tr>
						</table>
						<table style="padding-bottom:20px;" class="table4">
							<h3 style="font-size:20px;padding-bottom:20px;padding-top:20px;">좌석 예약 이력</h3>
								<tr>
										<td>예약자명</td>
										<td>예약 좌석</td>
										<td>예약일</td>
										<td>예약 시간</td>
									</tr>
									<c:forEach items="${rlist}" var="rvo" varStatus="status">
									<tr>
										<td>${rvo.userid}</td>
										<td>${rvo.tname}</td>
										<td>${rvo.reserveday}</td>
										<td> ${timelist.get(status.index)}</td>
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