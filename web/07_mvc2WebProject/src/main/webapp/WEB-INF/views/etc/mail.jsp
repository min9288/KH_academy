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
			<h3>1. EMAIL 보내기</h3>
			<form action="/sendMail1" method="post">
				<input type="text" name="email" class="short form-control" placeholder="email 주소입력">
				<br><br>
				<input type="text" name="emailTitle" class="short form-control" placeholder="제목">
				<br><br>
				<textarea class="form-control" name="emailContent"></textarea>
				<button class="btn btn-primary btn-block" type="submit">메일전송</button>
			</form>
			<h3>2. EMAIL 보내기</h3>
			<input type="text" id="email">
			<button class="btn btn-primary" onclick="sendMail()">인증하기</button>
			<!-- ajax로 랜덤코드 6자리 전송 -->
		</div>
	<script>
		$(".sendMail").click(function(){
			var mail = $("#email").val();	// 사용자의 이메일 입력값
			if(mail == ""){
				alert("메일 주소가 입력되지 않았습니다.");
			} else {
				$.ajax({
					type : 'post',
					url : '/CheckMail',
					data : {mail:mail},
					dataType : 'json'
				});
				alert("인증번호가 전송되었습니다.")
				isCertification=ture;	// 추후 인증 여부를 알기위한 값
			}
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>