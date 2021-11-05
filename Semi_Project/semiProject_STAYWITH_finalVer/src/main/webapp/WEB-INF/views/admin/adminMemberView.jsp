<%@page import="admin.model.vo.Admin_Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Admin_Member admin_m = (Admin_Member)request.getAttribute("m");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 상세페이지</title>
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
				<div class = "admin_Title_text">회원 정보 상세</div> 
				<div class = "admin_Title_Line"></div>				
			</div>
		<table class = "table-hover table-bordered admin_QView_Table" style = "width:100%;">
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">회원 번호</th>
				<td class = "col-md-9 q_table_content" id = "Member_No"><%=admin_m.getMember_No() %></td>
			</tr>		
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">회원 아이디</th>
				<td class = "col-md-9 q_table_content" id = "Member_Id">
					<%=admin_m.getMember_Id() %>
				</td>
			</tr>
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">회원 비밀번호</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "text" id = "Member_Pw" value = "<%=admin_m.getMember_Pw() %>">	
				</td>
			</tr>
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">회원 한글 이름</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "text" id = "Member_Kname" value = "<%=admin_m.getMember_Kname() %>">	
				</td>
			</tr>
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">회원 영문이름(L)</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "text" id = "Member_Lname" value = "<%=admin_m.getMember_Lname() %>">	
				</td>
			</tr>
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">회원 영문이름(F)</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "text" id = "Member_Fname" value = "<%=admin_m.getMember_Fname() %>">	
				</td>
			</tr>
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">회원 등급</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "hidden" id = "Member_Level_Save" value = "<%=admin_m.getMember_Level() %>">
					<select id = "Member_Level" name = "pay_Status">
						<option value = "1">1. 관리자</option>
						<option value = "2">2. 브라운</option>
						<option value = "3">3. 실버</option>
						<option value = "4">4. 골드</option>
						<option value = "5">5. 다이아</option>
					</select>				
				</td>
			</tr>
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">회원 전화번호</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "text" id = "Member_Phone" value = "<%=admin_m.getPhone() %>">	
				</td>
			</tr>
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">회원 생일정보</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "text" id = "Member_Brith" value = "<%=admin_m.getBirth() %>">	
				</td>
			</tr>
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">회원 포인트</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
					<input type = "text" id = "Member_Point" value = "<%=admin_m.getPoint() %>">	
				</td>
			</tr>
			<tr class = "table-primary">
				<th class = "col-md-3 q_table_00">회원 가입일</th>
				<td class = "col-md-9 q_table_content" id = "q_no">
						<%=admin_m.getEnroll_Date() %>
				</td>
			</tr>
		</table>
	<div class = "admin_submit_btn">
		<button type="submit" class="btn btn-secondary" id = "submitButton"> < 정보 수정 > </button>	
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
	
	
	
	var MemberStatus = $('#Member_Level_Save').val();
	$("#Member_Level").val(MemberStatus);
	
	$("#submitButton").click(function()
	{		
		var Member_No = $('#Member_No').html();	
		
		var Member_Pw = $('#Member_Pw').val();
		var Member_Kname = $('#Member_Kname').val();
		var Member_Lname = $('#Member_Lname').val();
		var Member_Fname = $('#Member_Fname').val();
		var Member_Level = $('#Member_Level').val();
		
		var Member_Phone = $('#Member_Phone').val();
		var Member_Brith = $('#Member_Brith').val();
		var Member_Point = $('#Member_Point').val();
		
		console.log("No : " + Member_No);
		console.log("level :" + Member_Level);
		
		$.ajax({
			url 	: 	"/adminUpdate_Member", 	//서블릿을 요청할지 매핑값
			type	: 	"post",				// method 설정
			data 	:	
			{	Member_No:Member_No,
				Member_Pw:Member_Pw,
				Member_Kname:Member_Kname,
				Member_Lname:Member_Lname,
				Member_Fname:Member_Fname,
				Member_Level:Member_Level,
				Member_Phone:Member_Phone,
				Member_Brith:Member_Brith,
				Member_Point:Member_Point				
			},
			success	: function(data)		// 성공시와 에러시, 그리고 완료시
			{
				if(data == 1)
					alert("변경 성공");
				else
					alert("변경 실패")
							
				console.log("success update MemberInfo");
				location.replace("/adminMemberList?reqPage=1&dataType=List&data=''");
			},
			error	: function()
			{
				console.log("Update MemberInfo Fail");
			}				
		});				
	});	
});
</script>
</body>
</html>