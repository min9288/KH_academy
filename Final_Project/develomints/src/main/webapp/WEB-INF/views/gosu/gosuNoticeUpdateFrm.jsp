<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
</head>
<style>
.container * {
	text-decoration: none;
	color: black;
}

.container {
	margin-top: 50px;
	margin-bottom: 50px;
	min-width: 1200px;
}

.summerContentTop {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 20px;
}

.note-modal-footer {
	height: 60px !important;
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
	margin-top: 100px;
	margin-bottom: 100px;
}

.g-content input, .g-content textarea {
	padding: 10px;
}


.note-editable{
	width: 918px;
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

.g-content>div {
	
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


.upbtn {
	box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);
}

.upbtn:hover {
-webkit-transform: scale(1.03);
    transform: scale(1.03);
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		
		<h4>
			&gt; &nbsp;<span style="color: rgb(78, 205, 196);">고수</span>의 게시판
			수정하기
		</h4>
		<form action="/gosuNoticeUpdate.do" method="post" id="g-btn-submit"
			enctype="multipart/form-data">
			<input type="hidden" name="writeId"
				value="${sessionScope.m.memberId }"> <input type="hidden"
				name="gnoticeNo" value="${gNotice.gnoticeNo }">
			<div class="g-content g-center" style="	box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);padding-top:50px;padding-bottom:50px;">
				<div>
					<table>
						<tr>
							<th>첨부파일 <span style="color: red;">* </span></th>
							<td id="g-td1"><img style="width: 800px;"
								src="${gNotice.gnoticePhoto}">
							<button type="button" id="g-photo-del" class="btn btn-primary upbtn"
									style="margin-bottom: 50%;">X</button>
								<span id="photo-empty"><input type="hidden"
									name="gnoticePhoto" value="${gNotice.gnoticePhoto}"></span></td>
							<td id="g-td2" style="display: none;"><input type="file" class="form-control"
								name="files" style="width: 100%;"></td>
						</tr>
						<tr>
							<th>제목 <span style="color: red;">* </span></th>
							<td><input type="text" name="gnoticeTitle"
								value="${gNotice.gnoticeTitle}" style="width: 100%;" class="form-control"></td>
						</tr>
						<tr>
							<th>내용 <span style="color: red;"> * </span></th>
							<td><textarea cols="100" rows="30" name="gnoticeContent" id="gnoticeContent" >${gNotice.gnoticeContent}</textarea></td>
						</tr>

					</table>
				</div>
			</div>
			<div class="g-center">
				<a class="btn btn-info upbtn"
					style="width: 200px; margin: 100px; padding: 10px; font-weight: bold;"
					onclick="history.back();">취소</a>
				<button type="submit" class="btn btn-primary upbtn"
					style="width: 200px; margin: 100px; padding: 10px; font-weight: bold;">확인</button>
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
		$("#g-photo-del").click(function() {
			$("#g-td1").css("display", "none");
			$("#photo-empty").empty();
			$("#g-td2").css("display", "flex");

		});

		$('#g-btn-submit').submit(function() {
			var gnoticeContent = $("input[name=gnoticeContent]").val();
			var gnoticeTitle = $("input[name=gnoticeTitle]").val();
			var files = $("input[name=files]").val();
			var gnoticePhoto = $("input[name=gnoticePhoto]").val();
		
			if (gnoticeContent == "" || gnoticeTitle == "") {
				swal({
					title : '수정실패',
					text : "입력하신 내용을 다시 확인해주세요!",
					icon : 'error'
				});
				return false;
			}
			if (files == "" && gnoticePhoto == null) {
				swal({
					title : '수정실패',
					text : "1개의 사진을 첨부하셔야 합니다.",
					icon : 'error'
				});

				return false;
			}

		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>