<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
    #cal { /* table태그 */
      border-spacing:0px;
      border:2px solid green;
    }
    div {
    	text-align:center;
    }
 </style>
	<script>
		function calView2(d)
		{
			var today=new Date();
			var y=today.getFullYear();
			var m=today.getMonth();
			
			var xday=new Date(y,11,1); // 해당 달(월)
			var yoil=xday.getDay();
			
			var month=[31,28,31,30,31,30,31,31,30,31,30,31];
			var chong=month[m];
			
			if( (y%4 == 0 && y%100 !=0) || y%400 ==0 )
			{
				if( m == 1)	
					chong=chong+1;
			}
			
			var ju=Math.ceil( (chong+yoil)/7 );
			
			var calData="<table width='400' height='50' border='0' id='cal'>";
			
			calData=calData+y+"년 "+(m+1)+"월";
			
			calData=calData+"<tr align='center'>";

			var n=yoil-5;
			if(n == 1)
				n == 6;
			
			var chk=Math.abs(n)+1;
			var str=chk+",";
			
			while(chk+7 <= chong)
			{
				var friday = chk + 7;
				
				if(friday > chong)
				{
					friday = friday - chong;
				}
				
				str=str+friday+",";
				chk=chk+7;
				str=str.replace(/,/g,"일 "); 
				// 자바스크립트를 이용해서 바꿀 경우에는 정규표현식을 사용해줘야 한다!
			}
			 
			 
			calData=calData+"</tr>";
			calData=calData+"<tr><td colspan='7'>" +str+ "</td></tr>";

			document.getElementById("calender2").innerHTML=calData;
		}
		
		window.onload=function()
		{
			calView2();
		}
	</script>
</head>
<body>
	<div id="calender2"> </div>
</body>
</html>