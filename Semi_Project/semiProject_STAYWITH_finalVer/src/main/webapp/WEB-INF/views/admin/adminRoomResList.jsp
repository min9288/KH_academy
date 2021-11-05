<%@page import="admin.model.vo.Room_Res"%>
<%@page import="java.util.ArrayList"%>
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
<title>Insert title here</title>

<link rel="stylesheet" href="/css/bootstrap.css">
<!-- jQuery라이브러리 추가(2개) -->
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.bundle.js"></script>
<link rel="stylesheet" href="/css/default.css">
<link rel="stylesheet" href="/css/admin.css">

<style>
.admin_RoomList
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
	<div class = "admin_RoomList">		
		<div class = "admin_SubTitle">
			<div class = "admin_Title_text">객실 예약 내역</div> 
			<div class = "admin_Title_Line"></div>
		</div>
		<div class = "admin_RoomList">		
			<div class = "admin_table">
			<table class = "table-hover table-bordered RoomList_Content" style = "width:100%;">
				<tr class = "table-primary">
					<th>예약 번호</th><th>객실번호</th><th>회원 이름</th><th>객실 타입</th><th>객실 이름</th>
					<th>체크인</th><th>체크아웃</th><th>결제상태</th>
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
		$(".subnavi").eq(1).find("a").eq(0).css("background-color","#d6c6a5")
   		$(".subnavi").eq(1).find("a").eq(0).children().show();		
	});
	</script>	
<script>
$(function()
{	
	var Rtable = $('.RoomList_Content');
	var reqPage = $('#reqPage').val();
	var pageNavi = $('#pageNavi');
	
	var msg = true;
	$.ajax
	({
		url 	: 	"/admin_GetRoomList", 	//서블릿을 요청할지 매핑값 
		data 	:	
		{	msg:msg,
			reqPage:reqPage		
		},					// 서블릿에 전송할 데이터 오브젝트
		type	: 	"get",				// method 설정
		success	: function(data)		// 성공시와 에러시, 그리고 완료시
		{			
			if(data != null)
			{
				var list  = data.list;
				var indexMax = list.length;				
				
				for(var i = 0; i < indexMax; ++i)
				{
					var html = 	"<tr class = 'table-light' id = 'RoomRes_List'>";
					var No = "<td>"+list[i].res_Num +"</td>";
					var roomNum = "<td>"+list[i].room_No +"</td>";
					var name = "<td>"+list[i].member_Kname +"</td>";
					var type = "<td>"+list[i].room_Type +"</td>";
					var roomName = "<td>"+list[i].room_Name +"</td>";
					
					var pay_status = "";
					if(list[i].pay_Status == 1)
					{
						pay_status = "<td style = 'background-color: #D7DBD1'>예약 완료</td>";	
					}						
					else if(list[i].pay_Status == 2)
					{
						pay_status = "<td style = 'background-color: #BBC7BA'>이용 완료</td>";	
					}						
					else if(list[i].pay_Status == 3)
					{
						pay_status = "<td style = 'background-color: #F9D5D3'>취소 신청</td>";
					}						
					else if(list[i].pay_Status == 4)
					{
						pay_status = "<td style = 'color: #ffffff; background-color: #807F89'>취소 완료</td>";	
					}
					
					
					var Price = pay_status;
					
					var checkin = "<td>"+list[i].checkin +"</td>";	
					var checkout = "<td>"+list[i].checkout +"</td>";		
					var tail = "</tr>";
							
					html += No+roomNum+name+type+roomName+checkin+checkout+Price+tail;
					Rtable.append(html);
				}
				
				pageNavi.append(data.pageNavi);
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
	
	$(document.body).delegate('#RoomRes_List', 'click', 
	function() 
	{
		console.log($(this).children(1).html());
				
		if($(this).children(1).html() != '해당 자료 없음')
			window.location.href = '/roomResViewDetail?rNum='+$(this).children(1).html();
	});
});
</script>
</body>
</html>