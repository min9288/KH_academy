<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>관리자 개요</title>

<style>
	.g_admin
	{
		text-align: center;
	}
	
	.content_field
	{
		width: 1200px;
		margin-left: 226px;
		margin-right: 226px;		
		display: flex;
		text-align: center;
		
		margin: 0 auto;
		
		margin-bottom: 100px;
		margin-top : 50px;
	}
	
	.admin_sideField
	{
		width: 265px;
		display: inline-block;		
		
		margin-right: 60px;
	}
	
	.admin_mainField
	{
		display: inline-block;		
	}
	
	.admin_subchart>.admin_card_box>.card
	{
		width: 200px;
		display: inline-block;
	}
	
	.admin_SubTitle
	{
		text-align: left;
		font-size: 18px;
		font : "ns_b";
		font-weight: bolder;
		
		padding-left: 20px;	
		margin-top: 50px;	
	}
	
	.admin_SubFirst
	{
		text-align: left;
		font-size: 18px;
		font : "ns_b";
		font-weight: bolder;
		
		padding-left: 20px;	
		margin-top: 20px;	
	}
	
	.admin_Title_Line
	{
		width: 50%;
		border-bottom: 3px solid #565C54;
	}
	
	.admin_table
	{
		font-size: 12px;
		margin-top: 15px;
	}
	
	#subnavi
	{
		text-align: left;
	}
</style>

<link rel="stylesheet" href="/css/bootstrap.css">
<!-- jQuery라이브러리 추가(2개) -->
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.bundle.js"></script>
<link rel="stylesheet" href="/css/default.css">
<script type="text/javascript" src="/js/admin_mainChart.js"></script>
<script>
$(function()
{	
	var index = 0;
	var ctx = document.getElementById('myChart').getContext('2d'); 
	
	$.ajax
	({
		url 	: 	"/admin_MainChart", 	//서블릿을 요청할지 매핑값 			
		type	: 	"get",				// method 설정
		success	: function(data)		// 성공시와 에러시, 그리고 완료시
		{	
			var count = data.lenght;
			var i  = 0;
			var j = 0;
			
			var chart = new Chart(ctx, 
			{ 				
				// 챠트 종류를 선택 
				type: 'line', 
				data: { labels: ['date', data[i++].date, data[i++].date, data[i++].date, data[i++].date, data[i++].date, data[i++].date, data[i++].date], 
				datasets: [{ label: '예약 이용수', 
				backgroundColor: '#565C54', 
				borderColor: '#B9A989', 
				data: [-0.1, data[j++].res_Count,data[j++].res_Count,data[j++].res_Count,data[j++].res_Count,data[j++].res_Count,data[j++].res_Count,data[j++].res_Count] }] }, 
				// 옵션 
				options: {}
			});	
		},
		error	: function()
		{
			console.log("Question_Content Fail __ 001");
		}
	});
});
</script>


</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>	
<div class = "container-fluid g_admin">	
<div class = "content_field">
	<div class = "admin_sideField">
		<%@include file="/WEB-INF/views/admin/admin-subnavi.jsp" %>		
	</div>
	<div class = "main-content admin_mainField">
		<div class = "admin_SubFirst">
			<div class = "admin_Title_text">관리자 개요</div> 
			<div class = "admin_Title_Line"></div>
		</div>
		<div class = "admin_mainchart">		
			<canvas id="myChart"></canvas>		
		</div>
		<div class = "admin_subchart">
			<div class = "admin_card_box">
				<div class="card"> 
					<div class="card-body"> 
						<canvas id="adminSubChart_00"></canvas> 
						<div class = "card_text">당일 예약 진행률</div>
					</div> 			
				</div>	
				<div class="card"> 
					<div class="card-body"> 
						<canvas id="adminSubChart_01"></canvas> 
						<div class = "card_text">당일 예약 취소율</div>
					</div> 			
				</div>
				<div class="card"> 
					<div class="card-body"> 
						<canvas id="adminSubChart_02"></canvas> 
						<div class = "card_text">공실율</div>
					</div> 			
				</div>
				<div class="card"> 
					<div class="card-body"> 
						<canvas id="adminSubChart_03"></canvas> 
						<div class = "card_text">가용 공실율</div>
					</div> 			
				</div>
			</div>
		</div>	
		<div class = "admin_OrderList">		
			<div class = "admin_SubTitle">
				<div class = "admin_Title_text">답변을 기다리는 문의</div> 
				<div class = "admin_Title_Line"></div>
			</div>
			<div class = "admin_table">
				<table class = "table-hover Question_Content" style = "width:100%;">
					<tr class = "table-primary">
						<th>문의 번호</th><th>문의 구분</th><th>문의 타입</th><th>제목</th><th>문의 작성자</th>
						<th>이용날짜</th>
					</tr>									
				</table>			
			</div>			
		</div>
		<div class = "admin_ReserList">		
			<div class = "admin_SubTitle">
				<div class = "admin_Title_text">객실 취소 문의</div> 
				<div class = "admin_Title_Line"></div>				
			</div>	
			<div class = "admin_table">
				<table class = "table-hover RoomRes_List_Content" style = "width:100%;">
					<tr class = "table-primary">
						<th>예약 번호</th><th>객실 번호</th><th>회원 이름</th><th>체크인</th><th>결제상태</th>
						<th>투숙성인</th><th>투숙소인</th>
					</tr>									
				</table>			
			</div>					
		</div>		
		
	</div><!-- admin_mainField -->
