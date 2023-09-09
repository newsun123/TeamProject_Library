<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#gongjiWrap{
		padding-bottom: 30px;
	}
	form{
		width: 100%;
	    display: block;
	}
	h4{
		font-size: 25px;
	    font-family: 'NotoSansM';
	    text-align: center;
	    padding:30px 0;
	}
	table{
		border-top: 2px solid #cecece;
		text-align: center;
	}
	table tr{
		height: 230px;
		cursor:pointer;
	}
	table tr td{
		border-bottom: 1px solid #e4e4e4;
	}
	table tr td:nth-child(1){
		width: 180px;
		padding:10px;
	}
	table img{
	    width: 100%;
	    height:210px;
	    box-sizing: border-box;
    	border: 1px solid #e2e2e2;
    	object-fit:cover;    	   
	}
	table tr td:nth-child(1) > div{
		width: 100%;
	}
	table tr td:nth-child(2){
		text-align: left;
	}
	table tr td:nth-child(2) > div > div{
		height: 45px;
    	line-height: 45px;
	}
	.tc{
		text-align: center!important;
	}
	#btnCon{    
		position: absolute;
		top:0;
		right:0;
	}
	#btnCon a{
		color: #fff;
	    text-align: center;
	    background: #4e68b9;
	    font-family: 'NotoSansM';
	    height: 50px;
	    width: 130px;
	    cursor: pointer;
	    margin: 0 2px;
	    border-radius: 3px;
	    display: inline-block;
    	line-height: 50px;
	}	
	.aa{
		font-family: 'NotoSansM';
		font-size: 20px;
	}
	.bb{
		color:#777;
	}
	.bb span{
		margin-left: 20px;
	}
	.cc{
		color:#777;
	}
	.dd{
		color: #555;
	}
	#conBox{
		margin-left: 30px;
	}

	/*page버튼처리*/
	#btWrap{
	    margin-top: 30px;
	    position: relative;
	    height: 50px;
	    text-align: center;
	}
	#pageCon{
    	margin: auto;
	}
	#pageCon a{
		display: inline-block;
	    width: 30px;
	    font-size: 1.125em;
	    color: #666;
	    line-height: 30px;
	    text-align: center;
	    vertical-align: top;
	}
	#pageCon .btnPage{
		width: 30px;
	    height: 30px;
	    line-height: 30px;
	    border: 1px solid #ddd;
	    background: url(/static/img/common/arr_sp.png) 50% 0 no-repeat;
	}
	#pageCon .btnPage.prev{
		margin-right: 5px;
    	background-position-y: -27px;
	}
	#pageCon .btnPage.next{
		margin-left: 5px;
    	background-position-y: -52px;
	}
	#pageCon .btnPage.last{
		background-position-y: -77px;
	}
	#pageCon .btnPage.dis{
		pointer-event:none;
		cursor:default;
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
					<li class="on"><a><span>도서예약</span></a></li>
					<li><a href="#"><span>도서신청</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>도서예약</h3>
					<p>도서관 이용&nbsp;&nbsp;>&nbsp;&nbsp;도서예약</p>
				</div>
				<div id="contents">
					<div id="gongjiWrap">
						<table>						
						<c:forEach items="${blist}" var="bvo">
							<tr onclick="location='content?&page=${page}&bcode=${bvo.bcode}'"> 
								<td> 
									<div>
										<img src="/static/img/breserve/${bvo.bimg}">					
									</div>
								</td>		
								<td>
									<div id="conBox">
										<div class="aa">${bvo.title}</div>
										<div class="bb">${bvo.publi}<span>${bvo.writer} 지음</span></div>
										<div class="cc">${bvo.writeyear}</div>
										<div class="dd">소장도서관 : 작은 도서관</div>
									</div>
								</td>
							</tr>
						</c:forEach>						
						</table>
						<div id="btWrap">
							<div id=pageCon>
							<c:if test="${pstart!=1}">
								<a href="list?page=${pstart-1}" class="btnPage"></a>
							</c:if>
							<c:if test="${pstart==1}">
								<a class="btnPage dis"></a> 
							</c:if>
							
							<c:if test="${page!=1}">
								<a href="list?page=${page-1}" class="btnPage prev"></a>
							</c:if>
							<c:if test="${page==1}">
								<a class="btnPage dis prev"></a>
							</c:if>
							
							<c:forEach begin="${pstart}" end="${pend}" var="i">
								<c:if test="${page!=i}">
									<a href="list?page=${i}">${i}</a>
								</c:if>
								<c:if test="${page==i}">
									<a href="list?page=${i}" style="background-color: #555;color:#fff">${i}</a>
								</c:if>
							</c:forEach>
						
							<c:if test="${page!=chong}">
								<a href="list?page=${page+1}" class="btnPage next"></a>
							</c:if>
							<c:if test="${page==chong}">
								<a class="btnPage next dis"></a>
							</c:if>
							
							<c:if test="${pend!=chong}">
								<a href="list?page=${pend+1}" class="btnPage last"></a>
							</c:if>
							<c:if test="${pend==chong}">
								<a class="btnPage last dis"></a> 
							</c:if>	
							</div>			
						</div>							
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>