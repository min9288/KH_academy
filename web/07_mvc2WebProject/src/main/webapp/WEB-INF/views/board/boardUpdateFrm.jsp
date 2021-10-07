<%@page import="board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Board b = (Board)request.getAttribute("b");
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
		<form action="/boardUpdate" method="post" enctype="multipart/form-data">
			<fieldset>
				<legend>게시판 수정</legend>
				<table class="table" style="width:100%;">
					<tr class="table-active">
						<th>제목</th>
						<td colspan="3">
							<input type="text" name="boardTitle" class="form-control" value="<%=b.getBoardTitle()%>">
						</td>
					</tr>
					<tr class="table-active">
						<th>작성자</th>
						<td>
							<%=b.getBoardWriter()%>
						</td>
						<th>첨부파일</th>
						<td style="text-align:left;">
							<input type="hidden" name="status" value="1">
							<%if(b.getFilename() != null) {%>
								<!-- <input type="file"> 에는 value를 설정할 수 없음 -->
								<img src="/img/file.png" width="16px" class="delFile">
								<span class="delFile"><%=b.getFilename() %></span>
								<button type="button" id="delBtn" class="btn btn-primary btn-sm delFile">삭제</button>
								<input type="file" name="upfile" style="display:none;">
								<input type="hidden" name="oldFilename" value="<%=b.getFilename()%>">
								<input type="hidden" name="oldFilepath" value="<%=b.getFilepath()%>">
							<%} else { %>
								<input type="file" name="upfile">
							<%} %>
						</td>
					</tr>
					<tr class="table-active">
						<th>내용</th>
						<td colspan="3">
							<textarea name="boardContent" class="form-control"><%=b.getBoardContent() %></textarea>
						</td>
					</tr>
					<tr class="table-active">
						<th>내용</th>
						<td colspan="4">
							<button type="submit" class="btn btn-danger btn-block">게시글 등록</button>
						</td>
					</tr>
				</table>
			</fieldset>
			<input type="hidden" name="boardNo" value="<%=b.getBoardNo()%>">
		</form>
	</div>
	<script>
		$("#delBtn").click(function(){
			$(".delFile").hide();
			$(this).next().show();
			$("[name=status]").val(2);
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>