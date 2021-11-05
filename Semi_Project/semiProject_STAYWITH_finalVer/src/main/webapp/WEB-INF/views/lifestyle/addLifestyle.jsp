<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/default.css">
<link rel="stylesheet" href="/css/insert-lifestyle.css">
<link rel="stylesheet" href="/css/bootstrap.css">

</head>
<body>
	
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
	<script src="/summernote/jquery-3.3.1.js"></script>
	<script src="/summernote/summernote-lite.js"></script>
	<script src="/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/summernote/summernote-lite.css">
	<div class="main">
		<form action="/addLifestyle" method="post" enctype="multipart/form-data" >
			<h2>라이프 스타일 추가</h2>
			<table class="insert-table" style="width: 100%">
				<tr class="insert-table-title">
					<th><select name="lfCategory">
							<option value="야외수영장">야외수영장</option>
							<option value="스파">스파</option>
							<option value="피트니스">피트니스</option>
							<option value="산책로">산책로</option>
							<option value="쇼핑">쇼핑</option>
					</select></th>
					<th><input type="text" name="lfTitle" placeholder="이름을 입력하세요."></th>
				</tr>
				<tr>
					<td colspan="2"><textarea id="lfContent" name="lfContent"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="thumbnail">
						<p>썸네일 작성</p>
					   <img style="width: 250px; height: 250px" id="preview-image" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
 					   <input style="display: block;" type="file" id="input-image" name="upfile">
 					   </div>
						<div class="thumbnail"><input type="text" placeholder="썸네일 내용을 입력하세요" name="thumbnail" id="thumbnail"></div>
					</td>
				</tr>
			</table>
			<button type="submit" class="btn btn-light" id="insertBtn">등록하기</button>
		</form>
	</div>
	<script>
	function readImage(input) {
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        const reader = new FileReader()
	        // 이미지가 로드가 된 경우
	        reader.onload = e => {
	            const previewImage = document.getElementById("preview-image")
	            previewImage.src = e.target.result
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0])
	    }
	}
	// input file에 change 이벤트 부여
	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
	    readImage(e.target)
	})

		$(function() {
			$("#lfContent").summernote({
				height : 400,
				lang : "ko-KR",
				callbacks : {
					onImageUpload : function(files) {
						uploadImage(files[0], this);
					}
				}
			});
		});
		function uploadImage(file,editor) {
			//form와 같은효과를 내는 객체생성
			var form = new FormData();
			form.append("file",file);
			$.ajax({
				url : "/uploadImage",
				type : "post",
				data : form,
				processData : false,
				contentType : false,
				success : function (data) {
					//결과로 받은 업로드 경로를 이용해서 에디터에 이미지 추가
					$(editor).summernote("insertImage",data);
				}
			});
		}	
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
