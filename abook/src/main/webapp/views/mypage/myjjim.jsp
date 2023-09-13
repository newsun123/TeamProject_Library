<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#MyjjimWrap{
		position: relative;
		border:4px solid #f1f1f1;
	    padding: 7px;
	    text-align: center;
	}
	form{
		width: 100%;
	    display: block;
	}
	table#table1{
		border-bottom: 1px solid #ddd;
    	border-top: 2px solid #666;
	}
	table#table1 tr{
		height: 300px;
	}
	table#table tr td{
		border-bottom: 1px solid #e4e4e4;
		padding:0 10px;
	}
	table#table1 tr td:nth-child(1){
	    width: 220px;
	    padding: 30px 0;
	}
	table#table1 tr td:nth-child(1) > div{
		width: 220px;
		height: 300px;
	}
	table#table1 img{
	    width: 100%;
	    height:100%;
	    box-sizing: border-box;
    	border: 1px solid #e2e2e2;   	   
	}
	#conBox{
		margin-left: 30px;
		padding: 30px 0;
		height: 370px;
		text-align: left;
	}
	#conBox > div{
		height: 45px;
    	line-height: 45px;
	}
	#conBox .btn {
		border:1px solid black;
	}
	.aa{
		font-family: 'NotoSansM';
		font-size: 20px;
		display: flex;
		align-items: center;
		flex-direction: row;
		justify-content: space-between;
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
	.ee{
		color: #444;
	    line-height: 29px!important;
	    width: 100%;
	    text-overflow: ellipsis;
	    overflow: hidden;
	    word-break: break-word;
	    display: -webkit-box;
	    -webkit-line-clamp: 2;
	    -webkit-box-orient: vertical;
	    height: auto!important;
	}
	.rbtn{
		display: inline-block;
	    border: 1px solid #e2e2e2;
	    border-radius: 3px;
	    color: #71757b;
	    padding: 0 20px;
	    line-height: 43px;
	    height: 45px;
	    margin-bottom: 30px;
	}
</style>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>마이페이지</span></h2>
				<ul id="lnb">
					<li><a href="/mypage/mypage"><span>회원정보수정</span></a></li>
					<li><a href="/mypage/checkReserveSeat"><span>좌석예약현황</span></a></li>
					<li><a href="/mypage/bookreserve"><span>도서예약현황</span></a></li>
					<li><a href="/mypage/loanlist"><span>도서대출이력</span></a></li>
					<li class="on"><a href="/mypage/myjjim">도서찜리스트<span></span></a></li>
					<li><a href="#"><span>1:1문의현황</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>도서찜리스트</h3>
					<p>마이페이지&nbsp;&nbsp;>&nbsp;&nbsp;도서 찜리스트</p>
				</div>
				<div id="contents">
					<div id="MyjjimWrap">
						<table id="table">
							<c:forEach items="${mapall}" var="map">
								<tr>
									<td>
										<div>
											<img src="/static/img/breserve/${map.bimg}">				
										</div>
									</td>
									<td>
										<div id="conBox">
											<div class="aa">${map.title}</div>
											<div class="bb">${map.publi}<span>${map.writer} 지음</span></div>
											<div class="cc">${map.writeyear}</div>
											<div class="dd">소장도서관 : 작은 도서관</div>
											<div class="ee">${map.ect}</div>
											<div class="move"><input type="button" class="btn" value="바로가기" onclick="location='/breserve/content?bcode=${map.bcode}&mj=1'"></div>
										</div>
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