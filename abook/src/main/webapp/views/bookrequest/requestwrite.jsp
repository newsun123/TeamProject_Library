<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#requestWrap{
		position: relative;
		border:4px solid #f1f1f1;
	    padding: 7px;
	    text-align: center;
	}
	.nameTop{
		height:60px;
		border-bottom:solid 2px #000;
		font-size:25px;
		font-weight:bold;
		text-align:left;
	}
	.request{
		border-bottom:1px solid #ddd;
		box-sizing:border-box;
		padding:50px 0;
		text-align:center;
		flex-direction: column;
		justify-content:center;
	}
	.request input[type=submit]{
		margin-top:20px;
		margin-right:20px;
	}
	form > div{
		width:450px;
		margin:auto;
		margin-bottom:20px;
		height:48px;
	}
	form input{
		width:80%;
	}
	.mark{
		display:inline-block;		
		width:20%;
	}
	.mark input[type=text]{
		height:30px;
	}
	.all{
		width:1000px;
		margin-right:300px;
	}
	.all2{
		margin-right:300px;
		display:flex;
	}
	.all2 .all3{
		width:1000px;
		align-items:center;
		margin-bottom:10px;
	}
	.all3 input[type=checkbox]{
		width:20px;
		height:20px;
		margin-right:10px;
		vertical-align:middle;
	}
	#msg2 {
		visibility:hidden;
	}
	#msg3{
		visibility:hidden;
	}
		
	#msg4{
		visibility:hidden;
	}
		
	#msg5{
		visibility:hidden;
	}
		
	#msg6{
		visibility:hidden;
	}
		
</style>
<script>
	function check(my)
	{
		if(my.title.value.trim()=="")
		{
			document.getElementById("msg2").style.visibility="visible";
			document.getElementById("msg2").style.color="red";
			my.bname.focus();
		}
			if(my.writer.value.trim()=="")
			{
				document.getElementById("msg3").style.visibility="visible";
				document.getElementById("msg3").style.color="red";
				my.writer.focus();
			}
				if(my.publi.value.trim()=="")
				{
					document.getElementById("msg4").style.visibility="visible";
					document.getElementById("msg4").style.color="red";
					my.publisher.focus();
				}
					if(my.writeyear.value.trim()=="")
					{
						document.getElementById("msg5").style.visibility="visible";
						document.getElementById("msg5").style.color="red";
						my.writetime.focus();
					}
						if(my.ect.value.trim()=="")
						{
							document.getElementById("msg6").style.visibility="visible";
							document.getElementById("msg6").style.color="red";
							my.ect.focus();
							return false;
						}
							else
								return true;
	}
	function returnchk()
	{
		var title=document.rform.title.value;
		var writer=document.rform.writer.value;
		var publi=document.rform.publi.value;
		var writeyear=document.rform.writeyear.value;
		var ect=document.rform.ect.value;
		
		if(title.trim().length>0)
		{
			document.getElementById("msg2").style.visibility="hidden";
		}
		if(writer.trim().length>0)
		{
			document.getElementById("msg3").style.visibility="hidden";
		}
		if(publi.trim().length>0)
		{
			document.getElementById("msg4").style.visibility="hidden";
		}
		if(writeyear.trim().length>0)
		{
			document.getElementById("msg5").style.visibility="hidden";
		}
		if(ect.trim().length>0)
		{
			document.getElementById("msg6").style.visibility="hidden";
		}
	}
</script>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>도서관이용</span></h2>
				<ul id="lnb">
					<li><a href="/breserve/list"><span>도서예약</span></a></li>
					<li class="on"><a href="/bookrequest/rlist"><span>도서신청</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>도서신청</h3>
					<p>도서관 이용&nbsp;&nbsp;>&nbsp;&nbsp;도서신청</p>
				</div>
				<div id="contents">
					<div id="requestWrap">
						<div class="nameTop">
							도서신청
						</div>						
						<div class="request">
						<form name="rform" method="post" action="requestwrite_ok" onsubmit="return check(this)">
							<div class="all"><span class="mark">책제목</span><input type="text" name="title" oninput="returnchk()"></div>
							<span id="msg2" name="msg2"> 책제목을 입력하세요</span>
							<div class="all"><span class="mark">저자</span><input type="text" name="writer" oninput="returnchk()"></div>
							<span id="msg3" name="msg3"> 저자를 입력하세요</span>
							<div class="all"><span class="mark">출판사</span><input type="text" name="publi" oninput="returnchk()"></div>
							<span id="msg4" name="msg4"> 출판사를 입력하세요</span>
							<div class="all"><span class="mark">출판년도</span><input type="text" name="writeyear" oninput="returnchk()"></div>
							<span id="msg5" name="msg5"> 출판년도를 입력하세요</span>
							<div class="all2">
								<div class="all3"><span class="mark">*비공개*</span>
									<input type="checkbox" name="gonge" value="1">
								</div>   
							 </div>
							<div class="all"><span class="mark">비고</span><input type="text" name="ect" oninput="returnchk()"></div>
							<span id="msg6" name="msg6"> 비고를 입력하세요</span>
							<div class="all"><input type="submit" value="신청하기"></div>
						</form>						
						</div>
					</div>
				</div>
			</div>		
		</div>
	</div> 	
</body>
</html>