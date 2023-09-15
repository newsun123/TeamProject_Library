<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#reservestatusWrap{
		padding-bottom: 80px;
	}
	table{
		border-bottom: 1px solid #ddd;
    	border-top: 2px solid #666;
	}
	table tr{
		height: 60px;
	}
	table tr td{
		border-bottom: 1px solid #e4e4e4;
		padding:0 10px;
		text-align: center;
	}
	table tr:first-child td{
		border-top: 2px solid #666;
	    background-color: #f9f9fb;
	    border-bottom: 1px solid #666;
	    height: 55px;
	    color: #333;
	    font-family: 'NotoSansM';
	    text-align: center;
	}
	table tr td.ta{
		text-align: center!important;
	}
	table tr td:nth-child(1) {
		width: 490px;
		text-align: left;
		padding-left: 20px;
	}
	table tr td:nth-child(2) {
		width: 175px;
	}
	table tr td:nth-child(3) {
		width: 175px;
	}
	table tr td:nth-child(4) {
		width: 55px;
	}
	input[type=button]{
		cursor: pointer;
	    font-size: 14px;
	    display: inline-block;
	    border: 1px solid #3d6cc4;
	    border-radius: 3px;
	    color: #3d6cc4;
	    padding: 0 30px;
	    line-height: 40px;
	    height: 42px;
	    background: #fff;
	    margin-right: 5px;
	}
	input[type=button]#btn2{
		margin-right: 0;
	}
	table tr td .el{
		text-overflow: ellipsis;
	    overflow: hidden;
	    white-space: nowrap;
	    width: 490px;
	}
	.ab{
	    width: 460px;
	    box-sizing: border-box;
	    height: 100%;
	    line-height: 60px;
	    text-align: left;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
</style>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>도서관리</span></h2>
				<ul id="lnb">
					<li><a href="/bookregi/list"><span>도서등록</span></a></li>
					<li class="on"><a href="/reservestatus/list"><span>예약현황</span></a></li>
					<li><a href="/loanstatus/list"><span>대출현황</span></a></li>
					<li><a href="/loanlist/list"><span>대출이력</span></a></li>
					<li><a href="/bookrequest/hopelist"><span>희망도서</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>예약현황</h3>
					<p>도서 관리&nbsp;&nbsp;>&nbsp;&nbsp;예약현황</p>
				</div>
				<div id="contents">
					<div id="reservestatusWrap">
						<table>
							<tr>
								<td class="ta">도서명</td>
								<td>회원아이디</td>
								<td>예약일</td>
								<td></td>
								<td>상태처리</td>
							</tr>
						<c:forEach items="${mapall}" var="map">
							<tr>
								<td><div class="ab">${map.title}</div></td>
								<td>${map.userid}</td>
								<td>${map.writeday}</td>
								<td></td>
								<td>
									<input type="button" value="예약승인" onclick="location='rcheck?bcode=${map.bcode}&userid=${map.userid}'" id="btn1">
									<input type="button" value="예약불가" onclick="location='dcheck?bcode=${map.bcode}&userid=${map.userid}&writeday=${map.writeday}'" id="btn2">
								</td>
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