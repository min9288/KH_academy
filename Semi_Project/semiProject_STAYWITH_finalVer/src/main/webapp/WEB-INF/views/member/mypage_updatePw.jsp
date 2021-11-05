<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update password</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <link rel = "stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/default.css">
    <link rel="stylesheet" href="css/mypage_updatePw.css">
    <link rel="stylesheet" href="css/header&footer.css">
    <script type="text/javascript" src="/js/bootstrap.bundle.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script>
       
        $(function(){
            var resultArr = [false, false, false];
            var pwValue;
            $("#inputPw").change(function(){
                var pwReg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
                pwValue = $("#inputPw").val();
                if(pwReg.test(pwValue)){
                    $("#pwChk").text("사용 가능한 비밀번호 입니다.");
                    $("#pwChk").css("color", "blue");
                    resultArr[0] = true;
                }else {
                    $("#pwChk").text("비밀번호는 숫자, 영어, 특수문자 각 1개 이상 이면서 8 ~ 16글자입니다.");
                    $("#pwChk").css("color", "red");
                    resultArr[0] = false;
                }
            });

            $("input[name=pwRe]").change(function(){
                var pwReValue = $("input[name=pwRe]").val();
                if(resultArr[0]){
                    if(pwValue == pwReValue && (pwReValue != "") && (pwValue != "")){
                        $("#pwChk").html("비밀번호가 일치합니다.");
                        $("#pwChk").css("color", "blue");
                        resultArr[1] = true;
                    }else {
                        $("#pwChk").html("비밀번호가 일치하지 않습니다.");
                        $("#pwChk").css("color", "red");
                        resultArr[1] = false;
                    }
                }
            });
            
            $("#RPw").change(function(){
                var pwValue = $("#RPw").val();
                if(resultArr[1] = true){
                    if(pwValue == "${m.memberPw}" && (pwValue != "")){
                        $("#checkPw").html("비밀번호가 일치합니다.");
                        $("#checkPw").css("color", "blue");
                        resultArr[2] = true;
                    }else {
                        $("#checkPw").html("비밀번호가 일치하지 않습니다.");
                        $("#checkPw").css("color", "red");
                        resultArr[2] = false;
                    }
                }
            });
        });
        function checkValue(){
            // 위에서 검사가 정상적으로 수행되었는지 체크
            // resultArr 0 ~ 3 인덱스에 모두 true 있는지 체크하면

            if(!(resultArr[0] && resultArr[1] && resultArr[2])){
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
            <div class="m_loginBox" id="m_loginContent">
                <div class="m_headT">
                    <h1 class="m_t">비밀번호 변경</h1>
                </div>
                <form action="/updatePw" method="post" name="updatePw" onsubmit="return checkValue();">
                <input style="display:none" name="memberId" value="${m.memberId }">
	                <div class="subBox">
	                    <label class="col-form-label col-form-label-lg mt-4" style="font-weight: 800;">현재 비밀번호 입력</label>
	                    <br>
	                    <span id="checkPw"></span>
	                    <div class="form-group">
	                        <fieldset>
	                            <input class="form-control" id="RPw" type="password"  placeholder="현재 비밀번호를 입력하세요" style="width:800px;">
	                        </fieldset>
	                    </div>
	                </div>
                    <div class="subBox">
                        <label class="col-form-label col-form-label-lg mt-4" style="font-weight: 800;">새로운 비밀번호 입력</label>
                        <br>
                        <span id="pwChk">숫자, 영어, 특수문자 각 1개 이상 이면서 8 ~ 16글자</span>
                        <div class="d-flex">
                            <input type="password" class="form-control" id="inputPw" placeholder="비밀번호를 입력하세요" style="width: 400px; ">
                            <input type="password" class="form-control" name="pwRe" placeholder="한번 더 같은 비밀번호를 입력하세요" style="width: 400px; margin-left: 10px;">
                        </div>
                    </div>
                    <div class="line"></div>
                    <div id="btnArea">  
                        <button type="submit" class="btn btn-secondary" id="mbtn">확인</button>
                    </div>
                </form>
            </div>
            
        </div>
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>