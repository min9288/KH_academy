<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>join</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <link rel = "stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/join.css">
    <script type="text/javascript" src="/js/bootstrap.bundle.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
        var resultArr = [false, false, false, false, false, false, false, false];
        $(function(){
        	var result;
            $("#idBtn").click(function(){
            	 var idReg = /^[a-z][a-zA-Z0-9]{5,11}$/;
                 var idValue = $("#inputId").val();
                 if(idReg.test(idValue)){
                	 $.ajax({
                 		url : "/checkId",
                 		type : "post",
                 		data : {memberId : $("#inputId").val()},
                 		success : function(data){
                 			result = data;
                 			if(result){
                                $("#idChk").html("사용가능한 아이디 입니다.");
                                $("#idChk").css("color", "blue");
                                resultArr[0] = true;
                                result="";
                 			} else {
                                $("#idChk").html("이미 사용중인 아이디 입니다.");
                                $("#idChk").css("color", "red");
                                resultArr[0] = false;
                                result="";
                 			}
                     	}
                	 });
                }else {
                    $("#idChk").text("아이디는 영어 소문자로 시작하고 대문자, 소문자, 숫자로 8 ~ 12 글자입니다.");
                    $("#idChk").css("color", "red");
                    resultArr[0] = false;
                    result="";
                }
            });
            var pwValue;
            $("#inputPw").change(function(){
                // 2. 비밀번호 조건 영어 대/소문자 + 숫자 8 ~ 16
                // 숫자, 영어, 특수문자 각 1개 이상 이면서 8 ~ 16글자
                var pwReg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
                pwValue = $("#inputPw").val();
                if(pwReg.test(pwValue)){
                    $("#pwChk").text("사용 가능한 비밀번호 입니다.");
                    $("#pwChk").css("color", "blue");
                    resultArr[1] = true;
                }else {
                    $("#pwChk").text("비밀번호는 숫자, 영어, 특수문자 각 1개 이상 이면서 8 ~ 16글자입니다.");
                    $("#pwChk").css("color", "red");
                    resultArr[1] = false;
                }
            });

            $("input[name=pwRe]").change(function(){
                // 3. 비밀번호 확인 -> 비밀번호와 일치하는지 확인
                var pwReValue = $("input[name=pwRe]").val();
                if(resultArr[1] = true){
                    if(pwValue == pwReValue && pwReValue != null && pwValue != null){
                        $("#pwChk").html("비밀번호가 일치합니다.");
                        $("#pwChk").css("color", "blue");
                        resultArr[2] = true;
                    }else {
                        $("#pwChk").html("비밀번호가 일치하지 않습니다.");
                        $("#pwChk").css("color", "red");
                        resultArr[2] = false;
                    }
                }
            });
            
            $("#phoneBtn").click(function(){
            	var phoneReg = /^(010)-([0-9]{4})-([0-9]{4})$/;
                var phoneValue = $("#phoneVal").val();
                if(phoneReg.test(phoneValue)){
                	$.ajax({
                		url : "/checkPhone",
                		type : "post",
                		data : {phone : $("#phoneVal").val()},
                		success : function(data){
                			result = data;
                			if(result){
                            	$("#phoneChk").text("사용가능한 전화번호입니다.");
                                $("#phoneChk").css("color", "blue");
                                resultArr[3] = true;
                                result="";
                            } else {
                                $("#phoneChk").html("이미 사용중인 전화번호입니다.");
                                $("#phoneChk").css("color", "red");
                                resultArr[3] = false;
                                result="";
                			}
                    	}
                	});
               }else {
                   $("#phoneChk").text("010-0000-0000 양식을 맞춰주세요");
                   $("#phoneChk").css("color", "red");
                   resultArr[3] = false;
                   result="";
               }
            });

            $("#emailBtn").click(function(){
            	var emailReg = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;
                var emailValue = $("#email").val();
                if(emailReg.test(emailValue)){
                	$.ajax({
                		url : "/checkEmail",
                		type : "post",
                		data : {email : $("#email").val()},
                		success : function(data){
                			result = data;
                			if(result){
                                $("#emailChk").html("사용가능한 이메일계정 입니다.");
                                $("#emailChk").css("color", "blue");
                                 resultArr[4] = true;
                                 result="";
                             } else {
                                 $("#emailChk").html("이미 사용중인 이메일계정 입니다.");
                                 $("#emailChk").css("color", "red");
                                 resultArr[4] = false;
                                 result="";
                             }
                		}
                	});
                }else {
                    $("#emailChk").text("정확한 이메일 계정을 입력해주세요");
                    $("#emailChk").css("color", "red");
                    resultArr[4] = false;
                    result="";
                }
            });
            
            $("#birth").change(function(){
                var birthReg = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
                var birthValue = $("#birth").val();
                if(birthReg.test(birthValue)){
                    $("#birthChk").text("정상입니다.");
                    $("#birthChk").css("color", "blue");
                    resultArr[5] = true;
                }else {
                    $("#birthChk").text("생년월일은 8자리로 기입해주시기 바랍니다.(YYYYMMDD)");
                    $("#birthChk").css("color", "red");
                    resultArr[5] = false;
                }
            });
            
            $("input[name=memberLname]").change(function(){
                var eNameReg = /^[A-Z]*$/;
                var eNameLValue = $("input[name=memberLname]").val();
                var eNameFValue = $("input[name=memberFname]").val();
                if((eNameReg.test(eNameLValue)) && (eNameReg.test(eNameFValue)) && eNameLValue != null && eNameFValue != null ){
                    $("#eNameChk").text("기입 완료되었습니다.");
                    $("#eNameChk").css("color", "blue");
                    resultArr[6] = true;
                }else {
                    $("#eNameChk").text("영문 대문자로만 기입 가능합니다.");
                    $("#eNameChk").css("color", "red");
                    resultArr[6] = false;
                }
            });
            
            $("#memberKname").change(function(){
                var kNameReg = /^[가-힣]{2,5}$/;
                var kNameValue = $("#memberKname").val();
                if(kNameReg.test(kNameValue)){
                    $("#kNameChk").text("기입 완료되었습니다");
                    $("#kNameChk").css("color", "blue");
                    resultArr[6] = true;
                }else {
                    $("#kNameChk").text("한글정자로만 기입 가능합니다 (ㅎㄴㄷ -> X | 홍길동 -> O)");
                    $("#kNameChk").css("color", "red");
                    resultArr[6] = false;
                }
            });
        });
        
        function checkValue(){
            // 위에서 검사가 정상적으로 수행되었는지 체크
            // resultArr 0 ~ 3 인덱스에 모두 true 있는지 체크하면

            if(!(resultArr[0] && resultArr[1] && resultArr[2] && resultArr[3] && resultArr[4] && resultArr[5] && resultArr[6])){
                 alert("입력값을 확인하세요!");
                 return false;
             }
            
            for(var i = 0; i < span.length; i++){
                // console.log(span.eq(i).css("color"));
                if(span.eq(i).html() == ""){
                    alert("기입하지 않은 정보가 있습니다, 다시 확인해주세요.");
                    return false;
                   
                }
            }
        }
    </script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <div class="main">
            <div class="joinBox" id="joinBox">
                <div class="headT">
                    <h1 class="m_t">회원가입</h1>
                </div>
                <form action="/join" method="post" name="joinFrm" onsubmit="return checkValue();">
                    <div class="subBox">
                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">아이디</label>
                        <br>
                        <span id="idChk">영어 대/소문자 + 숫자 8~12글자 단, 영어 소문자로 시작</span>
                        <div class="d-flex">
                            <input class="form-control form-control-lg" id="inputId" name="memberId" type="text" placeholder="사용할 아이디를 입력하세요">
                            <button class="btn btn-secondary my-3 my-sm-0" id="idBtn" type="button">중복확인</button>
                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="subBox">
                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">비밀번호</label>
                        <br>
                        <span id="pwChk">숫자, 영어, 특수문자 각 1개 이상 이면서 8 ~ 16글자</span>
                        <div class="d-flex">
                            <input class="form-control form-control-lg" id="inputPw" name="memberPw" type="password" placeholder="사용할 비밀번호를 입력하세요">
                            <input class="form-control form-control-lg" id="flexInputBox" name="pwRe" type="password" placeholder="한번 더 같은 비밀번호를 입력하세요">
                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="subBox">
                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">이메일</label>
                        <br>
                        <span id="emailChk"></span>
                        <div class="d-flex">
                            <input class="form-control form-control-lg" id="email" name="email" type="text" placeholder="사용할 이메일을 입력하세요">
                            <button class="btn btn-secondary my-3 my-sm-0" id="emailBtn" type="button">중복확인</button>
                            <button class="btn btn-secondary my-3 my-sm-0" onclick="sendMail()" type="button">인증번호 요청</button>
                        </div>
                        <div class="d-flex" id="twoLine">
                            <input class="form-control form-control-lg" id="authCode" type="text" placeholder="인증번호를 입력하세요">
                            <button class="btn btn-secondary my-3 my-sm-0" id="authBtn" type="button">인증번호 확인</button>
                        </div>
                        <div id="auth">
                        	<span id="timeZone"></span>
							<span id="authMsg"></span>
                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="subBox">
                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">영문이름</label>
                        <br>
                        <span id="eNameChk">영문 대문자로만 입력해주세요</span>
                        <div class="d-flex">
                            <input class="form-control form-control-lg" name="memberLname" type="text" placeholder="영문 성을 입력하세요">
                            <input class="form-control form-control-lg" id="flexInputBox" name="memberFname" type="text" placeholder="영문 이름을 입력하세요">
                        </div>
                    </div>
                    <div class="writeNotice">
                        <div class="card border-light mb-3" style="max-width: 20rem;" id="nameNotice">
                            <div class="card-header"><h2>*여권 이름을 입력하세요</h2></div>
                            <div class="card-body">
                                <h4 class="card-title">영문 이름은 반드시 여권 이름을 입력 바랍니다. <br> 띄어쓰기도 문자로 인식됩니다.</h4>
                            </div>
                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="subBox">
                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">한글 이름</label>
                        <br>
                        <span id="kNameChk">한글로만 입력해주세요</span>
                        <div class="d-flex">
                            <input class="form-control form-control-lg" name="memberKname" id="memberKname" type="text" placeholder="성명(한글)">
                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="subBox">
                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">생년월일</label>
                        <br>
                        <span id="birthChk"></span>
                        <div class="d-flex">
                            <input class="form-control form-control-lg" id="birth" name="birth" type="text" placeholder="YYYYMMDD">
                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="subBox">
                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">전화번호</label>
                        <br>
                        <span id="phoneChk"></span>
                        <div class="d-flex">
                            <input class="form-control form-control-lg" id="phoneVal" name="phone" type="text" placeholder="010-0000-0000">
                            <button class="btn btn-secondary my-3 my-sm-0" id="phoneBtn" type="button">중복확인</button>
                        </div>
                    </div>
                    <div class="line"></div>
                    <div>
                          <button type="submit" class="btn btn-secondary btn-lg" id="lastBtn" onclick="return checkValue();">제출</button>
                     </div>
                </form>
            </div>
        </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
    var mailCode;
	function sendMail(){
		var email = $("#email").val();
		$.ajax({
			type : 'post',
			url : '/sendMail',
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
</body>
</html>