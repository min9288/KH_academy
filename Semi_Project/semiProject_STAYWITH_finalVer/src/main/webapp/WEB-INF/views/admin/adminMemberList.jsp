<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int reqPage = (int)request.getAttribute("reqPage");
    	String dataType = (String)request.getAttribute("dataType");
    	String data = (String)request.getAttribute("data");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
.search_content
{
	margin-top: 20px;
}

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
			<div class = "admin_Title_text">전체 멤버 목록</div> 
			<div class = "admin_Title_Line"></div>
		</div>
		<div class = "admin_OrderList">		
			<div class = "admin_table">
			<table class = "table-hover table-bordered Member_Content" style = "width:100%;">
				<tr class = "table-primary">
					<th>회원 번호</th><th>회원 아이디</th><th>한글이름</th><th>Last name</th><th>First name</th>
					<th>회원 등급</th><th>가입일</th>
				</tr>									
			</table>
			<div class = "search_content">
			<div class="btn-group " role="group" aria-label="Basic radio toggle button group">
			  <input type="radio" class="btn-check" name="btnradio" id="radio_Id" autocomplete="off" checked="">
			  <label class="btn btn-outline-secondary" for="radio_Id">회원 id</label>
			  <input type="radio" class="btn-check" name="btnradio" id="radio_Name" autocomplete="off" checked="">
			  <label class="btn btn-outline-secondary" for="radio_Name">회원 이름</label>
			  <input type="radio" class="btn-check" name="btnradio" id="radio_Level" autocomplete="off" checked="">
			  <label class="btn btn-outline-secondary" for="radio_Level">회원 등급</label>
			</div>
			<input type = "text" id = "search_Data">
			<button type="button" class="btn btn-secondary" id = "search_Btn">검색</button>
			</div>
			
			<div class = "pageNaviContainer">
				<div id = "pageNavi"></div>	
			</div>					
			</div>			
			<input type ="hidden" id = "reqPage" value = "<%=reqPage %>">
			<input type ="hidden" id = "dataType" value = "<%=dataType %>">
			<input type ="hidden" id = "data" value = "<%=data %>">
		</div>			
	</div>
</div>
</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>	
	<script>
	$(function(){
		$(".subnavi").eq(2).find("a").eq(1).css("background-color","#d6c6a5")
   		$(".subnavi").eq(2).find("a").eq(1).children().show();		
	});
	</script>	
<script>
$(function()
{	
	var Qtable = $('.Member_Content');
	var reqPage = $('#reqPage').val();
	var dataType = $('#dataType').val();
	var data = $('#data').val();
	
	var pageNavi = $('#pageNavi');
	
	
	var msg = false;
	$.ajax
	({
		url 	: 	"/admin_GetMemberList", 	//서블릿을 요청할지 매핑값 
		data 	:	
		{			
			reqPage:reqPage,
			dataType:dataType,
			data:data
		},			
		type	: 	"get",				// method 설정
		success	: function(data)		// 성공시와 에러시, 그리고 완료시
		{			
			var list  = data.list;
			if(list != null)
			{
				indexMax = list.length;	
				
				for(var i = 0; i < indexMax; ++i)
				{					
					var html = 
					"<tr class = 'table-light info' id = 'Member_List'>";
					var member_No = "<td>"+list[i].member_No +"</td>";
					var member_Id = "<td>"+list[i].member_Id +"</td>";
					var member_Kname = "<td>"+list[i].member_Kname +"</td>";
					var member_Lname = "<td>"+list[i].member_Lname +"</td>";
					var member_Fname = "<td>"+list[i].member_Fname +"</td>";
					var member_Level = "<td>"+list[i].member_Level +"</td>";
					var enroll_Date = "<td>"+list[i].enroll_Date +"</td>";
					var tail = "</tr>";
					
					html += member_No+ member_Id+ member_Kname + member_Lname + member_Fname + member_Level + enroll_Date +tail;
					Qtable.append(html);					
				}
				
				pageNavi.append(data.pageNavi);
				
				if(indexMax == 0)
				{
					html += "<tr class = 'table-light' id = 'Member_List'><td>해당 자료 없음</td></tr>";
					Qtable.append(html);					
				}
			}			
			else
			{
				console.log("Member_List null return");
			}
		},
		error	: function()
		{
			console.log("Member_List Fail __ 001");
		}				
	});	
	
	$(document.body).delegate('#Member_List', 'click', 
	function() 
	{
		if($(this).children(1).html() != '해당 자료 없음')
		window.location.href = '/memberViewDetail?mNum='+$(this).children(1).html();		
	});
	
	$(document.body).delegate('#search_Btn', 'click', 
	function() 
	{
		var data = $('#search_Data').val();
		
		var radio_Id = $('#radio_Id').is(':checked');		
		var radio_Name = $('#radio_Name').is(':checked');
		var radio_Level = $('#radio_Level').is(':checked');
		
		var reqPage = 1;
		var dataType = "";
		if(radio_Id == true)
		{
			dataType = "MEMBER_ID";
		}
		else if(radio_Name == true)
		{			
			dataType = "MEMBER_KNAME";
		}
		else if(radio_Level == true)
		{
			dataType = "MEMBER_LEVEL";
		}		
		
		$.ajax
		({
			url 	: 	"/admin_GetMemberList", 	
			data 	:	
			{			
				data:data,
				dataType:dataType,
				reqPage:reqPage
			},			
			type	: 	"get",				
			success	: function(data)		
			{			
				var indexMax = data.list.length;	
				Qtable.empty();
				var table_head = 
					"<tr class = 'table-primary'><th>회원 번호</th><th>회원 아이디</th><th>한글이름</th><th>Last name</th><th>First name</th><th>회원 등급</th><th>가입일</th></tr>";
				Qtable.append(table_head);
				for(var i = 0; i < indexMax; ++i)
				{		
					var list  = data.list;
					var html = 
					"<tr class = 'table-light info' id = 'Member_List'>";
					var member_No = "<td>"+list[i].member_No +"</td>";
					var member_Id = "<td>"+list[i].member_Id +"</td>";
					var member_Kname = "<td>"+list[i].member_Kname +"</td>";
					var member_Lname = "<td>"+list[i].member_Lname +"</td>";
					var member_Fname = "<td>"+list[i].member_Fname +"</td>";
					var member_Level = "<td>"+list[i].member_Level +"</td>";
					var enroll_Date = "<td>"+list[i].enroll_Date +"</td>";
					var tail = "</tr>";
					
					html += member_No+ member_Id+ member_Kname + member_Lname + member_Fname + member_Level + enroll_Date +tail;
					Qtable.append(html);					
				}				
				
				pageNavi.empty();
				pageNavi.append(data.pageNavi);
				
				if(indexMax == 0)
				{
					html += "<tr class = 'table-light' id = 'Member_List'><td>해당 자료 없음</td></tr>";
					Qtable.append(html);
				}
			},
			error	: function()
			{
				console.log("Member_List Fail __ 001");
			}				
		});	
		
	});
});
</script>
</body>
</html>