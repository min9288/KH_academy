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
	<script src="/summernote/jquery-3.3.1.js"></script>
	<script src="/summernote/summernote-lite.js"></script>
	<script src="/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/summernote/summernote-lite.css">
	<div class="container">
		<!-- 파일을 전송하는 form은 method="post" enctype="multipart/form-data" 고정속성 -->
		<form action="/noticeWrite" method="post" enctype="multipart/form-data">
			<fieldset>
				<legend>공지사항 작성(Editor)</legend>
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
						<td colspan="3" style="text-align:left;">
							<textarea id="noticeContent" name="noticeContent" class="form-control"></textarea>
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
	<script>
		$(function(){
			$("#noticeContent").summernote({
				height : 400,
				lang : "ko-KR",
				callbacks:{
					onImageUpload : function(files){
						uploadImage(files[0], this);
					}
				}
			});
		});
		function uploadImage(file, editor){
			// form과 같은효과를 내는 객체생성
			var form = new FormData();
			form.append("file", file);
			$.ajax({
				url : "/uploadImage",
				type : "post",
				data : form,
				processData : false,
				contentType : false,
				success : function(data){
					// 결과로 받은 업로드 경로를 이용해서 에디터에 이미지 추가
					$(editor).summernote("insertImage", data);
					console.log(data);
				}
			});
			// processData : 기본값이 true {key:value1, key2:value2, key3:value3}
			// 				-> 파일전송 시 String이 아닌 파일형태로 전송하기 위해서 기본설정을 제거
			// contentType : 기본값 "application/x-www-form-urlencodeed; charset=UTF=8"
			//				-> 파일전송 시 enctype="multipart/form-data" 로 변환하기위해 기본값 제거
		}
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>