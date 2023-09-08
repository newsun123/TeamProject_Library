<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#loginWrap{
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
				<h2><span>회원정보</span></h2>
				<ul id="lnb">
					<li class="on"><a href="/mypage/mypage"><span>회원정보수정</span></a></li>
					<li><a href="/mypage/checkReserveSeat"><span>좌석예약현황</span></a></li>
					<li><a href="/mypage/bookReserve"><span>도서예약현황</span></a></li>
					<li><a href="#"><span>1:1문의현황</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>도서예약현황</h3>
					<p>마이페이지&nbsp;&nbsp;>&nbsp;&nbsp;도서예약현황</p>
				</div>
				<div id="contents">
					<div id="MypageWrap">
						<h4>도서 예약 현황</h4>
						<table>
							<tr>
								<td>도서명</td>
								<td>반납예정일</td>
								<td>예약일</td>
								<td>처리상태</td>
							</tr>
						<c:forEach items="" var="">
						</c:forEach>
						</table>

						
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>