<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">
<title>Find ID/PW</title>
    <style>
      #loginlogo{
        width: 170px;
        height: 40px;
      }
      #login-l{
        text-align: center;
      }
      #loginForm{
        background-color: #ffff;
        border-radius: 10px;
        width: 450px;
        margin: 40px auto;
        padding: 40px 70px 40px 70px;
        border : 2px solid rgb(78, 205, 196);
      }
      #loginForm div{
          padding: 10px;
      }
      #finding{
          width: 50%;
          text-align: center;
      }
      #finding>a{
          color: #5a5a5a;
      }
      #finding .active{
          color: #ffff;
          background-color: rgb(78, 205, 196);
      }
      #idFind{
          margin-top: 40px;
          margin-bottom: 10px;
      }
      #findBtn,#pwBtn{
          width: 100%;
          margin-top: 50px;
      }
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="container">
        <div id="loginForm">
                <div id="login-l">
                    <img src="/resources/img/logo/Develomint_logo.png" id="loginlogo">
                </div>
                <ul class="nav nav-tabs">
                    <li class="nav-item" id="finding">
                      <a class="nav-link active" data-bs-toggle="tab" href="#ids">아이디찾기</a>
                    </li>
                    <li class="nav-item" id="finding">
                      <a class="nav-link" data-bs-toggle="tab" href="#pws">비밀번호찾기</a>
                    </li>
                </ul>
                  <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade active show" id="ids">
                        <strong>이메일로 찾기</strong><img src="/resources/img/member/email.png" style="width: 32px; height: 32px; margin-left: 10px;">
                        <div class="form-group">
                            <fieldset>
                                <div class="form-floating mb-3">
                                    <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com">
                                    <label for="email" style="color: rgb(78, 205, 196); font-size: 14px;">이메일을 입력하세요</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="email" class="form-control" id="emailRe" name="emailRe" placeholder="name@example.com">
                                    <label for="emailRe" style="color: rgb(78, 205, 196); font-size: 14px;">이메일을 다시 입력하세요</label>
                                </div>
                            </fieldset>
                            <button type="button" class="btn btn-primary" id="findBtn">아이디 찾기</button>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="pws">
                        <strong>비밀번호 찾기</strong><img src="/resources/img/member/unlock.png" style="width: 32px; height: 32px; margin-left: 10px;">
                        <div class="form-group">
                            <fieldset> 
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="memberId" name="memberId" placeholder="아이디를 입력하세요">
                                    <label for="memberId" style="color: rgb(78, 205, 196); font-size: 14px;">아이디를 입력하세요</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="email" class="form-control" id="email2" name="email2" placeholder="name@example.com">
                                    <label for="email2" style="color: rgb(78, 205, 196); font-size: 14px;">이메일을 입력하세요</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="phone" name="phone" placeholder="name@example.com">
                                    <label for="phone" style="color: rgb(78, 205, 196); font-size: 14px;">전화번호를 입력하세요</label>
                                </div>
                            </fieldset>
                            <button type="button" class="btn btn-primary" id="pwBtn">비밀번호 찾기</button>
                        </div>
                    </div>
                  </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
        $(function(){
            $("#findBtn").on("click",function(){
                var emailVal = $("#email").val();
                var emailRe = $("#emailRe").val();
                
                if(emailVal == emailRe){
                    $.ajax({
                        url : "/idFind.do",
                        data : {email : emailVal},
                        type : "post",
                        success : function(data){
                            if(data != null){
                                swal({
                                    title: "가입하신 아이디 정보",
                                    text: "< "+data+" > 입니다.",
                                    icon: "success", //"info,success,warning,error" 중 택1
                                    button: "돌아가기",
                                    })
                            }else{
                                swal({
                                    title: "조회하신 이메일 정보가 없습니다",
                                    text: "입력값을  다시 확인해주세요.",
                                    icon: "warning", //"info,success,warning,error" 중 택1
                                    button: "돌아가기",
                                    })
                                	return false;                                
                            }
                        }                
                    })
                }
            });
			$("#pwBtn").on("click",function(){
                var emailVal = $("#email2").val();
                var memberId = $("#memberId").val();
                var phone = $("#phone").val();
                
                $.ajax({
                	url : "/findPw.do",
                	data : {email : emailVal , memberId : memberId , phone:phone},
                	type : "post",
                	success : function(data){
                		if(data == 1){
                            swal({
                                title: "입력하신 정보가 일치하지 않습니다.",
                                text: "다시 확인해주세요",
                                icon: "error", //"info,success,warning,error" 중 택1
                                button: "돌아가기",
                                })
                		}else{
                			//넘어온 값이 임시 비밀번호
                            swal({
                                title: "임시비밀번호가 입력하신 메일로 발송 되었습니다.",
                                text: "임시비밀번호는 "+data+" 입니다",
                                icon: "success", //"info,success,warning,error" 중 택1
                                button: "돌아가기",
                                })                			
                		}
                	}
                })
			});
        });
    </script>
</body>
</html>