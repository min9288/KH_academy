<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이닝 등록</title>
<link rel="stylesheet" href="/css/diningWriteFrm.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="main">
        <div class="main-left-box">
                <h2>관리자 페이지</h2>
                <ul>
                    <li>
                        <span>메인 페이지</span>
                        <ul class="subnavi">
                        	<li><a href="/adminMain">관리자 개요<span>&gt;</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <span>시설 예약 내역</span>
                        <ul class="subnavi">
                            <li><a href="/adminRoomResList?reqPage=1">객실 예약 내역<span>&gt;</span></a></li>
	                    	<li><a href="/adminDiningList?reqPage=1">다이닝 예약 내역<span>&gt;</span></a></li>
	                    	<li><a href="/adminLfList?reqPage=1">라이프스타일 예약 내역<span>&gt;</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <span>고객문의 및 회원</span>
                        <ul class="subnavi">
                            <li><a href="/adminQuestionList?reqPage=1">고객 문의 내역<span>&gt;</span></a></li>
	                    	<li><a href="/adminMemberList?reqPage=1&dataType=List&data=''">회원 정보<span>&gt;</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <span>시설 관리</span>
                        <ul class="subnavi">
                            <li><a href="/roomManage">객실 관리<span>&gt;</span></a></li>
	                    	<li><a href="/diningList">다이닝 관리<span>&gt;</span></a></li>	
	                    	<li><a href="/lifestyleList?reqPage=1" id="lf-click">라이프스타일 관리<span>&gt;</span></a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        <!-- 메인 콘텐츠 -->
        <div class="main-content">
            <h2>다이닝 등록</h2>
            <div class="diningFrmBox">
                <form action="/diningWrite" method="post" enctype="multipart/form-data" autocomplete="off">
                    <div class="form-group row">
                        <label for="diningType" class="col-sm-3 col-form-label">타입<span class="req">*</span></label>
                        <div class="col-sm-7">
                            <select class="form-select" name="diningType" id="diningType">
                                <option value="1">레스토랑</option>
                                <option value="2">라운지&amp;바</option>
                                <option value="3">베이커리</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row name-box">
                        <label for="diningName" class="col-sm-3 col-form-label">이름<span class="req">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" name="diningName" id="diningName" class="form-control" maxlength="14" required>
                            <span id="chkNm"></span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="diningLoc" class="col-sm-3 col-form-label">위치<span class="req">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" name="diningLoc" id="diningLoc" class="form-control" maxlength="16" required>
                        </div>
                    </div>
                    <div class="form-group row tel-box">
                        <label for="tel" class="col-sm-3 col-form-label">전화번호<span class="req">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" name="tel" id="tel" class="form-control" maxlength="16" required placeholder="02-0000-0000">
                            <span id="chkTel"></span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="diningInfo" class="col-sm-3 col-form-label">간단설명<span class="req">*</span></label>
                        <div class="col-sm-9">
                            <textarea class="form-control" name="diningInfo" id="diningInfo" maxlength="50" rows="3" required></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="diningIntro" class="col-sm-3 col-form-label">소개글<span class="req">*</span></label>
                        <div class="col-sm-9">
                            <textarea class="form-control" name="diningIntro" id="diningIntro" maxlength="100" rows="3" required></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="diningTime" class="col-sm-3 col-form-label">운영시간<span class="req">*</span></label>
                        <div class="col-sm-9 row timeSel">
                            <div class="row timeLunch">
                                <label for="lunchOpen" class="col-sm-3 col-form-label">Lunch-open</label>
                                <div class="col-sm-3">
                                    <select class="form-select" name="lunchOpen" id="lunchOpen">
                                        <option value="11:00"></option>
                                        <option value="11:30"></option>
                                        <option value="12:00"></option>
                                    </select>
                                </div>
                                <label for="lunchClose" class="col-sm-3 col-form-label">Lunch-close</label>
                                <div class="col-sm-3">
                                    <select class="form-select" name="lunchClose" id="lunchClose">
                                        <option value="14:00"></option>
                                        <option value="14:30"></option>
                                        <option value="15:00"></option>
                                    </select>
                                </div>
                            </div>
                            <div class="row timeDinner">
                                <label for="dinnerOpen" class="col-sm-3 col-form-label">dinner-open</label>
                                <div class="col-sm-3">
                                    <select class="form-select" name="dinnerOpen" id="dinnerOpen">
                                        <option value="17:00"></option>
                                        <option value="17:30"></option>
                                        <option value="18:00"></option>
                                    </select>
                                </div>
                                <label for="dinnerClose" class="col-sm-3 col-form-label">dinner-close</label>
                                <div class="col-sm-3">
                                    <select class="form-select" name="dinnerClose" id="dinnerClose">
                                        <option value="21:00"></option>
                                        <option value="21:30"></option>
                                        <option value="22:00"></option>
                                    </select>
                                </div>
                            </div>
                            <div class="row timeLounge">
                                <label for="brunchOpen" class="col-sm-3 col-form-label">brunch-open</label>
                                <div class="col-sm-3">
                                    <select class="form-select" name="brunchOpen" id="brunchOpen">
                                        <option value="10:00"></option>
                                        <option value="10:30"></option>
                                        <option value="11:00"></option>
                                    </select>
                                </div>
                                <label for="brunchClose" class="col-sm-3 col-form-label">brunch-close</label>
                                <div class="col-sm-3">
                                    <select class="form-select" name="brunchClose" id="brunchClose">
                                        <option value="13:00"></option>
                                        <option value="13:30"></option>
                                        <option value="14:00"></option>
                                    </select>
                                </div>
                            </div>
                            <div class="row timeAfter">
                                <label for="afterOpen" class="col-sm-3 col-form-label">after-open</label>
                                <div class="col-sm-3">
                                    <select class="form-select" name="afterOpen" id="afterOpen">
                                        <option value="11:30"></option>
                                        <option value="12:00"></option>
                                        <option value="12:30"></option>
                                    </select>
                                </div>
                                <label for="afterClose" class="col-sm-3 col-form-label">after-close</label>
                                <div class="col-sm-3">
                                    <select class="form-select" name="afterClose" id="afterClose">
                                        <option value="17:30"></option>
                                        <option value="18:00"></option>
                                        <option value="18:30"></option>
                                    </select>
                                </div>
                            </div>
                            <div class="row timeDay">
                                <label for="dayOpen" class="col-sm-3 col-form-label">day-open</label>
                                <div class="col-sm-3">
                                    <select class="form-select" name="dayOpen" id="dayOpen">
                                        <option value="8:00"></option>
                                        <option value="9:00"></option>
                                        <option value="10:00"></option>
                                        <option value="11:00"></option>
                                    </select>
                                </div>
                                <label for="dayClose" class="col-sm-3 col-form-label">day-close</label>
                                <div class="col-sm-3">
                                    <select class="form-select" name="dayClose" id="dayClose">
                                        <option value="20:00"></option>
                                        <option value="21:00"></option>
                                        <option value="22:00"></option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row cnt-box">
                        <label for="seatCnt" class="col-sm-3 col-form-label">좌석 수<span class="req">*</span> (50~200)</label>
                        <div class="col-sm-3">
                            <input type="number" name="seatCnt" id="seatCnt" class="form-control" max="200" min="50">
                            <div class="check" id="seatChk">좌석 수를 입력하세요.</div>
                        </div>
                        <label for="roomCnt" class="col-sm-3 col-form-label">룸 수<span class="req">*</span> (2~10)</label>
                        <div class="col-sm-3">
                            <input type="number" name="roomCnt" id="roomCnt" class="form-control" max="10" min="2">
                            <div class="check" id="roomChk">룸 수를 입력하세요.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="thumbnail" class="col-sm-3 col-form-label">썸네일 이미지<span class="req">*</span></label>
                        <div class="col-sm-9">
                            <input class="form-control" type="file" name="thumbnail" id="thumbnail" accept=".jpg,.jpeg,.png" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="detailed" class="col-sm-3 col-form-label">상세 이미지<span class="req">*</span></label>
                        <div class="col-sm-9">
                            <input class="form-control" type="file" name="detailed" id="detailed" accept=".jpg,.jpeg,.png" required>
                        </div>
                    </div>
                    <div class="row btnBox">
                        <div class="col-sm-7">
                            <a href="/diningList" class="btn btn-outline-secondary">취소</a>
                        </div>
                        <div class="col-sm-5">
                            <button type="submit" class="btn btn-secondary" onclick="return chk();">등록</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
 	$(function(){
 		$(".subnavi").eq(3).find("a").eq(1).css("background-color","#d6c6a5")
 		$(".subnavi").eq(3).find("a").eq(1).children().show();
		$(".timeSel option").each(function(index, item){
 			$(item).html($(item).val());
 		});
 		$(".timeLounge").hide();
 		$(".timeAfter").hide();
 		$(".timeDay").hide();
 	});
 	$("#diningType").change(function(){
		$(".timeSel>div").hide();
		$("#seatChk").hide();
		$("#roomChk").hide();
		$("input[type=text]").val("");
		$("input[type=number]").val("");
		$("textarea").val("");
		$("span").empty();
 		var val = $(this).val();
 		if(val == 1){
 			$(".timeLunch").show();
 			$(".timeDinner").show();
 			$(".timeSel").parent().next().show();
 		}else if(val == 2){
 			$(".timeLounge").show();
 			$(".timeAfter").show();
 			$(".timeDay").show();
 			$(".timeSel").parent().next().show();
 		}else{
 			$(".timeDay").show();
 			$(".timeSel").parent().next().hide();
 		}
 	});
 	$("[name=diningName]").keyup(function(){
 		var diningName = $(this).val();
		$("#chkNm").empty();
 		$.ajax({
 			url:"/chkDiningNm",
 			type:"post",
 			data:{diningName:diningName},
 			success:function(data){
 				if(data == 'true'){
	 				$("#chkNm").html("이미 사용 중입니다.");
	 				$("#chkNm").css("color","red");
 				}else {
 					$("#chkNm").html("사용 가능");
	 				$("#chkNm").css("color","blue");
 				}
 				if($("[name=diningName]").val()==""){
 					$("#chkNm").empty();
 				}
 			}
 		});
 	});
 	function chk(){
 		var submit = true;
 		if($("#diningType").val() != 3 && $("#seatCnt").val()==""){
			$("#seatChk").show();
			submit = false;
 		}
 		if($("#diningType").val() != 3 && $("#roomCnt").val()==""){
 			$("#roomChk").show();
 			submit = false;
 		}
 		if($("#chkNm").css("color") == 'rgb(255, 0, 0)'){
 			submit = false;
 		}
 		if($("#chkTel").css("color") == 'rgb(255, 0, 0)'){
 			submit = false;
 		}
 		if(submit == false){
 			alert("필수 입력 정보를 확인해주세요.");
 		}
 		return submit;
 	}
 	$(".cnt-box>div>input").keyup(function(){
 		if($(this).val() != ""){
 			$(this).next().hide();
 		}
 	});
 	$("[name=tel]").keyup(function(){
 		$("#chkTel").empty();
 		$("#chkTel").css("color","transparent");
 		var reg = /^\d{2,3}-\d{3,4}-\d{4}$/;
 		if(!reg.test($(this).val())){
 			$("#chkTel").html("전화번호 형식에 맞지 않습니다.");
 			$("#chkTel").css("color","red");
 		}
 		if($(this).val()==""){
 			$("#chkTel").empty();
 			$("#chkTel").css("color","transparent");
 		}
 	});
</script>
</html>