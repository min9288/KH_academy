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
                            	$("#phoneChk").text("??????????????? ?????????????????????.");
                                $("#phoneChk").css("color", "blue");
                                resultArr[0] = true;
                                result="";
                            } else {
                                $("#phoneChk").html("?????? ???????????? ?????????????????????.");
                                $("#phoneChk").css("color", "red");
                                resultArr[0] = false;
                                result="";
                			}
                    	}
                	});
               }else {
                   $("#phoneChk").text("010-0000-0000 ????????? ???????????????");
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
                                $("#emailChk").html("??????????????? ??????????????? ?????????.");
                                $("#emailChk").css("color", "blue");
                                 resultArr[1] = true;
                                 result="";
                             } else {
                                 $("#emailChk").html("?????? ???????????? ??????????????? ?????????.");
                                 $("#emailChk").css("color", "red");
                                 resultArr[1] = false;
                                 result="";
                             }
                		}
                	});
                }else {
                    $("#emailChk").text("????????? ????????? ????????? ??????????????????");
                    $("#emailChk").css("color", "red");
                    resultArr[1] = false;
                    result="";
                }
            });
            
        });
        
        function checkValue(){
            // ????????? ????????? ??????????????? ?????????????????? ??????
            // resultArr 0 ~ 3 ???????????? ?????? true ????????? ????????????

            if(!(resultArr[0] && resultArr[1])){
                 alert("???????????? ???????????????!");
                 return false;
             }
            
            for(var i = 0; i < span.length; i++){
                // console.log(span.eq(i).css("color"));
                if(span.eq(i).html() == ""){
                    alert("???????????? ?????? ????????? ????????????, ?????? ??????????????????.");
                    return false;
                   
             }
            }
        }
    </script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <div class="main">
            <div class="main-left-box">
                <h2>???????????????</h2>
                <ul>
                    <li>
                        <span>??? ??????</span>
                        <ul class="subnavi">
                            <li style="background-color: #d6c6a5;"><a href="/myInfoFrm">??? ?????? ?????? ??? ??????<span style="display: inline-block;">&gt;</span></a></li>
                            <li><a href="/myInquiryFrm?email=${m.email }&memberId=${m.memberId }&reqPage=1">?????? ??????<span>&gt;</span></a></li>
                            <li><a href="/mypageWithdrawalFrm">?????? ??????<span >&gt;</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <span>?????? ??????</span>
                        <ul class="subnavi">
                            <li><a href="/mypageBookingRoomFrm?memberId=${m.memberId }&reqPage=1">??????<span>&gt;</span></a></li>
                            <li><a href="/mypageBookingDiningFrm?memberId=${m.memberId }&reqPage=1">?????????<span>&gt;</span></a></li>
                            <li><a href="/mypageBookingFitnessFrm?memberId=${m.memberId }&reqPage=1">????????????<span>&gt;</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <span>???????????? ??????</span>
                        <ul class="subnavi">
                            <li><a href="/mypageMyReviewRoomFrm?memberId=${m.memberId }&reqPage=1">??????<span>&gt;</span></a></li>
                            <li><a href="/mypageMyReviewDiningFrm?memberId=${m.memberId }&reqPage=1">?????????<span>&gt;</span></a></li>
                            <li><a href="/mypageMyReviewFitnessFrm?memberId=${m.memberId }&reqPage=1">????????????<span>&gt;</span></a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="main-content">
            <form action="/updateMyInfo" method="post" name="updateMyInfoFrm" onsubmit="return checkValue();">
	                <div class="infoBox" id="infoBox">
	                    <div class="headT">
	                        <h1 class="m_t">??? ?????? ?????? ??? ??????</h1>
	                    </div>
	                    <div class="subBox">
	                        <div class="d-flex" id="topBox">
	                            <div id="leftMainText">
	                                <a id="mId">${m.memberId}</a><a class="others">??????</a>
	                                <br>
	                                <a id="mlevel" style="width:200px">${m.gradeName}</a><a class="others">???????????????.</a>
	                            </div>
	                            <div id="pointView">
	                                <div id="textar">
	                                    <a id="pointText">?????????</a> <strong id="realPoint">${m.point} P</strong>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="line"></div>
	                    <div class="subBox">
	                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">?????????</label>
	                        <div class="form-group">
	                            <fieldset>
	                                <input class="form-control" id="readOnlyInput" type="text" name="memberId" readonly style="width:400px;" value="${sessionScope.m.memberId}">
	                            </fieldset>
	                        </div>
	                    </div>
	                    <div class="line"></div>
	                    <div class="subBox">
	                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">????????????</label>
	                        <br><br>
	                        <a href="/updatePwFrm?memberNo=${sessionScope.m.memberNo}">
	                        	<button type="button" class="btn btn-secondary" style="margin-left: 50px; width: 150px; height: 50px;">???????????? ??????</button>
	                        </a>
	                    </div>
	                    <div class="line"></div>
	                    <div class="subBox">
	                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">?????????</label>
	                        <br>
	                        <span id="emailChk"></span>
	                        <div class="d-flex">
	                            <input type="text" class="form-control" style="width: 400px;" value="${sessionScope.m.email}" id="email" name="email">
	                            <button class="btn btn-secondary my-3 my-sm-0" type="button" style="margin-left: 10px;" id="emailBtn">????????????</button>
	                            <button class="btn btn-secondary my-3 my-sm-0" type="button" style="margin-left: 10px;" onclick="sendMail()">???????????? ??????</button>
	                        </div>
	                        <div class="d-flex" id="twoLine">
	                            <input type="text" class="form-control" style="width: 400px;" id="authCode" placeholder="??????????????? ???????????????">
	                            <button class="btn btn-secondary my-3 my-sm-0" type="button" style="margin-left: 10px;" id="authBtn">???????????? ??????</button>
	                        </div>
	                        <div id="auth">
	                        	<span id="timeZone"></span>
								<span id="authMsg"></span>
	                        </div>
	                    </div>
	                    <div class="line"></div>
	                    <div class="subBox">
	                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">????????????</label>
	                        <div class="d-flex">
	                            <input type="text" class="form-control" style="width: 400px;" readonly value="${sessionScope.m.memberLname}">
	                            <input type="text" class="form-control" style="width: 400px;  margin-left: 10px;" readonly value="${sessionScope.m.memberFname}">
	                        </div>
	                    </div>
	                    <div class="line"></div>
	                    <div class="subBox">
	                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">????????????</label>
	                        <div class="form-group">
	                            <fieldset>
	                                <input class="form-control" id="readOnlyInput" type="text" style="width:400px;" readonly value="${sessionScope.m.memberKname}">
	                            </fieldset>
	                        </div>
	                    </div>
	                    <div class="line"></div>
	                    <div class="subBox">
	                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">????????????</label>
	                        <div class="form-group">
	                            <fieldset>
	                                <input class="form-control" id="readOnlyInput" type="text" style="width:400px;" readonly value="${sessionScope.m.birth}">
	                            </fieldset>
	                        </div>
	                    </div>
	                    <div class="line"></div>
	                    <div class="subBox">
	                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">?????????</label>
	                        <br>
                        	<span id="phoneChk"></span>
	                        <div class="d-flex" id="twoLine">
	                            <input type="text" class="form-control" style="width: 400px;" value="${sessionScope.m.phone}" name="phone" id="phoneVal">
	                            <button class="btn btn-secondary my-3 my-sm-0" type="button" style="margin-left: 10px;" id="phoneBtn">?????? ??????</button>
	                        </div>
	                    </div>
	                    <div class="line"></div>
	                    <div class="btnArea">
	                        <button type="submit" class="btn btn-secondary" onclick="return checkValue();">??????</button>
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
			$("#authMsg").html("???????????? ??????");
			$("#authMsg").css("color", "red");
		} else {
			console.log(mailCode);
			if($("#authCode").val() == mailCode){
				$("#authMsg").html("????????????");
				$("#authMsg").css("color", "blue");
				clearInterval(intervalId);
				$("#timeZone").empty();
			} else {
				$("#authMsg").html("??????????????? ???????????????");
				$("#authMsg").css("color", "red");
			}
		}
	});
    </script>
</body>
</html>