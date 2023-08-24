<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section {
	width: 1100px;
	height: 700px;
	margin: auto;
	magin-top: 70px;
}

section div {
	text-align: center;
	margin-bottom: 13px;
}

section input[type=text] {
	width: 400px;
	height: 40px;
}

section input[type=password] {
	width: 400px;
	height: 40px;
}

section input[type=submit] {
	width: 407px;
	height: 43px;
	background: #E4F7BA;
	border-style: none;
}

section input[type=button] {
	width: 407px;
	height: 43px;
	background: #E4F7BA;
	border-style: none;
}

a {
	text-decoration: none;
	color: black;
}

#msg {
	margin-top:50px;
	font-size:large;
	font-weight:bold;
}

#gender {
	width:400px;
	border:1px solid #cccccc;
	height:30px;
	margin:auto;
	float:center;
	margin-bottom:10px;
}
</style>
<script>
	function useridOpen()
	{
		uc=open("useridCheck","","width=400,height=300");
	}
</script>
</script>
</head>
<body>
	<section>
	<form name="mform" method="post" action="memberOk" onsubmit="return check()">
		<div id="msg">
			<H2> JOIN MEMBERSHIP </H2>
		</div>
		<p>
		<div>
			<input type="text" name="userid" placeholder="USERID">
		</div>
		<p>
		<div>
			<input type="button" value="중복체크"  onclick="useridOpen()">
		</div>
		<p>
		<div>
			<input type="text" name="name" placeholder="NAME">
		</div>
		<p>
		<div>
			<input type="password" name="pwd" placeholder="PASSWORD">
		</div>
		<p>
		<div>
			<input type="password" name="pwd2" placeholder="PASSWORD CHECK">
		</div>
		<p>
		<div>
			<input type="text" name="adr" placeholder="adress">
		</div>
		<P>
		<div id="gender">
			<input type="radio" name="gender" value="0" checked> 남
			<input type="radio" name="gender"  value="1"> 여
		</div>
		<p>
		<div>
			<input type="text" name="phone" placeholder="PHONE">
		</div>
		<P>
		<div>
			<input type="text" name="email" placeholder="EMAIL">
		</div>
		<div>
			<input type="submit" value="JOIN MEMBER">
		</div>
	</form>
</body>
</html>