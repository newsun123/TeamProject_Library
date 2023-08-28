<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  section {
     width:1000px;
     height:600px;
     margin:auto;
   }
   section a {
     text-decoration:none;
     color:black;
   }
   section table {
     border-spacing:0px;
     margin-top:30px; 
   }
   section table td {
     height:30px;
     border-bottom:1px solid #cccccc;
     text-align:center;
   }
   section table tr:first-child td {
     font-weight:900;
     text-align:center;
     padding-left:0;
     border-top:2px solid #cccccc;
   }
   section table tr:last-child td {
     border-bottom:2px solid #cccccc;
   }
   table tr td:first-child {
	width:94px;
   } 
   table tr td:nth-child(2){
   	text-align:left;
   	padding-left:10px;
   }
   table tr td:last-child {
	width:130px;
   }
   table tr td {
   	height:40px;
   }
   
   h2{
   	font-size: 20px;
    font-weight: bold;
    margin-bottom: 30px;
   }
</style>
</head>
<body>
	<section>
		<table width="900" align="center">
			<caption><h2> 공지사항 목록</h2></caption>
			<tr>
				<td> 작성자 </td>
				<td>  제목 </td>
				<td> 작성일 </td>
			</tr>
			<c:forEach items="${glist}" var="gvo">
				<tr> 
					<td> 관리자 </td>
					<td> 
						<c:if test="${gvo.step == 1}">
							<img src="../static/img/admin/gl2.jfif">
						</c:if>
						<c:if test="${gvo.step != 1}">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</c:if>
						<a href="content?no=${gvo.no}"> ${gvo.title} </a> 
					</td>
					<td> ${gvo.writeday} </td>  
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4" align="center">
					
					<c:if test="${pstart != 1 }">
						<a href="list?page=${pstart-1}"> << </a>
					</c:if>
					<c:if test="${pstart == 1 }">
						<< 
					</c:if>
					
					<c:if test="${page != 1}">
						<a href="list?page=${page-1}"> < </a>
					</c:if>
					<c:if test="${page == 1}">
						<
					</c:if>
					
					<c:forEach begin="${pstart}" end="${pend}" var="i">
						<c:if test="${page != i}">
							<a href="list?page=${i}"> ${i}</a>
						</c:if>
						<c:if test="${page == i}">
							<a href="list?page=${i}" style="color:red"> ${i}</a>
						</c:if>
					</c:forEach>
				
					<c:if test="${page != chong}">
						<a href="list?page=${page+1}"> > </a>
					</c:if>
					<c:if test="${page == chong}">
						>
					</c:if>
					
					<c:if test="${pend != chong}">
						<a href="list?page=${pend+1}"> >> </a>
					</c:if>
					<c:if test="${pend == chong}">
						>> 
					</c:if>
				
				</td>
			</tr>
			<tr>
				<td colspan="4"> <a href="write"> 공지사항 등록 </a></td>
			</tr>
		</table>
	</section>
</body>
</html>