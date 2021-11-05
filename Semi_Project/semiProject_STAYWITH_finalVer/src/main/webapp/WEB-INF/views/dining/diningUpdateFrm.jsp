<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이닝 수정</title>
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
            <h2>다이닝 수정</h2>
            <div class="diningFrmBox">
                <form action="/diningUpdate" method="post" enctype="multipart/form-data" autocomplete="off">
                <input type="hidden" name="diningNo" value="${d.diningNo }">
                    <div class="form-group row">
                        <label for="diningType" class="col-sm-3 col-form-label">타입</label>
                        <div class="col-sm-7">
                        <input type="hidden" name="diningType" value="${d.diningType }">
                            <select class="form-select" id="diningType" disabled>
	                            <c:choose>
	                            	<c:when test="${d.diningType eq 1 }">
		                                <option value="1">레스토랑</option>
	                            	</c:when>
	                            	<c:when test="${d.diningType eq 2 }">
		                                <option value="2">라운지&amp;바</option>
	                            	</c:when>
	                            	<c:when test="${d.diningType eq 3 }">
		                                <option value="3">베이커리</option>
	                            	</c:when>                            
	                            </c:choose>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row name-box">
                        <label for="diningName" class="col-sm-3 col-form-label">이름<span class="req">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" name="diningName" id="diningName" class="form-control" maxlength="14" required value="${d.diningName }">
                            <span id="chkNm"></span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="diningLoc" class="col-sm-3 col-form-label">위치<span class="req">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" name="diningLoc" id="diningLoc" class="form-control" maxlength="16" required value="${d.diningLoc }">
                        </div>
                    </div>
                    <div class="form-group row tel-box">
                        <label for="tel" class="col-sm-3 col-form-label">전화번호<span class="req">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" name="tel" id="tel" class="form-control" maxlength="16" required placeholder="02-0000-0000" value="${d.tel }">
                            <span id="chkTel"></span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="diningInfo" class="col-sm-3 col-form-label">간단설명<span class="req">*</span></label>
                        <div class="col-sm-9">
                            <textarea class="form-control" name="diningInfo" id="diningInfo" maxlength="50" rows="3" required>${d.diningInfoBr }</textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="diningIntro" class="col-sm-3 col-form-label">소개글<span class="req">*</span></label>
                        <div class="col-sm-9">
                            <textarea class="form-control" name="diningIntro" id="diningIntro" maxlength="100" rows="3" required>${d.diningIntroBr }</textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="diningTime" class="col-sm-3 col-form-label">운영시간<span class="req">*</span></label>
                        <div class="col-sm-9 row timeSel">
                            <div class="row timeLunch">
                            	<!-- 다이닝 타입에 따른 운영시간 선택 -->
                                <label for="lunchOpen" class="col-sm-3 col-form-label">Lunch-open</label>
                                <div class="col-sm-3">
                                    <select class="form-select" name="lunchOpen" id="lunchOpen">
                                    <c:choose>
                                    	<c:when test='${d.timeList[0].open eq "11:00"}'>
                                    		<option value="11:00" selected></option>
                                         <option value="11:30"></option>
                                         <option value="12:00"></option>
                                    	</c:when>
                                    	<c:when test='${d.timeList[0].open eq "11:30"}'>
                                    		<option value="11:00"></option>
                                         <option value="11:30" selected></option>
                                         <option value="12:00"></option>
                                    	</c:when>
                                    	<c:when test='${d.timeList[0].open eq "12:00"}'>
                                    		<option value="11:00"></option>
                                         <option value="11:30"></option>
                                         <option value="12:00" selected></option>
                                    	</c:when>
                                    </c:choose>
                                    </select>
                                </div>
                                <label for="lunchClose" class="col-sm-3 col-form-label">Lunch-close</label>
                                <div class="col-sm-3">
                                    <select class="form-select" name="lunchClose" id="lunchClose">
                                    <c:choose>
                                    	<c:when test='${d.timeList[0].close eq "14:00"}'>
                                         <option value="14:00" selected></option>
                                         <option value="14:30"></option>
                                         <option value="15:00"></option>                                        	
                                    	</c:when>
                                    	<c:when test='${d.timeList[0].close eq "14:30"}'>
                                         <option value="14:00"></option>
                                         <option value="14:30" selected></option>
                                         <option value="15:00"></option>                                        	
                                    	</c:when>
                                    	<c:when test='${d.timeList[0].close eq "15:00"}'>
                                         <option value="14:00"></option>
                                         <option value="14:30"></option>
                                         <option value="15:00" selected></option>                                        	
                                    	</c:when>
                                    </c:choose>
                                    </select>
                                </div>
                            </div>
                            <div class="row timeDinner">
                                <label for="dinnerOpen" class="col-sm-3 col-form-label">dinner-open</label>
                                <div class="col-sm-3">
                                    <select class="form-select" name="dinnerOpen" id="dinnerOpen">
                                    <c:choose>
                                    	<c:when test='${d.timeList[1].open eq "17:00"}'>
                                         <option value="17:00" selected></option>
                                         <option value="17:30"></option>
                                         <option value="18:00"></option>                                      	
                                    	</c:when>
                                    	<c:when test='${d.timeList[1].open eq "17:30"}'>
                                         <option value="17:00"></option>
                                         <option value="17:30" selected></option>
                                         <option value="18:00"></option>                                      	
                                    	</c:when>
                                    	<c:when test='${d.timeList[1].open eq "18:00"}'>
                                         <option value="17:00"></option>
                                         <option value="17:30"></option>
                                         <option value="18:00" selected></option>                                      	
                                    	</c:when>
                                    </c:choose>
                                    </select>
                                </div>
                                <label for="dinnerClose" class="col-sm-3 col-form-label">dinner-close</label>
                                <div class="col-sm-3">
                                    <select class="form-select" name="dinnerClose" id="dinnerClose">
                                    <c:choose>
                                    	<c:when test='${d.timeList[1].close eq "21:00"}'>
                                         <option value="21:00" selected></option>
                                         <option value="21:30"></option>
                                         <option value="22:00"></option>
                                    	</c:when>
                                    	<c:when test='${d.timeList[1].close eq "21:30"}'>
                                         <option value="21:00"></option>
                                         <option value="21:30" selected></option>
                                         <option value="22:00"></option>
                                    	</c:when>
                                    	<c:when test='${d.timeList[1].close eq "22:00"}'>
                                         <option value="21:00"></option>
                                         <option value="21:30"></option>
                                         <option value="22:00" selected></option>
                                    	</c:when>
                                    </c:choose>
                                    </select>
                                </div>
                            </div>
                            <div class="row timeLounge">
                                <label for="brunchOpen" class="col-sm-3 col-form-label">brunch-open</label>
                                <div class="col-sm-3">
                                    <select class="form-select" name="brunchOpen" id="brunchOpen">
                                    <c:choose>
                                    	<c:when test='${d.timeList[0].open eq "10:00"}'>
                                         <option value="10:00" selected></option>
                                         <option value="10:30"></option>
                                         <option value="11:00"></option>
                                    	</c:when>
                                    	<c:when test='${d.timeList[0].open eq "10:30"}'>
                                         <option value="10:00"></option>
                                         <option value="10:30" selected></option>
                                         <option value="11:00"></option>
                                    	</c:when>
                                    	<c:when test='${d.timeList[0].open eq "11:00"}'>
                                         <option value="10:00"></option>
                                         <option value="10:30"></option>
                                         <option value="11:00" selected></option>
                                    	</c:when>
                                    </c:choose>
                                    </select>
                                </div>
                                <label for="brunchClose" class="col-sm-3 col-form-label">brunch-close</label>
                                <div class="col-sm-3">
                                    <select class="form-select" name="brunchClose" id="brunchClose">
                                    <c:choose>
                                    	<c:when test='${d.timeList[0].close eq "13:00"}'>
                                         <option value="13:00" selected></option>
                                         <option value="13:30"></option>
                                         <option value="14:00"></option>
                                    	</c:when>
                                    	<c:when test='${d.timeList[0].close eq "13:30"}'>
                                         <option value="13:00"></option>
                                         <option value="13:30" selected></option>
                                         <option value="14:00"></option>
                                    	</c:when>
                                    	<c:when test='${d.timeList[0].close eq "14:00"}'>
                                         <option value="13:00"></option>
                                         <option value="13:30"></option>
                                         <option value="14:00" selected></option>
                                    	</c:when>
                                    </c:choose>
                                    </select>
                                </div>
                            </div>
                            <div class="row timeAfter">
                                <label for="afterOpen" class="col-sm-3 col-form-label">after-open</label>
                                <div class="col-sm-3">
                                    <select class="form-select" name="afterOpen" id="afterOpen">
                                    <c:choose>
                                    	<c:when test='${d.timeList[1].open eq "11:30"}'>
                                         <option value="11:30" selected></option>
                                         <option value="12:00"></option>
                                         <option value="12:30"></option>
                                    	</c:when>
                                    	<c:when test='${d.timeList[1].open eq "12:00"}'>
                                         <option value="11:30"></option>
                                         <option value="12:00" selected></option>
                                         <option value="12:30"></option>
                                    	</c:when>
                                    	<c:when test='${d.timeList[1].open eq "12:30"}'>
                                         <option value="11:30"></option>
                                         <option value="12:00"></option>
                                         <option value="12:30" selected></option>
                                    	</c:when>
                                    </c:choose>
                                    </select>
                                </div>
                                <label for="afterClose" class="col-sm-3 col-form-label">after-close</label>
                                <div class="col-sm-3">
                                    <select class="form-select" name="afterClose" id="afterClose">
                                    <c:choose>
                                    	<c:when test='${d.timeList[1].close eq "17:30"}'>
                                         <option value="17:30" selected></option>
                                         <option value="18:00"></option>
                                         <option value="18:30"></option>
                                    	</c:when>
                                    	<c:when test='${d.timeList[1].close eq "18:00"}'>
                                         <option value="17:30"></option>
                                         <option value="18:00" selected></option>
                                         <option value="18:30"></option>
                                    	</c:when>
                                    	<c:when test='${d.timeList[1].close eq "18:30"}'>
                                         <option value="17:30"></option>
                                         <option value="18:00"></option>
                                         <option value="18:30" selected></option>
                                    	</c:when>
                                    </c:choose>
                                    </select>
                                </div>
                            </div>
                            <div class="row timeDay">
                                <label for="dayOpen" class="col-sm-3 col-form-label">day-open</label>
                                <div class="col-sm-3">
                                    <select class="form-select" name="dayOpen" id="dayOpen">
                                    <c:choose>
                                    <%-- 라운지인 경우 --%>
                                    	<c:when test="${d.diningType eq 2 }">
                                    		<c:choose>
                                    			<c:when test='${d.timeList[2].open eq "8:00 "}'>
                                           <option value="8:00" selected></option>
                                           <option value="9:00"></option>
                                           <option value="10:00"></option>
                                           <option value="11:00"></option>
                                       </c:when>
                                       <c:when test='${d.timeList[2].open eq "9:00 "}'>
                                           <option value="8:00"></option>
                                           <option value="9:00" selected></option>
                                           <option value="10:00"></option>
                                           <option value="11:00"></option>
                                       </c:when>
                                       <c:when test='${d.timeList[2].open eq "10:00"}'>
                                           <option value="8:00"></option>
                                           <option value="9:00"></option>
                                           <option value="10:00" selected></option>
                                           <option value="11:00"></option>
                                       </c:when>
                                       <c:when test='${d.timeList[2].open eq "11:00"}'>
                                           <option value="8:00"></option>
                                           <option value="9:00"></option>
                                           <option value="10:00"></option>
                                           <option value="11:00" selected></option>
                                       </c:when>
                                    		</c:choose>
                                    	</c:when>
                                    	<%-- 베이커리인 경우 --%>
                                    	<c:otherwise>
                                    		<c:choose>
                                       <c:when test='${d.timeList[0].open eq "8:00 "}'>
                                           <option value="8:00" selected></option>
                                           <option value="9:00"></option>
                                           <option value="10:00"></option>
                                           <option value="11:00"></option>
                                       </c:when>
                                       <c:when test='${d.timeList[0].open eq "9:00 "}'>
                                           <option value="8:00"></option>
                                           <option value="9:00" selected></option>
                                           <option value="10:00"></option>
                                           <option value="11:00"></option>
                                       </c:when>
                                       <c:when test='${d.timeList[0].open eq "10:00"}'>
                                           <option value="8:00"></option>
                                           <option value="9:00"></option>
                                           <option value="10:00" selected></option>
                                           <option value="11:00"></option>
                                       </c:when>
                                       <c:when test='${d.timeList[0].open eq "11:00"}'>
                                           <option value="8:00"></option>
                                           <option value="9:00"></option>
                                           <option value="10:00"></option>
                                           <option value="11:00" selected></option>
                                       </c:when>
                                    		</c:choose>
                                    	</c:otherwise>
                                    </c:choose>
                                    </select>
                                </div>
                                <label for="dayClose" class="col-sm-3 col-form-label">day-close</label>
                                <div class="col-sm-3">
                                    <select class="form-select" name="dayClose" id="dayClose">
                                    <c:choose>
                                    	<c:when test="${d.diningType eq 2 }">
                                    		<c:choose>
                                      	<c:when test='${d.timeList[2].close eq "20:00"}'>
                                           <option value="20:00" selected></option>
                                           <option value="21:00"></option>
                                           <option value="22:00"></option>
                                      	</c:when>
                                      	<c:when test='${d.timeList[2].close eq "21:00"}'>
                                           <option value="20:00"></option>
                                           <option value="21:00" selected></option>
                                           <option value="22:00"></option>
                                      	</c:when>
                                      	<c:when test='${d.timeList[2].close eq "22:00"}'>
                                           <option value="20:00"></option>
                                           <option value="21:00"></option>
                                           <option value="22:00" selected></option>
                                      	</c:when>
                                    		</c:choose>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<c:choose>
                                      	<c:when test='${d.timeList[0].close eq "20:00"}'>
                                           <option value="20:00" selected></option>
                                           <option value="21:00"></option>
                                           <option value="22:00"></option>
                                      	</c:when>
                                      	<c:when test='${d.timeList[0].close eq "21:00"}'>
                                           <option value="20:00"></option>
                                           <option value="21:00" selected></option>
                                           <option value="22:00"></option>
                                      	</c:when>
                                      	<c:when test='${d.timeList[0].close eq "22:00"}'>
                                           <option value="20:00"></option>
                                           <option value="21:00"></option>
                                           <option value="22:00" selected></option>
                                      	</c:when>
                                    		</c:choose>
                                    	</c:otherwise>
                                    </c:choose>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row cnt-box">
                        <label for="seatCnt" class="col-sm-3 col-form-label">좌석 수<span class="req">*</span> (50~200)</label>
                        <div class="col-sm-3">
                            <input type="number" name="seatCnt" id="seatCnt" class="form-control" min="50" max="200" value="${d.seatCnt }">
                            <div class="check" id="seatChk">좌석 수를 입력하세요.</div>
                        </div>
                        <label for="roomCnt" class="col-sm-3 col-form-label">룸 수<span class="req">*</span> (2~10)</label>
                        <div class="col-sm-3">
                            <input type="number" name="roomCnt" id="roomCnt" class="form-control" min="2" max="10" value="${d.roomCnt }">
                            <div class="check" id="roomChk">룸 수를 입력하세요.</div>
                        </div>
                    </div>
                    <div class="com">※ 변경할 이미지 파일을 첨부하세요. (미첨부 시 기존 이미지로 유지됩니다.)</div>
                    <input type="hidden" name="oldThumb" value="${d.thumbnailImg }">
                    <input type="hidden" name="oldDetail" value="${d.detailedImg }">
                    <div class="form-group row">
                        <label for="thumbnail" class="col-sm-3 col-form-label">썸네일 이미지</label>
                        <div class="col-sm-9">
                            <input class="form-control" type="file" name="thumbnail" id="thumbnail" accept=".jpg,.jpeg,.png">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="detailed" class="col-sm-3 col-form-label">상세 이미지</label>
                        <div class="col-sm-9">
                            <input class="form-control" type="file" name="detailed" id="detailed" accept=".jpg,.jpeg,.png">
                        </div>
                    </div>
                    <div class="row btnBox">
                        <div class="col-sm-7">
                            <a href="/diningList" class="btn btn-outline-secondary">취소</a>
                        </div>
                        <div class="col-sm-5">
                            <button type="submit" class="btn btn-secondary" id="write" onclick="return chk();">수정</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
    	$(function(){
    		$(".subnavi").eq(3).find("a").eq(1).css("background-color","#d6c6a5")
    		$(".subnavi").eq(3).find("a").eq(1).children().show();
    		$(".timeSel option").each(function(index, item){
    			$(item).html($(item).val());
    		});
    		if($("#diningType").val()==1){
    			$(".timeLounge").hide();
     			$(".timeAfter").hide();
     			$(".timeDay").hide();
    		}else if($("#diningType").val()==2){
    			$(".timeLunch").hide();
     			$(".timeDinner").hide();
    		}else{
    			$(".timeLounge").hide();
     			$(".timeAfter").hide();
     			$(".timeLunch").hide();
     			$(".timeDinner").hide();
     			$(".timeSel").parent().next().hide();
    		}
    	});
    	$("[name=diningName]").keyup(function(){
     		var diningName = $(this).val();
     		$.ajax({
     			url:"/chkDiningNm",
     			type:"post",
     			data:{diningName:diningName},
     			success:function(data){
     				$("#chkNm").empty();
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
</body>
</html>