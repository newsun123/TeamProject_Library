<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section input[type=text] {
		width: 407px;
		height: 43px;
	}
	
	section input[type=button] {
		width: 407px;
		height: 43px;
		background: #E4F7BA;
		border-style: none;
	}
</style>
<script>
		function {
			
			uc=open("useridCheck","","width=300,height=200")
		}
</script>
</head>
<body>
	<section>
	<form name="ucform">
		<table width="1100" align="center">
			<caption>
				<h2>ID DOUBLE CHECK</h2>
			</caption>
			<tr>
				<td id="userid">USERID</td>
				<td><input type="text" name="id" maxlength="20"
					placeholder="USERID"></td>
				<td><input type="button" value="중복확인" onclick="moveData()">
				</td>
			</tr>
		</table>
	</form>
	</section>
</body>
</html>