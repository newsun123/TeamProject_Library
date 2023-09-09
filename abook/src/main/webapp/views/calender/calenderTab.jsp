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
      margin-top:50px;
    }
    #cal td {
      border:1px solid #eeeeee;
      text-align:center;
    }
    #cal tr td:first-child {
      color:red;
    }
    #cal tr td:last-child {
      color:blue;
    }
    #cal .inner {
    	font-size:12px;
    	width:50px;
    	height:20px; 
    }
 </style>
<script>
	function calView(y,m)
	{
		if(!y) 
		/* 달력의 y,m를 받아와야해서 , 매개변수 받아줘야한다!  */
		{
			var today=new Date();
			var y=today.getFullYear();
			var m=today.getMonth();
		}
		if(m == -1)
		{
			y=y-1;
			m=11;
		}

		if(m == 12)
		{
			y=y+1;
			m=0;
		}	
		
		var xday=new Date(y,m,1);
		
		var month=[31,28,31,30,31,30,31,31,30,31,30,31];
		var chong=month[m];
		var yoil=xday.getDay();
		
		if( (y % 4 == 0 && y % 100 != 0) || y%400 == 0 )
		{
			if(m == 1)
				chong =chong+1;
		}
		
		var ju=Math.ceil( (chong+yoil)/7 );
		
		var calData="<table width='200' height='150' border='0' id='cal'>";
	
		calData=calData+"<caption>";
		
		calData=calData+" <span onclick='calView("+y+","+(m-1)+")'> << </span>";
		
		calData=calData+y+"년 "+(m+1)+"월";
		
		calData=calData+" <span onclick='calView("+y+","+(m+1)+")'> >> </span>";
		
		calData=calData+" </caption>";
		calData=calData+"<tr>";
		calData=calData+"<td> 일 </td>";
		calData=calData+"<td> 월 </td>";
		calData=calData+"<td> 화 </td>";
		calData=calData+"<td> 수 </td>";
		calData=calData+"<td> 목 </td>";
		calData=calData+"<td> 금 </td>";
		calData=calData+"<td> 토 </td>";
		calData=calData+"</tr>";
		
		var day=1;
		for(i=1; i<=ju; i++)
		{
			calData=calData+"<tr>";
			
			for(j=0; j<7; j++)
			{		
				if( (i==1 && j<yoil) || chong < day)
				{
					calData=calData+"<td> &nbsp; </td>";
				}
				else 
				{	
					var sday=y+"-"+(m+1)+"-"+day;
					/*
						빈값을 만들고 , 그 빈값에 값을 넣어주고
						그 해당하는 값에 필요한 값을 넣어준다.
					*/
					var insertText="";
					if( j == 5 )
					{
						insertText="휴관일";
					}
					calData=calData+"<td class='chktd' onclicsk='thisDay("+y+","+(m+1)+","+day+")'>"+day+
					" <div class='inner'> "+insertText+" </div></td>";
					
					day++;
				}
				
			}
			calData=calData+"</tr>";
		}
		document.getElementById("calender").innerHTML=calData;
		
		/* 
		 db에서 값을 가져와야하기때문에 , ajax를 통해서 값 보내주기!
		 단 값을 보낼땐 함수명을 다르게 해서 만들어줘야 한다!
		*/
		
		var chk=new XMLHttpRequest();
		chk.onload=function()
		{
			var data=JSON.parse(chk.responseText);
			// alert(chk.responseText);
			var str=data.str;
			for(i=0; i<data.length; i++)
			{
				document.getElementsByClassName("chktd")[data[i].xday-1].style.background="#eeeeee";
				
				document.getElementsByClassName("inner")[data[i].xday-1].innerText=data[i].str;
			}
		}
			chk.open("get","cal2?y="+y+"&m="+(m+1));
			chk.send();
		}
	
	/* calview 호출 */
	window.onload=function()
	{
		calView();
	}
	
	function thisDay(y,m,d)
	{
		m=m+"";
		d=d+"";
		m=m.padStart(2,'0');
		d=d.padStart(2,'0');
		
		document.getElementById("calender").value=y+"-"+m+"-"+d;
	}

</script>
</head>
<body>
	<!--
		sitemesh에 제이쿼리 onload가 있어서 , 충돌이 생김 그래서
		익명함수를 통해 함수를 호출한다.
	-->
	<div id="calender">
	</div>
</body>
</html>