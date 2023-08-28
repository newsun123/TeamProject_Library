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
	window.onload=function()
	{
		var step=document.gform.step.value;
		if(step == "1")
		{
			document.gform.step.checked = true ;
		}else {
			document.gform.step.checked = false;
		}
	}
</script>
</head>
<body>
		<section>
		<form name="gform" method="post" id="form" action="updateOk">
			<div><h2> 공지사항 업데이트! </h2></div>
			<input type="hidden" name="no" value="${gvo.no}">
			<div> <input type="text" name="title" placeholder="TITLE" value="${gvo.title}"> </div>
			<div> <textarea name="content" placeholder="CONTENT"> ${gvo.content} </textarea></div>
			<div> <input type="checkbox" name="step" value="${gvo.step}"> 
				고정글을 체크해주세요!  			
			</div>
			<div> <input type="submit" value="수정"> </div>
		</form>
	</section>
</body>
</html>