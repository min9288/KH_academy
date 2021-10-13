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
			<button class="btn btn-primary" onclick="sendMail()">인증메일전송</button>
			<!-- ajax로 랜덤코드 6자리 전송 -->
			<div id="auth">
				<input type="text" id="authCode" class="short form-control" placeholder="인증코드 입력">
				<button class="btn btn-primary" id="authBtn">인증하기</button>
				<span id="timeZone"></span>
				<span id="authMsg"></span>
			</div>
		</div>
	<script>
		var mailCode;
		function sendMail(){
			var email = $("#email").val();
			$.ajax({
				type : 'post',
				url : '/sendMail2',
				data : {email:email},
				success : function(data){
					mailCode = data;
					$("#auth").slideDown();
					authTime();
				}
			});
		}
		var intervalId;
		function authTime(){
			$("#timeZone").html("<span id='min'>3</span> : <span id='sec'>00</span>");
			intervalId = window.setInterval(function(){
				timeCount();
			},1000);
		}
		function timeCount(){
			var min = Number($("#min").html());
			var sec = $("#sec").html();
			if(sec == "00"){
				if(min == 0){
					mailCode = null;
					clearInterval(intervalId);
				} else {
					$("#min").html(--min);
					$("#sec").html(59);
				}
			} else {
				var newSec = Number(sec);
				newSec--;
				if(newSec < 10){
					$("#sec").html("0"+newSec);
				}else {
					$("#sec").html(newSec);
				}
			}
		}
		$("#authBtn").click(function(){
			if (mailCode == null){
				$("#authMsg").html("인증시간 만료");
				$("#authMsg").css("color", "red");
			} else {
				console.log(mailCode);
				if($("#authCode").val() == mailCode){
					$("#authMsg").html("인증성공");
					$("#authMsg").css("color", "blue");
					clearInterval(intervalId);
					$("#timeZone").empty();
				} else {
					$("#authMsg").html("인증코드를 확인하세요");
					$("#authMsg").css("color", "red");
				}
			}
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>