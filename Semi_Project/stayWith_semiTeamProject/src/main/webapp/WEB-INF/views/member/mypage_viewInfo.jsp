<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My info</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <link rel = "stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/default.css">
    <link rel="stylesheet" href="css/mypage_viewInfo.css">
    <link rel="stylesheet" href="css/header&footer.css">
    <script type="text/javascript" src="/js/bootstrap.bundle.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>
    <script>
        $(function(){
            $(".s-main-menu li").mouseenter(function(){
                $(".main-content").css("margin-top","50px");
            });
            $(".s-main-menu li").mouseleave(function(){
                $(".main-content").css("margin-top","10px");
            });


            // $(".subnavi li").mouseenter(function(){
            //     $(this).css("backgroundColor", "#d6c6a5" );
            //     $(this).find("span").css("display", "inline-block");
            // });
            // $(".subnavi li").mouseleave(function(){
            //     $(this).css("backgroundColor", "" );
            //     $(this).find("span").css("display", "none");
            // });

        });
        $(function(){
        	var result;
        	var resultArr = [true, true];
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
                                resultArr[0] = true;
                                result="";
                            } else {
                                $("#phoneChk").html("이미 사용중인 전화번호입니다.");
                                $("#phoneChk").css("color", "red");
                                resultArr[0] = false;
                                result="";
                			}
                    	}
                	});
               }else {
                   $("#phoneChk").text("010-0000-0000 양식을 맞춰주세요");
                   $("#phoneChk").css("color", "red");
                   resultArr[0] = false;
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
                                 resultArr[1] = true;
                                 result="";
                             } else {
                                 $("#emailChk").html("이미 사용중인 이메일계정 입니다.");
                                 $("#emailChk").css("color", "red");
                                 resultArr[1] = false;
                                 result="";
                             }
                		}
                	});
                }else {
                    $("#emailChk").text("정확한 이메일 계정을 입력해주세요");
                    $("#emailChk").css("color", "red");
                    resultArr[1] = false;
                    result="";
                }
            });
            
        });
        
        function checkValue(){
            // 위에서 검사가 정상적으로 수행되었는지 체크
            // resultArr 0 ~ 3 인덱스에 모두 true 있는지 체크하면

            if(!(resultArr[0] && resultArr[1])){
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

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <div class="main">
            <div class="main-left-box">
                <h2>마이페이지</h2>
                <ul>
                    <li>
                        <span>내 정보</span>
                        <ul class="subnavi">
                            <li style="background-color: #d6c6a5;"><a href="/myInfoFrm">내 정보 조회 및 수정<span style="display: inline-block;">&gt;</span></a></li>
                            <li><a href="/myInquiryFrm?email=${m.email }&memberId=${m.memberId }&reqPage=1">문의 내역<span>&gt;</span></a></li>
                            <li><a href="/mypageWithdrawalFrm">탈퇴 요청<span >&gt;</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <span>예약 정보</span>
                        <ul class="subnavi">
                            <li><a href="/mypageBookingRoomFrm?memberId=${m.memberId }&reqPage=1">객실<span>&gt;</span></a></li>
                            <li><a href="/mypageBookingDiningFrm?memberId=${m.memberId }&reqPage=1">다이닝<span>&gt;</span></a></li>
                            <li><a href="/mypageBookingFitnessFrm?memberId=${m.memberId }&reqPage=1">피트니스<span>&gt;</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <span>작성후기 관리</span>
                        <ul class="subnavi">
                            <li><a href="/mypageMyReviewRoomFrm?memberId=${m.memberId }">객실<span>&gt;</span></a></li>
                            <li><a href="/mypageMyReviewDiningFrm?memberId=${m.memberId }">다이닝<span>&gt;</span></a></li>
                            <li><a href="/mypageMyReviewFitnessFrm?memberId=${m.memberId }">피트니스<span>&gt;</span></a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="main-content">
            <form action="/updateMyInfo" method="post" name="updateMyInfoFrm" onsubmit="return checkValue();">
	                <div class="infoBox" id="infoBox">
	                    <div class="headT">
	                        <h1 class="m_t">내 정보 조회 및 수정</h1>
	                    </div>
	                    <div class="subBox">
	                        <div class="d-flex" id="topBox">
	                            <div id="leftMainText">
	                                <a id="mId">${m.memberId}</a><a class="others">님은</a>
	                                <br>
	                                <a id="mlevel" style="width:200px">${m.gradeName}</a><a class="others">회원입니다.</a>
	                            </div>
	                            <div id="pointView">
	                                <div id="textar">
	                                    <a id="pointText">포인트</a> <strong id="realPoint">${m.point} P</strong>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="line"></div>
	                    <div class="subBox">
	                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">아이디</label>
	                        <div class="form-group">
	                            <fieldset>
	                                <input class="form-control" id="readOnlyInput" type="text" name="memberId" readonly style="width:400px;" value="${sessionScope.m.memberId}">
	                            </fieldset>
	                        </div>
	                    </div>
	                    <div class="line"></div>
	                    <div class="subBox">
	                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">비밀번호</label>
	                        <br><br>
	                        <a href="/updatePwFrm?memberNo=${sessionScope.m.memberNo}">
	                        	<button type="button" class="btn btn-secondary" style="margin-left: 50px; width: 150px; height: 50px;">비밀번호 변경</button>
	                        </a>
	                    </div>
	                    <div class="line"></div>
	                    <div class="subBox">
	                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">이메일</label>
	                        <br>
	                        <span id="emailChk"></span>
	                        <div class="d-flex">
	                            <input type="text" class="form-control" style="width: 400px;" value="${sessionScope.m.email}" id="email" name="email">
	                            <button class="btn btn-secondary my-3 my-sm-0" type="button" style="margin-left: 10px;" id="emailBtn">중복확인</button>
	                            <button class="btn btn-secondary my-3 my-sm-0" type="button" style="margin-left: 10px;" onclick="sendMail()">인증번호 요청</button>
	                        </div>
	                        <div class="d-flex" id="twoLine">
	                            <input type="text" class="form-control" style="width: 400px;" id="authCode" placeholder="인증번호를 입력하세요">
	                            <button class="btn btn-secondary my-3 my-sm-0" type="button" style="margin-left: 10px;" id="authBtn">인증번호 확인</button>
	                        </div>
	                        <div id="auth">
	                        	<span id="timeZone"></span>
								<span id="authMsg"></span>
	                        </div>
	                    </div>
	                    <div class="line"></div>
	                    <div class="subBox">
	                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">영문이름</label>
	                        <div class="d-flex">
	                            <input type="text" class="form-control" style="width: 400px;" readonly value="${sessionScope.m.memberLname}">
	                            <input type="text" class="form-control" style="width: 400px;  margin-left: 10px;" readonly value="${sessionScope.m.memberFname}">
	                        </div>
	                    </div>
	                    <div class="line"></div>
	                    <div class="subBox">
	                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">한글이름</label>
	                        <div class="form-group">
	                            <fieldset>
	                                <input class="form-control" id="readOnlyInput" type="text" style="width:400px;" readonly value="${sessionScope.m.memberKname}">
	                            </fieldset>
	                        </div>
	                    </div>
	                    <div class="line"></div>
	                    <div class="subBox">
	                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">생년월일</label>
	                        <div class="form-group">
	                            <fieldset>
	                                <input class="form-control" id="readOnlyInput" type="text" style="width:400px;" readonly value="${sessionScope.m.birth}">
	                            </fieldset>
	                        </div>
	                    </div>
	                    <div class="line"></div>
	                    <div class="subBox">
	                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">연락처</label>
	                        <br>
                        	<span id="phoneChk"></span>
	                        <div class="d-flex" id="twoLine">
	                            <input type="text" class="form-control" style="width: 400px;" value="${sessionScope.m.phone}" name="phone" id="phoneVal">
	                            <button class="btn btn-secondary my-3 my-sm-0" type="button" style="margin-left: 10px;" id="phoneBtn">중복 확인</button>
	                        </div>
	                    </div>
	                    <div class="line"></div>
	                    <div class="btnArea">
	                        <button type="submit" class="btn btn-secondary" onclick="return checkValue();">수정</button>
	                    </div>
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