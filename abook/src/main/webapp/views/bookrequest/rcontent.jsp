<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#requestWrap{
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
		text-align:center;
	}
	.conwrap{
		justify-content:space-between;
		border-bottom:1px solid #ddd;
		box-sizing:border-box;
		padding:20px 0;
	}
	.conWrap > div{
		text-align:left;
		height:45px;
		line-height:45px;
		border-bottom:1px solid #F1F1F1; 
	}
	.conWrap > div:last-child{
		border-bottom:none;
		margin-top:10px;
	}
	.mark{
		font-size:20px;
		display:inline-block;
		width:140px;
		margin-right:50px;
	}
	.button{
		float:right;
		display:inline-block;
		width:300px;
		border-bottom:none;
	}
	input[type=button]{
		width:60px;
		height:40px;
		background:#967759;
		color:#FFFFF5;
		margin-right:20px;
		border-radius:5px;
		line-height:30px;
	}
</style>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>도서관이용</span></h2>
				<ul id="lnb">
					<li><a href="/breserve/list"><span>도서예약</span></a></li>
					<li class="on"><a href="/bookrequest/rlist"><span>도서신청</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>도서신청</h3>
					<p>도서관이용&nbsp;&nbsp;>&nbsp;&nbsp;도서신청</p>
				</div>
				<div id="contents">
					<div id="requestWrap">
					<form name="rform" method="post" cellspancing="0">
						<div class="nameTop">
							도서신청
						</div>
						<div class="conWrap">
							<div><span class="mark"> 책제목 </span>${brvo.title}</div>
							<div><span class="mark"> 저자 </span>${brvo.writer}</div>
							<div><span class="mark"> 출판사 </span>${brvo.publi}</div>
							<div><span class="mark"> 출판년도 </span>${brvo.writeyear}</div>
							<div><span class="mark"> 신청자 </span>${brvo.userid}</div>
							<div><span class="mark"> 비고 </span>${brvo.ect}</div>
							<div>
									<c:if test="${brvo.gonge == 1}"> <!-- 비공개일경우 -->
										<span class="button">
											<a href="rupdate?no=${brvo.no}&page=${page}&type=${type}&keyword=${keyword}"><input type="button" value="수정"></a>
											<a href="delete?no=${brvo.no}&page=${page}&type=${type}&keyword=${keyword}"><input type="button" value="삭제"></a>
											<a href="rlist?type=${type}&keyword=${keyword}"><input type="button" value="목록"></a>
										</span>
									</c:if>
									<c:if test="${brvo.gonge != 1 && userid != brvo.userid}">
										<span class="button">
											<input type="button" value="수정" style="display:none;">
											<input type="button" value="삭제" style="display:none;">
											<a href="rlist?type=${type}&keyword=${keyword}"><input type="button" value="목록" style="float:right;"></a>
										</span>
									</c:if>
									<c:if test="${brvo.gonge != 1 && userid == brvo.userid}">
										<span class="button">
											<a href="rupdate?no=${brvo.no}&page=${page}&type=${type}&keyword=${keyword}"><input type="button" value="수정"></a>
											<a href="delete?no=${brvo.no}&page=${page}&type=${type}&keyword=${keyword}"><input type="button" value="삭제"></a>
											<a href="rlist?type=${type}&keyword=${keyword}"><input type="button" value="목록"></a>
										</span>
									</c:if>
							</div>
							
						</div>
					</form>
						
						
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>