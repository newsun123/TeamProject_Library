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
<script>
	var chk=new XMLHttpRequest();
	chk.onload=function()
	{
		
	}
	chk.open("get","calenderCheck?year="+year+"&month"=month);
	chk.send();
</script>
</head>
<body>
	<section>
		<table width="1100" align="center" border="1">
			<caption><h2> 
				<a href="calender?y=${y}&mm=${mm-1}"> ◀ </a>
								${year} ${month} Calender 
				<a href="calender?y=${y}&month=${mm+1}"> ▶ </a>
			</h2></caption>
			<tr>
				<td> 일 </td>
				<td> 월 </td>
				<td> 화 </td>
				<td> 수 </td>
				<td> 목 </td>
				<td class="saterday"> 금 </td>
				<td class="sunday"> 토	 </td>
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
					   		  <c:set var="cday" value=""/>
					   		  <c:set var="dd" value=""/>
					   		  <c:if test="${j==5 || day2==day || day3==day || day4==day}">
					   		      <c:set var="cday" value="휴관일"/>
					   		      <c:set var="dd" value="style='color:red'"/>
					   		  </c:if>
					   		 
								<td ${dd}> 
									${day}
								</td>
								<c:set var="day" value="${day+1}"/>						   		
					   		</c:if>
					   		
					   </c:forEach>
					</tr>
				</c:forEach>
		</table>
		<div id="msg" align="center"> * 매주 금요일은 휴관일입니다! </div>
	</section>
	<!-- 
		c:set 으로 변수를 주고 , 실행될때마다 처음 시작이 빈값으로 시작이 되게 만들어주어야한다.
		그래야지만 한가지 내용이 계속 출력되지 않고 , 첫 시작이 빈값이었다가 조건을 만나서 조건에
		맞으면 부합되도록 한다.
		
		첫 c:set 의 변수는 휴관일 관련해서 빈값을 만들어주고 , day가 출력되는곳에 cday로 출력되게 해준다.
		두번째 c:set의 변수에는 스타일을 주기 위해 빈값을 만들어주고 , 해당되는 td안에 태그를 넣어 값을 출력한다.
	 -->
</body>
</html>