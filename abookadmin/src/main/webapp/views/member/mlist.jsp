<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	.nameTop{
		height:60px;
		border-bottom:solid 2px #000;
		font-size:25px;
		font-weight:bold;
		text-align:left;
	}
</style>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>회원관리</span></h2>
				<ul id="lnb">
					<li class="on"><a href=""><span>회원조회</span></a></li>
					<li><a href="/member/member"><span>임시정지/삭제</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>회원조회</h3>
					<p>회원관리&nbsp;&nbsp;>&nbsp;&nbsp;회원조회</p>
				</div>
				<div id="contents">
					<div id="MemberWrap">
				<form name="mform" method="post" cellspancing="0">
					<div class="nameTop">
						회원조회	
					</div>
					<table align="center">
						<tr>
							<td> 회원번호 </td>
							<td> 이름 </td>
							<td> 유저아이디 </td>
							<td> 휴대전화 </td>
							<td> 이메일 </td>
							<td> 상세정보 </td>
						</tr>
						<c:forEach items="${mlist}" var="mvo">
							<tr>
								<td>${mvo.no}</td>
								<td>${mvo.name}</td>
								<td>${mvo.userid}</td>
								<td>${mvo.phone}</td>
								<td>${mvo.email}</td>
								<td><a href="mcontent?no=${mvo.no}&page=${page}">상세정보</a></td>
							</tr>
						</c:forEach>
					</table>
				</form>
						
						
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>