<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.container * {
	text-decoration: none;
}

.note-editable{
	width: 918px;
}
.note-modal-footer{
	height: 60px !important;
}
.container {
	margin-top: 100px;
	margin-bottom: 100px;
	min-width: 1200px;
}

.container .g-plus {
	display: flex;
	justify-content: right;
	color: rgb(78, 205, 196);
	text-align: right;
	font-weight: bold;
}

.container h4 {
	font-weight: bold;
	margin-top: 40px;
	margin-bottom: 40px;
	margin-bottom: 50px;
}

.g-center {
	display: flex;
	justify-content: center;
}

.g-content {
	display: flex;
	justify-content: center;

}

.g-content input, .g-content textarea {
	padding: 10px;
}

.g-content tr th, .g-content tr td {
	padding: 40px;
}
.g-content tr th{
	width: 200px;
}
input:focus, textarea:focus {
	outline: none;
}

.g-content th {
	font-size: 25px;
}


.summerContentTop {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 20px;
}

.note-modal-footer{
	height: 60px !important;
}
.gosu-mail {
	display: flex;
	justify-content: right;
}

.gosu-mail a {
	font-weight: bold;
	font-size: 20px;
}

.gosu-mail span {
	font-weight: bold;
	color: white;
	background-color: red;
	border-radius: 50%;
	text-align: center;
	width: 20px;
	margin-left: 50px;
	display: block;
	font-size: 13px;
}
#g-btn-submit{
	min-width :1200px;
	box-shadow: rgba(0, 0, 0, 0.4) 2PX 2PX 2PX 2PX;
	
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<c:if test="${sessionScope.m.memberType eq 2}">
			<div class="gosu-mail">
				<a href="/gosuRequestList.do?reqPage=1">요청서</a>
			</div>
		</c:if>
		<c:if test="${sessionScope.m.memberType eq 1}">
			<div class="gosu-mail">
				<a href="/gosuRequestCostList.do?reqPage=1">견적서</a>
			</div>
		</c:if>
		<h4>
			&gt; &nbsp;<span style="color: rgb(78, 205, 196);">고수</span>의 게시판
			작성하기
		</h4>
		<form action="/gosuNoticeWrite.do" method="post" id="g-btn-submit"
			enctype="multipart/form-data">
			<input type="hidden" name="writeId"
				value="${sessionScope.m.memberId }">
			<div class="g-content g-center">
				<div>
					<table>
						<tr>
							<th>첨부파일 <span style="color: red;">* </span></th>
							<td><input type="file" name="files" style="width: 100%;"></td>
						</tr>
						<tr>
							<th>제목 <span style="color: red;">* </span></th>
							<td><input type="text" name="gnoticeTitle"
								style="width: 100%;"></td>
						</tr>
						<tr>
							<th>내용 <span style="color: red;"> * </span></th>
							<td><textarea cols="100" rows="30" name="gnoticeContent" id="gnoticeContent"
									placeholder="* 고수님만의 노하우를 작성해주세요!"></textarea></td>
						</tr>

					</table>
				</div>
			</div>
			<div class="g-center">
				<a href="/gosuNoticeList.do" class="btn btn-info"
					style="width: 200px; margin: 50px; padding: 10px; font-weight: bold;">취소</a>
				<button type="submit" class="btn btn-primary"
					style="width: 200px; margin: 50px; padding: 10px; font-weight: bold;">확인</button>
			</div>
		</form>
	</div>
	
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
	$("#gnoticeContent").summernote(
			{
				height : 500,
				minHeight : 500,
				maxHeight : 500,
				lang : "ko-KR",
				toolbar : [
						[ 'fontname', [ 'fontname' ] ],
						[ 'fontsize', [ 'fontsize' ] ],
						[
								'style',
								[ 'bold', 'italic', 'underline',
										'strikethrough', 'clear' ] ],
						[ 'color', [ 'forecolor', 'color' ] ],
						[ 'table', [ 'table' ] ],
						[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
						[ 'height', [ 'height' ] ],
						[ 'insert', [ 'picture', 'link' ] ],
						[ 'view', [ 'fullscreen', 'help' ] ] ],
				fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS',
						'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체',
						'바탕체' ],
				fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18',
						'20', '22', '24', '28', '30', '36', '50', '72' ],
				callbacks : {
					onImageUpload : function(files) {
						uploadImage(files[0], this);
					}
				}
			});

	function uploadImage(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			url : "/gosuSummerImage.do",
			type : "post",
			data : data,
			enctype : 'multipart/form-data',
			processData : false,
			contentType : false,
			success : function(data) {
				$(editor).summernote("insertImage", data);
			}
		});
	}
		$('#g-btn-submit').submit(function() {
			var gnoticeContent = $("input[name=gnoticeContent]").val();
			var gnoticeTitle = $("textarea[name=gnoticeTitle]").val();
			var files = $("input[name=files]").val();
			console.log("gnoticeContent : " + gnoticeContent);
			console.log("gnoticeTitle : " + gnoticeTitle);
			console.log("files : " + files);
			if (gnoticeContent == "" || gnoticeTitle == "") {
				swal({
			        title: '등록실패',
			        text: "입력하신 내용을 다시 확인해주세요!",
			        icon: 'error'
			      });
				return false;
			}
			if (files == "") {
				swal({
			        title: '등록실패',
			        text: "1개의 사진을 첨부하셔야 합니다.",
			        icon: 'error'
			      });
				return false;
			}

		});
	</script>

	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>