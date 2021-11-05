<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    	<!-- Calendar API 추가 -->
	<link href='/resources/calendar/packages/core/main.css' rel='stylesheet'>
	<link href='/resources/calendar/packages/daygrid/main.css' rel='stylesheet'>
	<!-- Calendar API js 추가 -->	
	<script src='/resources/calendar/packages/core/main.js'></script>
	<script src='/resources/calendar/packages/interaction/main.js'></script>
	<script src='/resources/calendar/packages/daygrid/main.js'></script>
	<!-- Calendar 추가 css  -->
	<link href='/resources/css/calendar.css' rel='stylesheet'>
	<!-- jQuery 라이브러리 추가 -->
	<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>	
	<!-- Calendar 추가 함수 -->
	<script type="text/javascript" src="/resources/js/res_calendar.js"></script>
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/reslifestyle.css">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="main">
        <form action="/updateLifestyle2" method="post" >
            <h2 class="res-title">피트니스 예약</h2>
            <p class="res-p">인원 변동시 취소 후 재예매를 부탁드립니다.</p>
            <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
            <div class="lf-title">
                <p class="sel">☞ 선택한 피트니스</p>
				<input id="lfTitle" type="text" name="lfTitle" value="${lf.lfTitle}">
				<input type="hidden" name="lfNo" value="${lf.lfNo}">
				<input type="hidden" name="resNo" value="${rl.resNo}">
				<img id="preview-image" src="/upload/thumbnail/${lf.filename }">
            </div>
            <div class="p-count">
                <p class="sel">☞ 인원 선택</p>
                <span id="people">${rl.resPeople }</span>
                <input type="hidden" name="resPeople" id="resPeople">
                
            </div>
            <div class="calendar">
            <p class="sel">☞ 날짜 선택</p>
				<div id="calendar">
				</div>    
				<div class="resEtc">
					<p>☞ 선택한 날짜</p><input type="text" id="resDate" name="resDate" value="${rl.resDate }" readonly>
					<div id="resTime">
						<p>☞ 시간 선택</p>
						<select name="resTime" id="resT">
							<c:if test="${rl.resTime eq '10:00'}">
								<option value ="10:00" selected>10:00</option>
								<option value ="11:00">11:00</option>
								<option value ="12:00">12:00</option>
								<option value ="13:00">13:00</option>
								<option value ="14:00">14:00</option>
								<option value ="15:00">15:00</option>
								<option value ="16:00">16:00</option>
								<option value ="17:00">17:00</option>
								<option value ="18:00">18:00</option>
								<option value ="19:00">19:00</option>
							</c:if>
							<c:if test="${rl.resTime eq '11:00'}">
								<option value ="10:00" >10:00</option>
								<option value ="11:00" selected>11:00</option>
								<option value ="12:00">12:00</option>
								<option value ="13:00">13:00</option>
								<option value ="14:00">14:00</option>
								<option value ="15:00">15:00</option>
								<option value ="16:00">16:00</option>
								<option value ="17:00">17:00</option>
								<option value ="18:00">18:00</option>
								<option value ="19:00">19:00</option>
							</c:if>
							<c:if test="${rl.resTime eq '12:00'}">
								<option value ="10:00" >10:00</option>
								<option value ="11:00">11:00</option>
								<option value ="12:00" selected>12:00</option>
								<option value ="13:00">13:00</option>
								<option value ="14:00">14:00</option>
								<option value ="15:00">15:00</option>
								<option value ="16:00">16:00</option>
								<option value ="17:00">17:00</option>
								<option value ="18:00">18:00</option>
								<option value ="19:00">19:00</option>
							</c:if>
							<c:if test="${rl.resTime eq '13:00'}">
								<option value ="10:00" >10:00</option>
								<option value ="11:00">11:00</option>
								<option value ="12:00">12:00</option>
								<option value ="13:00" selected>13:00</option>
								<option value ="14:00">14:00</option>
								<option value ="15:00">15:00</option>
								<option value ="16:00">16:00</option>
								<option value ="17:00">17:00</option>
								<option value ="18:00">18:00</option>
								<option value ="19:00">19:00</option>
							</c:if>
							<c:if test="${rl.resTime eq '14:00'}">
								<option value ="10:00" >10:00</option>
								<option value ="11:00">11:00</option>
								<option value ="12:00">12:00</option>
								<option value ="13:00">13:00</option>
								<option value ="14:00" selected>14:00</option>
								<option value ="15:00">15:00</option>
								<option value ="16:00">16:00</option>
								<option value ="17:00">17:00</option>
								<option value ="18:00">18:00</option>
								<option value ="19:00">19:00</option>
							</c:if>
							<c:if test="${rl.resTime eq '15:00'}">
								<option value ="10:00" >10:00</option>
								<option value ="11:00">11:00</option>
								<option value ="12:00">12:00</option>
								<option value ="13:00">13:00</option>
								<option value ="14:00">14:00</option>
								<option value ="15:00" selected>15:00</option>
								<option value ="16:00">16:00</option>
								<option value ="17:00">17:00</option>
								<option value ="18:00">18:00</option>
								<option value ="19:00">19:00</option>
							</c:if>
							<c:if test="${rl.resTime eq '16:00'}">
								<option value ="10:00">10:00</option>
								<option value ="11:00">11:00</option>
								<option value ="12:00">12:00</option>
								<option value ="13:00">13:00</option>
								<option value ="14:00">14:00</option>
								<option value ="15:00">15:00</option>
								<option value ="16:00"  selected>16:00</option>
								<option value ="17:00">17:00</option>
								<option value ="18:00">18:00</option>
								<option value ="19:00">19:00</option>
							</c:if>
							<c:if test="${rl.resTime eq '17:00'}">
								<option value ="10:00" >10:00</option>
								<option value ="11:00">11:00</option>
								<option value ="12:00">12:00</option>
								<option value ="13:00">13:00</option>
								<option value ="14:00">14:00</option>
								<option value ="15:00">15:00</option>
								<option value ="16:00">16:00</option>
								<option value ="17:00" selected>17:00</option>
								<option value ="18:00" >18:00</option>
								<option value ="19:00">19:00</option>
							</c:if>
							<c:if test="${rl.resTime eq '18:00'}">
								<option value ="10:00" >10:00</option>
								<option value ="11:00">11:00</option>
								<option value ="12:00">12:00</option>
								<option value ="13:00">13:00</option>
								<option value ="14:00">14:00</option>
								<option value ="15:00">15:00</option>
								<option value ="16:00">16:00</option>
								<option value ="17:00">17:00</option>
								<option value ="18:00" selected>18:00</option>
								<option value ="19:00">19:00</option>
							</c:if>
							<c:if test="${rl.resTime eq '19:00'}">
								<option value ="10:00">10:00</option>
								<option value ="11:00">11:00</option>
								<option value ="12:00">12:00</option>
								<option value ="13:00">13:00</option>
								<option value ="14:00">14:00</option>
								<option value ="15:00">15:00</option>
								<option value ="16:00">16:00</option>
								<option value ="17:00">17:00</option>
								<option value ="18:00">18:00</option>
								<option value ="19:00"  selected>>19:00</option>
							</c:if>
						</select>
					</div>
            <div class="pay">
            	<p>☞ 총 가격</p>
            	 <span id="pay">${rl.price }</span><span>원</span>
            	 <input type="hidden" name="price" id="price">
            </div>
            </div>
				</div>	
            <div class="btnDiv">
                <button type="submit" class="btn btn-secondary" id="resBtn">수정하기</button>
            </div>
        </div>
    </form>
    <script>
        $(function(){
            
        });
        
        $("#resBtn").click(function () {
        $("#resPeople").val($("#people").html());
		$("#price").val($("#pay").html());
		});
        
        if($("#resDate").val() != ""){
        	$("#resTime").show();
        }
        

    </script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>