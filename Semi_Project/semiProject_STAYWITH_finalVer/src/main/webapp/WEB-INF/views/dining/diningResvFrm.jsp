<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이닝 예약</title>
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
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="main">
            <h2>다이닝 예약</h2>
            <form action="/diningResv" method="post">
                <div id="name-box">
                    <label for="diningNo" class="col-sm-2 col-form-label">다이닝 선택 <span class="req">*</span></label>
                    <div class="col-sm-6">
                        <select name="diningNo" id="diningNo" class="form-select">
                        	<c:forEach items="${list }" var="d">
                        		<c:choose>
                        			<c:when test="${diningNo eq d.diningNo }">
			                            <option value="${d.diningNo }" selected>${d.diningName }</option>                        			
                        			</c:when>
                        			<c:otherwise>
                        				<option value="${d.diningNo }">${d.diningName }</option>
                        			</c:otherwise>
                        		</c:choose>
                        	</c:forEach>
                        </select>
                        <button type="button" class="btn btn-outline-secondary btn-sm btnD">상세보기</button>
                    </div>
                    <div class="col-sm-4">
                        <p><span class="req">*</span> 표시 필수 입력</p>
                    </div>
                </div>
                <div class="date-time-box">
                    <div class="date-box">
                        <label class="col-sm-2 col-form-label">날짜 선택 <span class="req">*</span></label>
                        <span id="selDate"></span>
                        <input type="hidden" name="rDate" value="">
                        <div id="calendar"></div>
                    </div>
                    <div class="time-box">
                        <label class="col-sm-2 col-form-label">시간 선택 <span class="req">*</span></label>
                        <div class="btn-group timeType" role="group" aria-label="Basic radio toggle button group">
                            <input type="radio" class="btn-check" name="timeType" id="timeType1" value="1">
                            <label class="btn btn-outline-secondary" for="timeType1">런치</label>
                            <input type="radio" class="btn-check" name="timeType" id="timeType2" value="2">
                            <label class="btn btn-outline-secondary" for="timeType2">디너</label>
                        </div>
                        <div class="col-sm-12">
                            <select name="resTime" id="resTime" class="form-select">
                                <option value="" class="no">방문 예정 시간을 선택해주세요.</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="seat-box">
                    <label class="col-sm-1 col-form-label">좌석 유형 선택 <span class="req">*</span></label>
                    <div class="btn-group seatType" role="group" aria-label="Basic radio toggle button group">
                        <input type="radio" class="btn-check" name="seatType" id="seatType1" value="1">
                        <label class="btn btn-outline-secondary" for="seatType1">테이블</label>
                        <input type="radio" class="btn-check" name="seatType" id="seatType2" value="2">
                        <label class="btn btn-outline-secondary" for="seatType2">룸</label>
                    </div>
                    <div class="seat-info">
                        <p>※ 성인과 소인 동반 시, 최대 4명까지 이용 가능합니다.</p>
                        <p>※ 사회적 거리두기에 발 맞추어 이용 인원이 제한될 수 있으니 양해 부탁드립니다.</p>
                    </div>
                    <div class="room-info">
                        <p>※ 성인과 소인 동반 시, 최소 2명부터 최대 12명까지 이용 가능합니다.</p>
                        <p>※ 예약 인원과 방문 인원이 상이할 경우, 방문 당일 룸 이용이 제한될 수 있으니 소인을 포함한 전체 인원에 대해 예약해주시기 바랍니다.</p>
                        <p>※ 사회적 거리두기에 발 맞추어 이용 인원이 제한될 수 있으니 양해 부탁드립니다.</p>
                    </div>
                </div>
                <div id="guest" class="guest-box row">
                    <label class="col-form-label">인원 선택 <span class="req">*</span></label>
                    <div>
                        <div class="guest-num">
                            <span>성인</span>
                            <button type="button" class="btn btn-light btn-sm">－</button>
                            <input type="text" name="adtCnt" readonly value="0">
                            <button type="button" class="btn btn-light btn-sm">＋</button>
                        </div>
                        <div class="guest-num">
                            <span>어린이</span>
                            <button type="button" class="btn btn-light btn-sm">－</button>
                            <input type="text" name="kidCnt" readonly value="0">
                            <button type="button" class="btn btn-light btn-sm">＋</button>
                        </div>
                        <div>
                            <p>※ 어린이 : 만 11세 이하</p>
                        </div>
                    </div>
                </div>
                <div class="btn-box">
                    <button type="submit" class="btn btn-secondary" onclick="return check();">예약</button>
                </div>
            </form>
        </div>
        <div class="modal">
			<div class="modal-dialog" role="document">
		    	<div class="modal-content">
		     		<div class="modal-header">
			        	<h3 class="modal-title">예약 정보 확인</h3>
			        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
			          		<span aria-hidden="true"></span>
			        	</button>
		    		</div>
		    		<div class="modal-body"></div>
		    		<div class="modal-footer">
			    		<button type="button" class="btn btn-secondary modal-none" data-bs-dismiss="modal">취소</button>
			        	<button type="button" class="btn btn-primary modal-submit">예약 완료</button>
		    		</div>
		  		</div>
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<link rel="stylesheet" href="/css/diningResvFrm.css">
<script type="text/javascript" src="/js/diningResvFrm.js"></script>
<!-- Calendar 추가 함수 -->
<script type="text/javascript" src="/resources/js/diningCalendar.js"></script>
</html>