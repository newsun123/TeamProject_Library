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
					<li><a href="/member/member"><span>회원 조회</span></a></li>
					<li class="on"><a href=""><span>임시정지/삭제</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>임시정지/삭제</h3>
					<p>회원 관리&nbsp;&nbsp;>&nbsp;&nbsp;임시정지/삭제</p>
				</div>
				<div id="contents">
					<div id="MemberWrap">
						<table style="padding-bottom:20px;">
							<h3 style="font-size:20px;padding-bottom:20px;padding-top:20px;">회원 정보</h3>
								<tr>
									<td>아이디</td>
									<td>이름</td>
									<td>이메일</td>
									<td>가입일</td>
									<td>임시 정지</td>
									<td>삭제</td>
								</tr>
								<c:forEach items="${mlist}" var="mvo">
								<tr>
									<td>${mvo.userid}</td>
									<td>${mvo.name}</td>
									<td>${mvo.email1}@${mvo.email2}</td>
									<td>${mvo.writeday}</td>
									<td><input type="button" value="임시 정지" onclick="openBanForm()"></td>
									<td><input type="button" value="삭제" onclick="openDelForm()"></td>
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