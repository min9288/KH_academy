<%@page import="admin.model.vo.Admin_Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Admin_Question q = (Admin_Question)request.getAttribute("q");    	
    
    	String reply = "";
    	if(q.getQ_reply() == false)
    	{
    		reply = "답변 필요";
    	}
    	else
    	{
    		reply = "답변 완료";
    	}
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
.admin_table
{
	width: 70%;
	display: block;	
}

.admin_QView_Table
{
	margin-top : 20px;
}


.admin_QView_Table
{
	border : 1px solid black;
}

.table-primary>th
{
	font-size: 13px;	
}
.table-primary>td
{
	text-align: left;
	padding-left: 20px;
	height: 40px;
}
.a_Inputbox
{
	width: 100%;
	float: left;
	text-align: left;
	
	margin-top: 20px;
}
.a_Inputbox>div
{
	display: inline-block;	
}
.admin_submit_btn
{
	margin-top: 20px;	
	text-align: center;
}
.photo>img
{
    max-width :300px;
    max-height: 200px;
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
	<div class = "admin_table">
		<div class = "admin_SubTitle">
				<div class = "admin_Title_text">고객문의 상세</div> 
				<div class = "admin_Title_Line"></div>				
			</div>
		<table class = "table-hover table-bordered admin_QView_Table" style = "width:100%;">
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">문의 번호</th><td class = "col-md-9 q_table_content" id = "q_no"><%=q.getQ_No() %></td>
			</tr>	
			<tr class = "table-primary">
				<th class = "q_table_00">문의 타입</th><td><%=q.getQ_Type() %></td>
			</tr>
			<tr class = "table-primary">
				<th>문의 제목</th><td><%=q.getQ_Title()%></td>
			</tr>
			<tr class = "table-primary">
				<th>예약 번호</th><td><%=q.getRes_No()%></td>
			</tr>
			<tr class = "table-primary">
				<th>이용 날짜</th><td><%= q.getUsed_Date() %></td>
			</tr>
			<tr class = "table-primary">
				<th>고객 성함</th><td><%= q.getQ_Name() %></td>
			</tr>
			<tr class = "table-primary">
				<th>고객 이메일</th><td><%= q.getEmail() %></td>
			</tr>
			<tr class = "table-primary">
				<th>고객 전화번호</th><td><%= q.getPhone() %></td>
			</tr>
			<tr class = "table-primary">
				<input type = "hidden" id = "FileNameSave" value = "<%= q.getQ_FileName() %>">
				<th>첨부파일</th><td id = "img_position"></td>
			</tr>			
			<tr class = "table-primary">		
				<th>내용</th><td><%= q.getQ_Content() %></td>
			</tr>
			<tr class = "table-primary">		
				<th>답변 여부</th><td><%= reply %></td>
			</tr>								
		</table>	
		
		<div class = "testdiv">
		<form action = "/sendAnswer" method = "post">	
			<input type = "hidden" name = "q_no" value = "<%=q.getQ_No()%>">	
			<input type = "hidden" name = "reply" value = "<%=q.getQ_reply()%>">		
			<div class = "admin_SubTitle">
				<div class = "admin_Title_text">문의 답변</div> 
				<div class = "admin_Title_Line"></div>				
			</div>
			<table class = "table-hover table-bordered admin_QView_Table" style = "width:100%;">				
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">문의 답변 내용</th>
				<td class = "col-md-9 q_table_content">
					<textarea class= "answer" cols="100" rows="10" name = "a_content"></textarea>
				</td>
			</tr>
			</table>
			<div class = "admin_submit_btn">
		<button type="submit" class="btn btn-secondary" id = "submitButton"> < 답변 제출 > </button>	
	</div>
		</form>
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
	var answer_content = $('.answer');
	var button = $("#submitButton");
	var q_no = $("#q_no").html();	
	
	$.ajax({
		url 	: 	"/admin_GetAnswer", 	//서블릿을 요청할지 매핑값
		data 	:	{q_no:q_no},			
		type	: 	"get",				// method 설정
		success	: function(data)		// 성공시와 에러시, 그리고 완료시
		{
			if(data != null)
			{
				answer_content.html(data.a_Content);		
				button.html("< 답변 수정 >");
			}				
		},
		error	: function()
		{
			console.log("Question_Content Fail __ 001");
		}				
	});
	
	var img = $('#FileNameSave').val();
	if(img && img != "null")
	{
		var img_pos = $('#img_position');		
		var fileName = img;
			
		var html = "";
		html += "<div class = 'photo'>";		
		html += "<img src = '/upload/question/"+fileName+"'></div>";
		img_pos.append(html);
	}
});
</script>

</body>
</html>