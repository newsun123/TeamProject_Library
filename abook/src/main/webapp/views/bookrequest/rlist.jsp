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
		text-align:left;
	}
	.searchtext{
		margin-top:20px;
	}
	#search{
		padding:10px 20px;
		border-radius:5px;
		color:white;
		margin-left:10px;
		margin-bottom:20px;
		width:100px;
		background:#007bff;
	}
	#searchCon{
		width:630px;
		position:relative;
		right:0;
		display:flex;
		justify-content:space-between;
		align-items:center;
	}
	table{
		border:1px solid #333;
	}
	table tr{
		height:120px;
		cursor:pointer;
	}
	table tr:first-child{
		height:65px;
		cursor:default;
		pointer-events:none;
	}
	table tr:first-child td{
		border-bottom:1px solid #eeee;		
	}
	table tr td img{
		object-fit:cover;
		height:100px;
	}
	#pagein{
		text-align:center;
	}
	.rimg{
		width:40px;
		object-fit:cover
	}
</style>
<script>
	window.onload=function()
	{
		<c:if test="${type!=null}">
			document.getElementById("type").value="${type}";
		</c:if>
	}
</script>
</head>
<body >
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
					<p>도서관 이용&nbsp;&nbsp;>&nbsp;&nbsp;도서신청</p>
				</div>
				<div id="contents">
					<div id="requestWrap">
						<div class="nameTop">
							신청하기
						</div>
						<div id=searchCon>
						<form name="kjh" method="post" action="rlist">
						<input type="hidden" value="${type}">
						<input type="hidden" value="${keyword}">
							<select name="type" id="type">
								<option value="title">도서명</option>
								<option value="writer">저자</option>
								<option value="publi">출판사</option>
							</select>
							<input type="text" class="searchtext" name="keyword" maxlength="100" placeholder="검색어 입력" value="${keyword}">
							<input type="submit" id="search" class="searchtext" value="검색">
						</form>
						</div>
						<table align="center">
							<tr>
								<td> 번호 </td>
								<td> 도서명 </td>
								<td> 신청자 </td>
								<td> 신청일 </td>
								<td> 처리상태 </td>
							</tr>
							
							<c:forEach items="${rlist}" var="brvo">
								<tr>
									<input type="hidden" name="userid" id="userid" value="${brvo.userid}">
									<input type="hidden" name="sessionuserid" id="sessionuserid" value="${userid}">
									<%-- <td>${userid},${brvo.userid}</td> --%>
									<td> ${brvo.no} </td>
									<td>
									<c:if test="${userid != brvo.userid && brvo.gonge == 1 && userid != null}"><!-- 유저아이디는 다른데 비공개글일경우 -->
										<img src="/static/img/bookrequest/locked.png" class="rimg">
										<a onclick="alert('비공개글은 작성자가 아니면 볼 수 없습니다.')">${brvo.title}</a>
									</c:if>
									<c:if test="${userid != brvo.userid && brvo.gonge == 0 && userid != null}"><!-- 유저아이디는 다른데 공개글일경우 -->
										<a href="rcontent?no=${brvo.no}&page=${page}&type=${type}&keyword=${keyword}">${brvo.title}</a>
									</c:if>
									<c:if test="${userid == brvo.userid && brvo.gonge == 0}"><!-- 유저아이디가 같을경우 공개글 -->
										<a href="rcontent?no=${brvo.no}&page=${page}&type=${type}&keyword=${keyword}">${brvo.title}</a>
									</c:if>
									<c:if test="${userid == brvo.userid && brvo.gonge == 1}"><!-- 유저아이디가 같을경우 비공개글 -->
										<img src="/static/img/bookrequest/locked.png" class="rimg">
										<a href="rcontent?no=${brvo.no}&page=${page}&type=${type}&keyword=${keyword}">${brvo.title}</a>
									</c:if>
									
									<c:if test="${userid == null && brvo.gonge == 1}"><!-- 로그인 안했을경우 비공개글 -->
										<img src="/static/img/bookrequest/locked.png" class="rimg">
										<a href="/member/login?no=${brvo.no}&page=${page}&type=${type}&keyword=${keyword}" onclick="alert('비공개글은 작성자가 아니면 볼 수 없습니다.')">${brvo.title}</a>
									</c:if>
									<c:if test="${userid == null && brvo.gonge == 0}"><!-- 로그인 안했을경우 공개글 -->
										<a href="rcontent?no=${brvo.no}&page=${page}&type=${type}&keyword=${keyword}">${brvo.title}</a>
									</c:if>
									</td>
									<td> ${brvo.userid} </td>
									<td> ${brvo.writeday} </td>
									<td> 
										<c:if test="${brvo.state == 0}">
											대기중
										</c:if>	
										<c:if test="${brvo.state == 1}">
											취소중
										</c:if>								
									 </td>
								</tr>
							</c:forEach>
								<tr>
									<td id="pagein" colspan="8">
									
						<!-- 10페이지 왼쪽 이동 -->  
						<c:if test="${pstart != 1}">
							<a href="rlist?page="${pstart-1}"> << </a>
						</c:if>
						<c:if test="${pstart == 1}">
							<<
						</c:if>
						
						<!-- 1페이지 왼쪽이동 -->
						<c:if test="${page != 1}">
							<a href="rlist?page="${page-1}"> < </a>
						</c:if>
						<c:if test="${page == 1}">
							<
						</c:if>
						
						<c:forEach begin="${pstart}" end="${pend}" var="i">
							<c:if test="${page != i}">
								<a href="rlist?page=${i}"> ${i} </a>
							</c:if>
							<c:if test="${page == i}">
								<a href="rlist?page=${i}" style="color:red"> ${i} </a>
							</c:if>
						</c:forEach>
						
						<!-- 1페이지 오른쪽 이동 -->
						<c:if test="${page != chong}">
							<a href="rlist?page=${page+1}"> > </a>
						</c:if>
						<c:if test="${page == chong}">
							>
						</c:if>
						
						<!-- 10페이지 오른쪽 이동 -->
						<c:if test="${pend != chong}">
							<a href="rlist?page=${pend+1}"> >> </a>
						</c:if>
						<c:if test="${pend == chong}">
							>>
						</c:if>
								</td>
							</tr>
							<tr>
							<c:if test="${userid == null}">
								<td colspan="8"> <a href="/member/login" onclick="alert('비로그인 상태에서는 신청할 수 없습니다.')"> 신청하기 </a> </td>
							</c:if>
							<c:if test="${userid != null}">
								<td colspan="8"> <a href="requestwrite"> 신청하기 </a> </td>
							</c:if>
							</tr>	
						</table>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>