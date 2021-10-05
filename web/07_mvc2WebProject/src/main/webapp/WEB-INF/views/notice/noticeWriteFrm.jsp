<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container">
		<!-- 파일을 전송하는 form은 method="post" enctype="multipart/form-data" 고정속성 -->
		<form action="/noticeWrite" method="post" enctype="multipart/form-data">
			<fieldset>
				<legend>공지사항 작성</legend>
				<table class="table" style="width:100%;">
					<tr class="table-active">
						<th>제목</th>
						<td colspan="3">
							<input type="text" name="noticeTitle" class="form-control">
						</td>
					</tr>
					<tr class="table-active">
						<th>작성자</th>
						<td>
							<%=m.getMemberId() %>
							<input type="hidden" name="noticeWriter" value="<%=m.getMemberId() %>">
						</td>
						<th>첨부파일</th>
						<td style="text-align:left;">
							<input type="file" name="upfile">
						</td>
					</tr>
					<tr class="table-active">
						<th>내용</th>
						<td colspan="3">
							<textarea name="noticeContent" class="form-control"></textarea>
						</td>
					</tr>
					<tr class="table-active">
						<th>내용</th>
						<td colspan="4">
							<button type="submit" class="btn btn-danger btn-block">공지사항 등록</button>
						</td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>