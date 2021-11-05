<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%    	
    	int reqPage = (int)request.getAttribute("reqPage");    	
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/css/admin.css">
<title>고객 문의 내역</title>

<link rel="stylesheet" href="/css/bootstrap.css">
<!-- jQuery라이브러리 추가(2개) -->
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.bundle.js"></script>
<link rel="stylesheet" href="/css/default.css">
<link rel="stylesheet" href="/css/admin.css">

<style>
.admin_OrderList
{
	width: 100%;	
}
.pageNaviContainer
{
	margin-top : 20px;
	text-align: center;
	width: 100%;
	
}
.pageNaviContainer>div>ul
{
	justify-content: center;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>	
<div class = "container-fluid g_admin">	
<div class = "content_field">
	<div class = "admin_sideField">
		<%@include file="/WEB-INF/views/admin/admin-subnavi.jsp" %>		
	</div>	
	<div class = "admin_OrderList">		
		<div class = "admin_SubTitle">
			<div class = "admin_Title_text">다이닝 예약 내역</div> 
			<div class = "admin_Title_Line"></div>
		</div>
		<div class = "admin_OrderList">		
			<div class = "admin_table">
			<table class = "table-hover table-bordered Question_Content" style = "width:100%;">
				<tr class = "table-primary">
					<th>예약 번호</th><th>다이닝 번호</th><th>회원 아이디</th><th>예약일</th><th>방문시간</th>
					<th>좌석 유형</th><th>예약상태</th>
				</tr>									
			</table>
			<div class = "pageNaviContainer">
				<div id = "pageNavi"></div>	
			</div>					
			</div>
			<input type ="hidden" id = "reqPage" value = "<%=reqPage %>">	
		</div>			
	</div>
</div>
</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>	
	<script>
	$(function(){
		$(".subnavi").eq(1).find("a").eq(1).css("background-color","#d6c6a5")
   		$(".subnavi").eq(1).find("a").eq(1).children().show();		
	});
	</script>
<script>
$(function()
{	
	var Qtable = $('.Question_Content');
	var reqPage = $('#reqPage').val();
	var pageNavi = $('#pageNavi');
	
	
	var msg = false;
	$.ajax({
		url 	: 	"/adminDiningResList", 	//서블릿을 요청할지 매핑값 
		data 	:	
		{
			reqPage:reqPage	
		},			// 서블릿에 전송할 데이터 오브젝트
		type	: 	"get",				// method 설정
		success	: function(data)		// 성공시와 에러시, 그리고 완료시
		{			
			var list  = data.list;
			if(list != null)
			{
				indexMax = list.length;	
				
				for(var i = 0; i < indexMax; ++i)
				{
					var reply = "";
					
					var html = 
					"<tr class = 'table-light info' id = 'DiningRes_List'>";
					var res_No = "<td>"+list[i].res_No +"</td>";
					var dining_No = "<td>"+list[i].dining_No +"</td>";
					var member_Id = "<td>"+list[i].member_Id +"</td>";
					var res_Date = "<td>"+list[i].res_Date +"</td>";
					var res_Time = "<td>"+list[i].res_Time +"</td>";
					
					var seat_string = "";
					
					if(list[i].seat_Type == 1)
						seat_string = "Table";
					else if(list[i].seat_Type == 2)
						seat_string = "Room";
					
					
					var seat_Type = "<td>"+seat_string +"</td>";
								
					
					var pay_status = "";
					if(list[i].res_Status == 1)
					{
						pay_status = "<td style = 'background-color: #D7DBD1'>예약 완료</td>";	
					}						
					else if(list[i].res_Status == 2)
					{
						pay_status = "<td style = 'background-color: #BBC7BA'>사용 완료</td>";	
					}						
					else if(list[i].res_Status == 3)
					{
						pay_status = "<td style = 'background-color: #F9D5D3'>취소 신청</td>";
					}						
					else if(list[i].res_Status == 4)
					{
						pay_status = "<td style = 'color: #ffffff; background-color: #807F89'>취소 완료</td>";	
					}
					
					var res_Status = pay_status;				
					
					
					var tail = "</tr>";
					
					html += res_No+ dining_No+ member_Id + res_Date + res_Time + seat_Type + res_Status +tail;
					Qtable.append(html);					
				}
				
				pageNavi.append(data.pageNavi);
				
				if(indexMax == 0)
				{
					html += "<tr class = 'table-light' id = 'DiningRes_List'><td>해당 자료 없음</td></tr>";
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
	
	$(document.body).delegate('#DiningRes_List', 'click', 
	function() 
	{
		if($(this).children(1).html() != '해당 자료 없음')
		window.location.href = '/diningResViewDetail?dNum='+$(this).children(1).html();		
	});
});
</script>
</body>
</html>