</div>
</div><!-- container End-->
<%@include file="/WEB-INF/views/common/footer.jsp" %>
<script>
	$(function(){
		$(".subnavi").eq(0).find("a").eq(0).css("background-color","#d6c6a5")
   		$(".subnavi").eq(0).find("a").eq(0).children().show();		
	});
	</script>	
<script>
$(function()
{	
	var Qtable = $('.Question_Content');
	var testValue = 10;
	var msg = true;
	var QreqPage = 1;
	$.ajax({
		url 	: 	"/adminQuestion", 	//서블릿을 요청할지 매핑값 
		data 	:	{msg:msg,
					reqPage:QreqPage
					},			
		type	: 	"get",				// method 설정
		success	: function(data)		// 성공시와 에러시, 그리고 완료시
		{			
			if(data != null)
			{
				var indexMax = 0;
				var list = data.list;
				
				
				if(list.length > 5)
					indexMax = 5;
				else
					indexMax = list.length;	
				
				for(var i = 0; i < indexMax; ++i)
				{
					var html = 
					"<tr class = 'table-light' id = 'Question_List'>";
					var qNo = "<td>"+list[i].q_No +"</td>";
					var qCate = "<td>"+list[i].q_Category +"</td>";
					var qType = "<td>"+list[i].q_Type +"</td>";
					var qTitle = "<td>"+list[i].q_Title +"</td>";
					var qName = "<td>"+list[i].q_Name +"</td>";
					var qUsed = "<td>"+list[i].used_Date +"</td>";
					var tail = "</tr>";
					
					html += qNo+ qCate+ qType + qTitle + qName + qUsed + tail;
					Qtable.append(html);
				}
				
				if(indexMax == 0)
				{
					html += "<tr class = 'table-light' id = 'Question_List'><td>해당 자료 없음</td></tr>";
					Qtable.append(html);					
				}	
			}			
			else
			{
				console.log("Question_Content null return");
			}
		},
		error	: function()
		{
			console.log("Question_Content Fail __ 001");
		}				
	});
	
	$(document.body).delegate('#Question_List', 'click', 
	function() 
	{		
		if($(this).children(1).html() != '해당 자료 없음')
			window.location.href = '/questionViewDetail?qNum='+$(this).children(1).html();
	});
	
	
	//------------------------------------------------------//
	
	var Rtable = $('.RoomRes_List_Content');
	var RreqPage = 1;
	
	var msg = false;
	$.ajax
	({
		url 	: 	"/admin_GetRoomList", 	//서블릿을 요청할지 매핑값 
		data 	:	
		{
			msg:msg,
			reqPage:RreqPage
		},					// 서블릿에 전송할 데이터 오브젝트
		type	: 	"get",				// method 설정
		success	: function(data)		// 성공시와 에러시, 그리고 완료시
		{			
			if(data != null)
			{					
				var list  = data.list;
				var indexMax = 0;
				if(list.length > 5)
					indexMax = 5;
				else
					indexMax = list.length;
				
				for(var i = 0; i < indexMax; ++i)
				{
					var html = 	"<tr class = 'table-light' id = 'Roomres_List'>";
					var No = "<td>"+list[i].res_Num +"</td>";
					var roomNum = "<td>"+list[i].room_No +"</td>";
					var name = "<td>"+list[i].member_Kname +"</td>";
					var chackin = "<td>"+list[i].checkin +"</td>";
					var payStatus = "<td>"+list[i].pay_Status +"</td>";
					var adult = "<td>"+list[i].adult +"</td>";
					var kid = "<td>"+list[i].kid +"</td>";
					var tail = "</tr>";
							
					html += No+roomNum+name+chackin+payStatus+adult+kid+tail;
					Rtable.append(html);
				}
			}
			else
			{
				console.log("RoomRes_List_Content null return");
			}
		},
		error	: function()
		{
			console.log("OrderList_Content Fail __ 001");
		}				
	});
	
	$(document.body).delegate('#Roomres_List', 'click', 
	function() 
	{		
		if($(this).children(1).html() != '해당 자료 없음')
			window.location.href = '/roomResViewDetail?rNum='+$(this).children(1).html();
	});

});
</script>

</body>
</html>