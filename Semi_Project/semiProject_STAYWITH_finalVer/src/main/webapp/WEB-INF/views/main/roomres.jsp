<%@page import="main.model.vo.MainRoomRes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
     	MainRoomRes mrr = (MainRoomRes)request.getAttribute("mrr");
    	
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.roomres {
		text-align:center;
	}
	.roomres h2{
	font-size:50px;
	}
	.roomres input{
		width:200px;
		font-size:20px;
		font-weight:bold;
		padding:10px;
		border:none;
	}
</style>
</head>
<body>
	<%@include file ="/WEB-INF/views/common/header.jsp" %>
	<div class="roomres">
	<h2>임시 예약 페이지</h2>
	체크인<input type="text" value="<%=mrr.getCheckin()%>">
	체크아웃<input type="text" value="<%=mrr.getCheckout()%>">
	성인 <input type="text" value="<%=mrr.getAdult()%>">
	소인 <input type="text" value="<%=mrr.getKid()%>">
	</div>
	
	
	<%@include file ="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>