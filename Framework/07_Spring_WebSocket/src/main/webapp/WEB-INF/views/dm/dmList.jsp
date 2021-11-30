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
	<h1>쪽지함</h1>
	<jsp:include page="/WEB-INF/views/dm/alarm.jsp"/>
	<hr>
	<h2>AJAX로 쪽지보내기</h2>
	<div id="msgWrap">
		받는사람 : <input type="text" id="target"><br>
		보낼메시지 <br>
		<textarea rows="5" cols="25" id="msgContent"></textarea>
		<button id="sendMessage">AJAX로 쪽지보내기</button>
	</div>
	<hr>
	<h2>받은 쪽지함</h2>
	<table border="1">
		<tr>
			<th>번호</th><th>보낸사람</th><th>내용</th><th>날짜</th><th>읽음여부</th>
		</tr>
		<c:forEach items="${list }" var="dm">
			<c:if test="${dm.receiver eq sessionScope.m.memberId }">
				<tr>
					<td>${dm.dmNo }</td>
					<td>${dm.sender }</td>
					<td>${dm.dmContent }</td>
					<td>${dm.dmTime }</td>
					<td>${dm.readStatus }</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	<hr>
	<h2>보낸 쪽지함</h2>
	<table border="1">
		<tr>
			<th>번호</th><th>받는사람</th><th>내용</th><th>날짜</th><th>읽음여부</th>
		</tr>
		<c:forEach items="${list }" var="dm">
			<c:if test="${dm.sender eq sessionScope.m.memberId }">
				<tr>
					<td>${dm.dmNo }</td>
					<td>${dm.receiver }</td>
					<td>${dm.dmContent }</td>
					<td>${dm.dmTime }</td>
					<td>${dm.readStatus }</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	<a href="/">메인으로</a>
	<script>
		$("#sendMessage").click(function(){
			var receiver = $("#target").val();
			$.ajax({
				url : "/ajaxSendMsg.do",
				type : "post",
				data : {target : receiver, msgContent : $("#msgContent").val()},
				success : function(data){
					dmCount(receiver);
					document.location.reload();
				}
			});
		});
	</script>
	
</body>
</html>