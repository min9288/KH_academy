<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/member/login.css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">
<title>Login</title>
<style>
	.kakaoBtn img{
		height: 60px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="container">
        <h1 style="font-weight: bold; text-align: center; color:rgb(78, 205, 196);">로그인</h1><br>
        <form action="/login.do" method="post" id="loginForm">
            <fieldset>
                <div id="login-l">
                    <img src="resources/img/logo/Develomint_logo.png" id="loginlogo">
                </div>
                <div class="form-group">
                    <label for="memberId" class="form-label mt-4">아이디</label>
                    <input type="text" class="form-control " name="memberId" id="memberId" placeholder="아이디를 입력하세요.">
                </div>
                <div class="form-group" style="padding-top: 0;">
                    <label for="memberPw" class="form-label mt-4">비밀번호</label>
                    <input type="password" class="form-control " name="memberPw" id="memberPw" placeholder="비밀번호를 입력하세요.">
                </div>
                <div class="loginBt">
                    <button type="submit" class="btn btn-primary">로그인</button>
                </div>
                <div class="loginBt">
                    <a class="btn btn-info" href="/joinFrm.do">회원가입</a>   
                </div>
                <div class="loginBt kakaoBtn">
			        <a id="kakao-login-btn">
			        </a>
                </div>
                <div>
                    <a href="/findId.do">아이디찾기/비밀번호찾기</a>
                </div>
            </fieldset>
        </form>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script type="text/javascript">
		//카카오톡 로그인 버튼
		$(function(){
			Kakao.init('1672daed0bcbc8c8ebbff80ce544272f');
			console.log(Kakao.isInitialized());
			 Kakao.Auth.createLoginButton({
			   container: '#kakao-login-btn',
			   success: function(authObj) {
			     Kakao.API.request({
			       url: '/v2/user/me',
			       success: function(res) {
			             console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
			           		$.ajax({
			           			url : "/kakao.do",
			           			data : {memberId : res.id , memberPw : res.id},
			           			type : "post",
			           			success : function(data){
			           				if(data == 1){
			           				 	window.location = "/main.do";
			           				}else{
			           					swal({
			           				        title: "카카오로 가입된 계정이 없습니다.",
			           				        text: "회원가입을 먼저 진행해 주세요!",
			           				        icon: "warning",
			           				        button: "회원가입"
			           				      }).then(function(){
			           				    	 window.location = "/kakaoJoinFrm.do?memberId="+res.id+"&memberPw="+res.id; 
			           				      });
			           				}
			           			}
			           		});
			           }
			         })
			       },
			       fail: function(error) {
			         alert(JSON.stringify(error));
			       }
			     });						
		});
	</script>
</body>
</html>