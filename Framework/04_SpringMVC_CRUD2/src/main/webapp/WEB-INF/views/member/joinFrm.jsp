<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
	<h1>회원가입</h1>
	<hr>
	<form action="/join.do" method="post">
		<fieldset>
			아이디 : <input type="text" name="memberId"><span id="idChk"></span><br>
			비밀번호 : <input type="password" name="memberPw"><br>
			이름 : <input type="text" name="memberName"><br>
			주소 : <input type="text" name="address"><br>
			<input type="submit" value="회원가입">
			<input type="reset" value="취소">
		</fieldset>
	</form>
	<script>
		$("[name=memberId]").keyup(function(){
			var memberId = $(this).val();
			$.ajax({
				url : "/idCheck.do",
				data : {memberId : memberId},
				success : function(data){
					if(data == 1){
						$("#idChk").html("사용 가능한 아이디 입니다.");
						$("#idChk").css("color", "blue");
					} else {
						$("#idChk").html("이미 사용중인 아이디 입니다.");
						$("#idChk").css("color", "red");
					}
				}
			});
		});
	</script>
</body>
</html>