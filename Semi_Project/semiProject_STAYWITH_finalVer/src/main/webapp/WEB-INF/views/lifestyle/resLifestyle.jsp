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
<link href='/resources/calendar/packages/daygrid/main.css'
	rel='stylesheet'>
<!-- Calendar API js 추가 -->
<script src='/resources/calendar/packages/core/main.js'></script>
<script src='/resources/calendar/packages/interaction/main.js'></script>
<script src='/resources/calendar/packages/daygrid/main.js'></script>
<!-- Calendar 추가 css  -->
<link href='/resources/css/calendar.css' rel='stylesheet'>
<!-- jQuery 라이브러리 추가 -->
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<!-- Calendar 추가 함수 -->
<script type="text/javascript" src="/resources/js/lf_calendar.js"></script>
<link rel="stylesheet" href="/css/default.css">
<link rel="stylesheet" href="/css/reslifestyle.css">
<link rel="stylesheet" href="/css/bootstrap.css">
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="main">
		<form action="/resLifestyle2" method="post">
			<h2 id="res-title">피트니스 예약</h2>
			<input type="hidden" name="memberNo"
				value="${sessionScope.m.memberNo }">
			<div class="lf-title">
				<p class="sel">☞ 선택한 피트니스</p>
				<input id="lfTitle" type="text" name="lfTitle" value="${lf.lfTitle}">
				<input type="hidden" name="lfNo" value="${lf.lfNo}"> <img
					id="preview-image" src="/upload/thumbnail/${lf.filename }">
			</div>
			<div class="p-count">
				<p class="sel">☞ 인원 선택</p>
				<button type="button" class="btn btn-light" id="minus">-</button>
				<span id="people">1</span>
				<button type="button" class="btn btn-light" id="plus">+</button>
				<input type="hidden" name="resPeople" id="resPeople">

			</div>
			<div class="calendar">
				<p class="sel">☞ 날짜 선택</p>
				<div id="calendar"></div>
				<div class="resEtc">
					<p class="sel">☞ 선택한 날짜</p>
					<input type="text" id="resDate" name="resDate" value="" readonly>
					<div id="resTime">
						<p class="sel">☞ 시간 선택</p>
						<select name="resTime" id="resT">
							<option value="10:00">10:00</option>
							<option value="11:00">11:00</option>
							<option value="12:00">12:00</option>
							<option value="13:00">13:00</option>
							<option value="14:00">14:00</option>
							<option value="15:00">15:00</option>
							<option value="16:00">16:00</option>
							<option value="17:00">17:00</option>
							<option value="18:00">18:00</option>
							<option value="19:00">19:00</option>
						</select>
					</div>
					<div class="pay">
						<p class="sel">☞ 총 가격</p>
						<span id="pay">10000</span><span>원</span> <input type="hidden"
							name="price" id="price">
					</div>
				</div>
			</div>
			<div class="btnDiv">
				<button type="submit" class="btn btn-secondary" id="resBtn">예약하기</button>
			</div>
		</form>
	</div>
	<input type="hidden" id="noDay" value="">
	<script>
        $(function(){
				
        /* 	$(".fc-past" ).click(function() {
							alert("지난 날짜는 선택 할 수 없습니다.");
							$("#noDay").val("past");
						});
						$(".fc-today").click(function() {
							$("#noDay").val("yes");

						});

						$(".fc-future").click(function() {
							$("#noDay").val("yes");
						}); */
					}); 

					$(".p-count>button").click(function() {
						var currAmount = Number($("#people").html());
						if ($(this).html() == "+") {
							$("#people").html(++currAmount);
						} else if (currAmount != 1) {
							$("#people").html(--currAmount);
						}
						var price = 10000;
						$("#pay").html(currAmount * price);
					});

					$("#resBtn").click(function() {
						$("#resPeople").val($("#people").html());
						$("#price").val($("#pay").html());
					});

					if ($("#resDate").val() != "") {
						$("#resTime").show();
					}
				</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>