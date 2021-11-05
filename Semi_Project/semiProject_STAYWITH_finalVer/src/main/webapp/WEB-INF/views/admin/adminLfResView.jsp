<%@page import="admin.model.vo.Lf_Res"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Lf_Res r = (Lf_Res)request.getAttribute("l"); 
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

</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>	
<div class = "container-fluid g_admin">	
<div class = "content_field">
	<div class = "admin_sideField">
		<%@include file="/WEB-INF/views/admin/admin-subnavi.jsp" %>		
	</div>
	<div class = "main-content admin_mainField">
	<div class = "admin_table">
		<div class = "admin_SubTitle">
				<div class = "admin_Title_text">라이프스타일 예약 상세</div> 
				<div class = "admin_Title_Line"></div>				
			</div>
		<table class = "table-hover table-bordered admin_QView_Table" style = "width:100%;">
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">예약 번호</th>
				<td class = "col-md-9 q_table_content" id = "Res_No"><%=r.getRes_No()%></td>
			</tr>		
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">라이프스타일 번호</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "text" id = "lf_No" value = "<%=r.getLf_No() %>">	
				</td>
			</tr>
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">예약 고객 ID</th>
				<td class = "col-md-9 q_table_content" id = "q_no"><%=r.getMember_Id() %></td>
			</tr>			
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">예약 인원수</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "text" id = "res_People" value = "<%=r.getRes_People() %>">					
				</td>
			</tr>
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">예약 날짜</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "text" id = "res_Date" value = "<%=r.getRes_Date() %>">					
				</td>
			</tr>	
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">방문 시간</th>
				<td class = "col-md-9 q_table_content" id = "q_no">					
					<input type = "text" id = "res_Time" value = "<%=r.getRes_Time() %>">									
				</td>
			</tr>	
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">결제 상태</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "hidden" id = "payStatus_save" value = "<%=r.getStatus() %>">
					<select id = "select_paySatus" name = "pay_Status">
						<option value = "1">예약 완료</option>
						<option value = "2">사용 완료</option>
						<option value = "3">취소 신청</option>
						<option value = "4">취소 완료</option>
					</select>				
				</td>
			</tr>
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">가격</th>
				<td class = "col-md-9 q_table_content" id = "Res_Num">
					<input type = "text" id = "lf_Price" value = "<%=r.getPrice() %>">			
				</td>
			</tr>						
		</table>
	<div class = "admin_submit_btn">
		<button type="submit" class="btn btn-secondary" id = "submitButton"> < 예약 수정 > </button>	
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
</body>
<script>
$(function()
{
	//예약 상태 초기화 코드	
	var payStatus_save = $('#payStatus_save').val();
	$("#select_paySatus").val(payStatus_save);
	
	//예약 수정 버튼연동
	$("#submitButton").click(function()
	{	
		var res_No = $('#Res_No').html(); 
		var lf_No = $('#lf_No').val();
		var res_People = $('#res_People').val();
		var res_Date = $('#res_Date').val();
		var res_Time = $('#res_Time').val();
		var res_Status = $('#select_paySatus').val();
		var lf_Price = $('#lf_Price').val();
		
		$.ajax({ 
			url 	: 	"/admin_UpdateLfRes",
			type	: 	"post",
			data 	:	
			{	
				res_No:res_No,
				lf_No:lf_No,
				res_People:res_People,
				res_Date:res_Date,
				res_Time:res_Time,
				res_Status:res_Status,
				lf_Price:lf_Price				
			},				
			success	: function(data)		
			{
				if(data == 1)
					alert("변경 성공");
				
				console.log("success update lfResData");
				location.replace("/adminLfList?reqPage=1");
			},
			error	: function()
			{
				console.log("Update lfResData");
			}	
		});
		
	});
		
});
</script>
</html>