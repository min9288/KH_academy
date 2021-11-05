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
			<div class = "admin_Title_text">고객 문의 내역</div> 
			<div class = "admin_Title_Line"></div>
		</div>
		<div class = "admin_OrderList">		
			<div class = "admin_table">
			<table class = "table-hover table-bordered Question_Content" style = "width:100%;">
				<tr class = "table-primary">
					<th>문의 번호</th><th>문의 구분</th><th>문의 타입</th><th>제목</th><th>문의 작성자</th>
					<th>이용날짜</th><th>답변 여부</th>
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
		$(".subnavi").eq(2).find("a").eq(0).css("background-color","#d6c6a5")
   		$(".subnavi").eq(2).find("a").eq(0).children().show();		
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
		url 	: 	"/adminQuestion", 	//서블릿을 요청할지 매핑값 
		data 	:	
		{
			msg:msg,
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
					"<tr class = 'table-light info' id = 'Question_List'>";
					var qNo = "<td>"+list[i].q_No +"</td>";
					var qCate = "<td>"+list[i].q_Category +"</td>";
					var qType = "<td>"+list[i].q_Type +"</td>";
					var qTitle = "<td>"+list[i].q_Title +"</td>";
					var qName = "<td>"+list[i].q_Name +"</td>";
					var qUsed = "<td>"+list[i].used_Date +"</td>";
					var qReply = "";
					
					if(list[i].q_reply == true)
					{
						qReply = "<td style = 'background-color: #D4CDC1'> 답변 완료 </td>";
					}
					else
					{
						qReply = "<td style = 'background-color: #F9D5D3'> 답변 대기중 </td>";
					}
					
					var tail = "</tr>";
					
					html += qNo+ qCate+ qType + qTitle + qName + qUsed + qReply +tail;
					Qtable.append(html);					
				}
				
				pageNavi.append(data.pageNavi);
				
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
});
</script>
</body>
</html>		