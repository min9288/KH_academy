<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file = "/WEB-INF/views/common/header.jsp" %>
	<div class="container">
		<fieldset>
			<legend>전체회원정보</legend>
			<table class="table-hover" style="width:100%;">
				<tr class="table-primary">
					<th>선택</th>
					<th>회원번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>가입일</th>
					<th>회원등급</th>
					<th>등급변경</th>
				</tr>
				<%for(Member member : list) {%>
				<tr class = "table-light">
					<td>
						<input type="checkbox" class="chk">
					</td>
					<td><%=member.getMemberNo() %></td>
					<td><%=member.getMemberId() %></td>
					<td><%=member.getMemberName() %></td>
					<td><%=member.getPhone() %></td>
					<td><%=member.getAddress() %></td>
					<td><%=member.getEnrollDate() %></td>
					<td>
						<select class="form-control" style="width:80%; display: inline-block;">
							<%if(member.getMemberLevel() == 1) {%>
								<option value="1" selected>관리자</option>
								<option value="2">정회원</option>
								<option value="3">준회원</option>
							<%}else if(member.getMemberLevel() == 2) {%>
								<option value="1">관리자</option>
								<option value="2" selected>정회원</option>
								<option value="3">준회원</option>
							<%}else if(member.getMemberLevel() == 3) {%>
								<option value="1">관리자</option>
								<option value="2">정회원</option>
								<option value="3" selected>준회원</option>
							<%} %>
						</select>
					</td>
					<td>
						<button class="btn btn-outline-warning btn-sm changeLevel">등급변경</button>
					</td>
				</tr>
				<%} %>
				<tr>
					<th colspan="9">
						<button class="btn btn-warning btn-block chkChangeLevel">선택회원등급변경</button>
					</th>
				</tr>
			</table>
		</fieldset>
	</div>
	<%@include file = "/WEB-INF/views/common/footer.jsp" %>
	<script>
		$(".changeLevel").click(function(){
			var memberLevel = $(this).parent().prev().children().val();
			var memberNo = $(this).parent().parent().children().eq(1).html();
			location.href="/changeLevel?memberNo="+memberNo+"&memberLevel="+memberLevel;
		});
		$(".chkChangeLevel").click(function(){
			var inputs = $(".chk:checked");
			var num = new Array();		// 회원번호 저장할 배열
			var level = new Array();	// 변경할 등급을 저장할 배열
			inputs.each(function(idx, item){
				var memberNo = $(item).parent().next().html();
				num.push(memberNo);
				var memberLevel = $(item).parent().parent().find("select").val();
				level.push(memberLevel);
			});
			console.log(num);
			console.log(level);
			location.href="/chkChangeLevel?num="+num.join("/")+"&level="+level.join("/");
		});
	</script>
</body>
</html>