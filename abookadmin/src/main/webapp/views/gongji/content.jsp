<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section {
	width: 1000px;
	height: 600px;
	margin: auto;
}

section a {
	text-decoration: none;
	color: black;
}

section table {
	border-spacing: 0px;
	margin-top: 30px;
}

section table td {
	height: 30px;
	border-bottom: 1px solid #cccccc;
	text-align: center;
}

section table tr:first-child td {
	font-weight: 900;
	text-align: center;
	padding-left: 0;
	border-top: 2px solid #cccccc;
}

section table tr:last-child td {
	border-bottom: 2px solid #cccccc;
}

table tr td:first-child {
	width: 100px;
}

table tr td {
	height: 40px;
}

h2 {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 30px;
}

table tr:nth-child(2) td:nth-child(2) {
	vertical-align: top;
	padding: 10px 0;
}

table tr:nth-child(2) {
	height: 130px;
}
.tl {
	text-align:left;
}

</style>
</head>
<body>
	<section>
		<table width="900" align="center">
			<caption>
				<h2>Gongji Content</h2>
			</caption>
			<tr>
				<td>제목</td>
				<td>${gvo.title}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td class="tl">${gvo.content}</td>
			</tr>
			<tr>
				<td>등록일</td>
				<td class="tl">${gvo.writeday}</td>
			</tr>
			<tr>
				<td colspan="3">
					<a href="list"> 목록 </a>
					<a href="update?no=${gvo.no}"> 수정 </a>
					<a href="delete?no=${gvo.no}"> 삭제 </a>
				</td>	
			</tr>
		</table>
	</section>
</body>
</html>