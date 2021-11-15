<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
	<h1>전체회원조회(AJAX)</h1>
	<hr>
	<button id="btn">전체회원정보 불러오기</button>
	<div id="result"></div>
	<script>
		$("#btn").click(function(){
			$.ajax({
				url : "/ajaxAllMember.do",
				success : function(data){
					$("#result").empty();
					var table = $("<table border='1'>");
					var titleTr = $("<tr>");
					titleTr.append("<th>아이디</th><th>비밀번호</th><th>이름</th><th>주소</th><th>가입일</th>");
					table.append(titleTr);
					for(var i = 0; i < data.length; i++){
						var tr = $("<tr>");
						tr.append("<td>"+data[i].memberId+"</td>");
						tr.append("<td>"+data[i].memberPw+"</td>");
						tr.append("<td>"+data[i].memberName+"</td>");
						tr.append("<td>"+data[i].address+"</td>");
						tr.append("<td>"+data[i].enrollDate+"</td>");
						table.append(tr);
					}
					$("#result").append(table);
				}
			});
		});
	</script>
</body>
</html>