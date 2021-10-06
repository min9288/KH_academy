<%@page import="notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Notice n = (Notice)request.getAttribute("n");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container">
		<fieldset>
			<legend>공지사항</legend>
			<table class="table" id="noticeView" style="width:100%;">
				<tr class = "table-info">
					<th colspan="4"><%=n.getNoticeTitle() %></th>
				</tr>
				<tr class="table-light">
					<th>작성자</th>
					<th><%=n.getNoticeWriter() %></th>
					<th>작성일</th>
					<th><%=n.getRegDate() %></th>
				</tr>
				<tr class="table-light">
					<th>첨부파일</th>
					<th>
						<%if(n.getFilename() != null) {%>
							<img src="/img/file.png" width="16px">
							<a href="/fileDown?noticeNo=<%=n.getNoticeNo()%>"><%=n.getFilename() %></a>
						<%} %>
					</th>
					<th>조회수</th>
					<th><%=n.getReadCount() %></th>
				</tr>
				<tr class="table-light">
					<th>내용</th>
					<th colspan="3">
						<%=n.getNoticeContentBr() %>
					</th>
				</tr>
				<tr class="table-light">
					<th colspan="4" style="text-align:center;">
						<button class="btn btn-info" onclick="history.go(-1);">이전화면</button>
						<%if(m != null && m.getMemberId().equals(n.getNoticeWriter())) {%>
							<a href="#" class="btn btn-info">수정하기</a>
							<a href="#" class="btn btn-info">삭제하기</a>
						<%} %>
					</th>
				</tr>
			</table>
		</fieldset>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>