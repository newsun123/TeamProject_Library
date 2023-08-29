<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section table {
		width:1100px;
		height:200px;
		margin:auto;
		margin-top:50px;
		border:1px solid black;
	}
	
	section table tr td {
		border:1px solid black;
		text-align:center;
	}
	
	section table caption {
		font-size:20px;
		font-weight:900;
		margin-bottom:30px;
	}
</style>
</head>
<body>
	<section>
		<table width="1100" align="center" border="1">
			<caption><h2> Calender </h2></caption>
			<tr>
				<td> 월 </td>
				<td> 화 </td>
				<td> 수 </td>
				<td> 목 </td>
				<td> 금 </td>
				<td class="saterday"> 토 </td>
				<td class="sunday"> 일 </td>
			</tr>	
				<c:set var="day" value="1"/>
				<c:forEach begin="1" end="${ju}" var="i">
					<tr>
					   <c:forEach begin="0" end="6" var="j">
					   		
					   		<c:if test="${ (i==1 && j < yoil) || (chong < day) }">
					   			<td> 
					   				
					   			</td>
					   		</c:if>
					   		
					   		<c:if test="${ (i !=1 || j >= yoil) && (chong >= day)  }">
								<td> 
									${day} 
								</td>
								<c:set var="day" value="${day+1}"/>						   		
					   		</c:if>
					   		
					   </c:forEach>
					</tr>
				</c:forEach>
		</table>
	</section>
</body>
</html>