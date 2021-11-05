<%@page import="admin.model.vo.Dining_Res"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%    	
    	Dining_Res d = (Dining_Res)request.getAttribute("d");
    	//Question q = (Question)request.getAttribute("q");    	
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
</head>
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
				<div class = "admin_Title_text">다이닝 예약 상세</div> 
				<div class = "admin_Title_Line"></div>				
			</div>
		<table class = "table-hover table-bordered admin_QView_Table" style = "width:100%;">
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">다이닝예약 번호</th>
				<td class = "col-md-9 q_table_content" id = "res_No"><%=d.getRes_No() %></td>
			</tr>		
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">다이닝 번호</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "text" id = "dining_No" value = "<%=d.getDining_No() %>">	
				</td>
			</tr>
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">예약 고객 ID</th>
				<td class = "col-md-9 q_table_content" id = "member_Id"><%=d.getMember_Id() %></td>
			</tr>			
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">이용 고객(성인)</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "text" id = "guests_Adt" value = "<%=d.getGuests_Adt_Cnt() %>">					
				</td>
			</tr>
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">이용 고객(소인)</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "text" id = "guests_Cnt" value = "<%=d.getGuests_Kid_Cnt() %>">					
				</td>
			</tr>	
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">예약 날짜</th>
				<td class = "col-md-9 q_table_content" id = "q_no">					
					<input type = "text" id = "res_Date" value = "<%=d.getRes_Date() %>">	
				</td>
			</tr>			
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">입장 예상 시간</th>
				<td class = "col-md-9 q_table_content" id = "q_no">			
					<input type = "text" id = "res_Time" value = "<%=d.getRes_Time() %>">	
				</td>
			</tr>
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">시간 타입</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "hidden" id = "time_type" value = "<%=d.getTime_Type() %>">
					<select id = "select_Timetype" name = "pay_Status">
						<option value = "1">런치</option>
						<option value = "2">디너</option>						
					</select>				
				</td>
			</tr>
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">좌석 타입</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "hidden" id = "seat_type" value = "<%=d.getSeat_Type() %>">
					<select id = "select_Seattype" name = "pay_Status">
						<option value = "1">테이블</option>
						<option value = "2">룸</option>					
					</select>				
				</td>
			</tr>	
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">예약 상태</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "hidden" id = "payStatus_save" value = "<%=d.getRes_Status() %>">
					<select id = "select_paySatus" name = "pay_Status">
						<option value = "1">예약 완료</option>
						<option value = "2">사용 완료</option>
						<option value = "3">취소 신청</option>
						<option value = "4">취소 완료</option>
					</select>				
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
		$(".subnavi").eq(1).find("a").eq(1).css("background-color","#d6c6a5")
   		$(".subnavi").eq(1).find("a").eq(1).children().show();		
	});
	</script>
<script>
$(function()
{
	//예약 상태 초기화 코드	
	var time_type = $('#time_type').val();
	$("#select_Timetype").val(time_type);
	
	var seat_type = $('#seat_type').val();
	$("#select_Seattype").val(seat_type);
	
	var payStatus_save = $('#payStatus_save').val();
	$("#select_paySatus").val(payStatus_save);
	
	//예약 수정 버튼연동
	$("#submitButton").click(function()
	{	
		var res_No = $('#res_No').html(); 
		var dining_No = $('#dining_No').val();
		
		var member_Id = $('#member_Id').html();
		
		var guests_Adt = $('#guests_Adt').val();
		var guests_Cnt = $('#guests_Cnt').val();
		var res_Date = $('#res_Date').val();
		var res_Time = $('#res_Time').val();
		
		var select_Timetype = $('#select_Timetype').val();
		var select_Seattype = $('#select_Seattype').val();
		var select_paySatus = $('#select_paySatus').val();
		
		$.ajax({ 
			url 	: 	"/admin_UpdateDiningRes",
			type	: 	"post",
			data 	:	
			{	
				res_No:res_No,
				dining_No:dining_No,
				member_Id:member_Id,
				guests_Adt:guests_Adt,
				guests_Cnt:guests_Cnt,
				res_Date:res_Date,
				res_Time:res_Time,
				select_Timetype:select_Timetype,
				select_Seattype:select_Seattype,
				select_paySatus:select_paySatus
			},				
			success	: function(data)		
			{
				if(data == 1)
					alert("변경 성공");
				
				console.log("success update dining");
				location.replace("/adminDiningList?reqPage=1");
			},
			error	: function()
			{
				console.log("Update dining");
			}	
		});
		
	});
		
});
</script>
</body>
</html>