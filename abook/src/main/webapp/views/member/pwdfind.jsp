<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#loginWrap{
		position: relative;
		border:4px solid #f1f1f1;
	    padding: 7px;
	    text-align: center;
	}
	#login{
		padding: 50px 0;
	}
	#login h3{
		color:#333;
		font-size:25px;
		font-family: NotoSansM;
		margin-bottom: 20px;
	}
	#findform,
	#sucessform{
   		height: 360px;
	}
	#findform > div,
	#sucessform > div{
		width: 450px;
    	margin: auto;
    	margin-bottom: 20px;
    	height: 48px;
	}
	#findform input,
	#sucessform input{
		width: 100%;
	    border: 1px solid #e2e2e2;
	    border-radius: 3px;
	    position: relative;
	    height: 48px!important;
	}
	#findform input[type=button]{
		height: 60px!important;
		line-height: 60px;
		color:#fff;
		background: #967759; 
		font-size: 17px;
	}
	#sucessform{
		display: none;
	}
	#sucessform img{
		position: relative;
    	left: -10px;
    	width: 130px;
	}
	.msg{
	    font-size: 14px;
	    color: #e52528;
	    position: relative;
	    top: 10px;
	}
	#idmsg{
		color: #333;
	    height: 40px;
	    font-weight: bold;
	    font-size: 25px;
	}
	#sucessform a{
	    font-size: 14px;
	    margin-top: 59px;
	    width: 120px;
	    display: inline-block;
	    height: 40px;
	    line-height: 40px;
	    color: #967759;
	    border: 1px solid #967759;
	    margin-right: 8px;
	    position: relative;
	    left: 8px;
	}
</style>
<script>
	function check(){
		var userid=document.getElementById("userid").value;
		var name=document.getElementById("name").value;
		var phone=document.getElementById("phone").value;
		
		var chk=new XMLHttpRequest;

		chk.onload=function(){
			if(chk.responseText=="0") {
				document.getElementById("failmsg").innerHTML="일치하는 회원정보가 없습니다. 다시 입력하세요.";
				document.getElementById("sucessform").style.display="none";
				document.getElementById("findform").style.display="block";
			}else{
				document.getElementById("findform").style.display="none";
				document.getElementById("sucessform").style.display="block"
			}
		}
		
		chk.open("get","pwdcheck?name="+name+"&phone="+phone+"&userid="+userid);
		chk.send();
	}
</script>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>회원정보</span></h2>
				<ul id="lnb">
					<li><a href="/member/login"><span>로그인</span></a></li>
					<li><a href="/member/member"><span>회원가입</span></a></li>
					<li><a href="/member/idfind"><span>아이디찾기</span></a></li>
					<li class="on"><a href=""><span>비밀번호찾기</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>비밀번호찾기</h3>
					<p>회원정보&nbsp;&nbsp;>&nbsp;&nbsp;비밀번호찾기</p>
				</div>
				<div id="contents">
					<div id="loginWrap">
						<div id="login">
							<div id="findform">
								<h3>비밀번호찾기</h3>	
						        <div><input type="text" name="userid" id="userid" placeholder="아이디"></div>
						        <div><input type="text" name="name" id="name" placeholder="이름"></div>
						        <div><input type="text" name="phone" id="phone" placeholder="전화번호"></div>
						        <div><input type="button" value="비밀번호찾기" onclick="check()"></div> 
						        <div id="failmsg" class="msg"></div>
							</div>
							<div id="sucessform">
								<h3>비밀번호 재설정</h3>
								<form method="post" action="updatePwd" onsubmit="return pwdcheck(this)">
									<div><input type="password" name="pwd" id="userid" placeholder="비밀번호"></div>
							        <div><input type="password"" name="pwd2" id="name" placeholder="비밀번호 확인"></div>
							        <div><input type="submit" value="비밀번호 재설정"></div> 			
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>