<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section {
		width:1100px;
		height:700px;
		margin:auto;
		magin-top:50px;
	}
	section div {
		text-align:center;
		margin-bottom:13px;
	}
	section input[type=text] {
		width:400px;
		height:40px; 
	}
	section input[type=password] {
		width:400px;
		height:40px; 
	}
	section input[type=submit] {
		width:407px;
		height:43px;
		background:#E4F7BA;
		border-style:none; 
	}
	section textarea {
		border:1px solid #cccccc;
		width:400px;
		height:200px;
	}
	a {
		text-decoration:none
		color:black;
	}
	section #form {
		margin-top:50px;
	}
</style>
<script>
function stepchk(my)
{
	 if(my.step.checked) 
	 {
		 my.step.value=1;
		 return true;
	 }
	 else 
	 {
		 my.step.value=0;
		 return true;
	 }
}
</script>
</head>
<body>
	<section>
		<form name="gform" method="post" id="form" action="writeOk" onsubmit="return stepchk(this)">
			<div><h2> 공지사항 등록 </h2></div>
			<div> <input type="text" name="title" placeholder="TITLE"> </div>
			<div> <textarea name="content" placeholder="CONTENT"> </textarea></div>
			<div> <input type="checkbox" name="step"> 고정글을 체크해주세요! </div>
			<div> <input type="submit" value="등록"> </div>
		</form>
	</section>
</body>
</html>