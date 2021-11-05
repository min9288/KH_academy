<%@page import="admin.model.vo.Room_Res"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    	Room_Res r = (Room_Res)request.getAttribute("r");    
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
				<div class = "admin_Title_text">객실 예약 상세</div> 
				<div class = "admin_Title_Line"></div>				
			</div>
		<table class = "table-hover table-bordered admin_QView_Table" style = "width:100%;">
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">예약 번호</th>
				<td class = "col-md-9 q_table_content" id = "Res_Num"><%=r.getRes_Num() %></td>
			</tr>		
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">객실 번호</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "text" id = "Roomres_RoomnoInput" value = "<%=r.getRoom_No() %>">	
				</td>
			</tr>
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">예약 고객 ID</th><td class = "col-md-9 q_table_content" id = "q_no"><%=r.getMember_Id() %></td>
			</tr>
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">예약 고객 이름</th><td class = "col-md-9 q_table_content" id = "q_no"><%=r.getMember_Kname() %></td>
			</tr>
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">객실 타입</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "text" id = "Roomres_TypeInput" value = "<%=r.getRoom_Type() %>">					
				</td>
			</tr>
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">객실 이름</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "text" id = "Roomres_RoomnameInput" value = "<%=r.getRoom_Name() %>">					
				</td>
			</tr>	
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">체크인 시간</th>
				<td class = "col-md-9 q_table_content" id = "q_no">					
					<input type = "text" id = "Roomres_ChkinInput" value = "<%=r.getCheckin() %>">
					<button class = "btn-info" id = "chkinButton">현재시간 적용</button>
					<input type = "hidden" id = "chkin_switch" value = "false">
				</td>
			</tr>			
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">체크아웃 시간</th>
				<td class = "col-md-9 q_table_content" id = "q_no">			
					<input type = "text" id = "Roomres_ChkoutInput" value = "<%=r.getCheckout() %>">
					<button class = "btn-info" id = "chkoutButton">현재시간 적용</button>
					<input type = "hidden" id = "chkout_switch" value = "true">
				</td>
			</tr>
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">결제 상태</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "hidden" id = "payStatus_save" value = "<%=r.getPay_Status() %>">
					<select id = "select_paySatus" name = "pay_Status">
						<option value = "1">예약 완료</option>
						<option value = "2">이용 완료</option>
						<option value = "3">취소 신청</option>
						<option value = "4">취소 완료</option>
					</select>				
				</td>
			</tr>
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">숙박 성인수</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "text" id = "Roomres_AdultInput" value = "<%=r.getAdult() %>">						
				</td>
			</tr>
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">숙박 아이수</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "text" id = "Roomres_KidInput" value = "<%=r.getKid() %>">
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
		$(".subnavi").eq(1).find("a").eq(0).css("background-color","#d6c6a5")
   		$(".subnavi").eq(1).find("a").eq(0).children().show();		
	});
	</script>
<script>
$(function()
{
	//예약 상태 초기화 코드	
	var payStatus = $('#payStatus_save').val();
	console.log(payStatus);
	$("#select_paySatus").val(payStatus);
	
	//chkin funciton
	$("#chkinButton").click(function()
	{
		var chkinInput = $("#Roomres_ChkinInput");		
		chkinInput.val(get_Today());
	});
	
	$("#chkoutButton").click(function()
	{
		var chkinInput = $("#Roomres_ChkoutInput");		
		chkinInput.val(get_Today());
	});
	
	//예약 수정 버튼연동
	$("#submitButton").click(function()
	{	
		var room_Res = $('#Res_Num').html(); 
		var room_No = $('#Roomres_RoomnoInput').val();
		var room_Type = $('#Roomres_TypeInput').val();		
		var room_Name = $('#Roomres_RoomnameInput').val();
		
		var chkin = $('#Roomres_ChkinInput').val();
		var chkout = $('#Roomres_ChkoutInput').val();
		
		var payStatus = $('#select_paySatus').val();
		
		var adult = $('#Roomres_AdultInput').val();
		var kid = $('#Roomres_KidInput').val();
		
		$.ajax({
			url 	: 	"/adminUpdate_Roomres", 	//서블릿을 요청할지 매핑값
			type	: 	"post",				// method 설정
			data 	:	
			{	room_Res:room_Res,
				room_No:room_No,
				room_Type:room_Type,
				room_Name:room_Name,
				chkin:chkin,
				chkout:chkout,
				payStatus:payStatus,
				adult:adult,
				kid:kid				
			},
			success	: function(data)		// 성공시와 에러시, 그리고 완료시
			{
				if(data == 1)
					alert("변경 성공");
				else
					alert("변경 실패")
					
				console.log("success update roomres");
				location.replace("/adminRoomResList?reqPage=1");
				
			},
			error	: function()
			{
				console.log("Update RoomRes_Fail");
			}				
		});
		
	});
	
	function get_Today()
	{
		var today = new Date();
		
		var printToday = today.getFullYear() + "-";
		printToday += ('0' + (today.getMonth() + 1)).slice(-2) + "-";
		printToday += ('0' + today.getDate()).slice(-2) + " ";
		
		var hours = ('0' + today.getHours()).slice(-2); 
		var minutes = ('0' + today.getMinutes()).slice(-2);
		var seconds = ('0' + today.getSeconds()).slice(-2); 
		
		printToday += hours + ':' + minutes  + ':' + seconds;
		
		return printToday;
	}
});
</script>
</body>
</html>
