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
			<div class = "admin_Title_text">라이프 스타일 예약 내역</div> 
			<div class = "admin_Title_Line"></div>
		</div>
		<div class = "admin_RoomList">		
			<div class = "admin_table">
			<table class = "table-hover table-bordered Lf_Content" style = "width:100%;">
				<tr class = "table-primary">
					<th>예약 번호</th><th>라이프 스타일</th><th>회원 ID</th><th>예약 인원</th><th>예약 날짜</th>
					<th>방문시간</th><th>예약 상태</th><th>가격</th>
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
		$(".subnavi").eq(1).find("a").eq(2).css("background-color","#d6c6a5")
   		$(".subnavi").eq(1).find("a").eq(2).children().show();		
	});
	</script>	
<script>
$(function()
{	
	var Qtable = $('.Lf_Content');
	var reqPage = $('#reqPage').val();
	var pageNavi = $('#pageNavi');
	
	
	var msg = false;
	$.ajax({
		url 	: 	"/admin_GetLfList", 	//서블릿을 요청할지 매핑값 
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
					"<tr class = 'table-light info' id = 'LfRes_List'>";
					var res_No = "<td>"+list[i].res_No +"</td>";
					var lf_No = "<td>"+list[i].lf_No +"</td>";
					var member_Id = "<td>"+list[i].member_Id +"</td>";
					var res_People = "<td>"+list[i].res_People +"</td>";
					var res_Date = "<td>"+list[i].res_Date +"</td>";
					var res_Time = "<td>"+list[i].res_Time +"</td>";
					var status = "";
					var price = "<td>"+list[i].price +"</td>";	
					
					
					if(list[i].status == 1)
					{
						status = "<td style = 'background-color: #D7DBD1'>예약 완료</td>";	
					}						
					else if(list[i].status == 2)
					{
						status = "<td style = 'background-color: #BBC7BA'>이용 완료</td>";	
					}						
					else if(list[i].status == 3)
					{
						status = "<td style = 'background-color: #F9D5D3'>취소 신청</td>";
					}						
					else if(list[i].status == 4)
					{
						status = "<td style = 'color: #ffffff; background-color: #807F89'>취소 완료</td>";	
					}
					
					var tail = "</tr>";
					
					html += res_No + lf_No + member_Id + res_People + res_Date + res_Time + status + price + tail;
					Qtable.append(html);					
				}
				
				pageNavi.append(data.pageNavi);
				
				if(indexMax == 0)
				{
					html += "<tr class = 'table-light' id = 'LfRes_List'><td>해당 자료 없음</td></tr>";
					Qtable.append(html);					
				}
			}			
			else
			{
				console.log("LfRes_List null return");
			}
		},
		error	: function()
		{
			console.log("LfRes_List Fail __ 001");
		}				
	});	
	
	$(document.body).delegate('#LfRes_List', 'click', 
	function() 
	{
		if($(this).children(1).html() != '해당 자료 없음')
		window.location.href = '/lfResViewDetail?lNum='+$(this).children(1).html();		
	});
});
</script>
</body>
</html>