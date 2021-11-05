<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/lifestyle-pay.css">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="main">
        <form action="/updateRes" method="post" >
            <h2 id="pay-title">피트니스 예약 수정</h2>
			<div id="resInfo"><span>${rl.resDate }</span><span>${lf.lfTitle }</span><span>${rl.resTime }</span><span>${rl.resPeople }명</span><span>${rl.price }원</span></div>
			<input type="hidden" id="price" name="price" value="${rl.price }">
			<input type="hidden"  name="resDate" value="${rl.resDate }">
			<input type="hidden"  name="resTime" value="${rl.resTime }">
			<input type="hidden"  name="resPeople" value="${rl.resPeople }">
			<input type="hidden" name="lfNo" value="${lf.lfNo}">
			<input type="hidden" name="resNo" value="${rl.resNo}">
			
			<div class="memberInfo">
				<p>고객 정보 확인</p>
				<div class="info">
				<span>성명 : </span>
				<input type="text" readonly value="${sessionScope.m.memberKname }">
				</div>
				<div class="info">
				<span>영문이름 : </span>
				<input type="text" readonly value="${sessionScope.m.memberFname }${sessionScope.m.memberLname }">
				</div>
				<div class="info">
				<span>ID : </span>
				<input type="text" name="memberId" readonly value="${sessionScope.m.memberId }">
				</div>
				<div class="info">
				<span>연락처 : </span>
				<input type="text"  readonly value="${sessionScope.m.phone }">
				</div>
			</div>
			<div class="payInfo">
				<p>유의사항</p>
				<div class="agree-box">
					<br>
					<p>
						<b>필수적 개인정보 수집 및 동의</b>
					</p>
					<span> StayWith호텔 고객의 문의 및 의견과 관련하여 귀사가 아래와 같이 본인의 개인정보를 수집
						및 이용하는데 동의합니다.<br> <b>1. 필수적인 개인정보의 수집 ㆍ이용에 관한 사항<br>
							① 수집ㆍ이용 항목 | 성명(국문·영문), 이메일, 휴대전화<br> ② 수집ㆍ이용 목적 | 문의에 대한 안내
							및 서비스 제공<br> ③ 보유ㆍ이용 기간 | 수집ㆍ이용 동의일로부터 5년간<br></b> ※위 사항에
						대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 문의에 대한 안내 및 서비스 제공과 관련된 제반 절차
						진행이 불가능 할 수 있음을 알려드립니다.
					</span> <label for="chk"> <input type="checkbox" id="chk" >동의함</label>
				</div>
			</div>
            <div class="btnDiv">
           <!--  <button type="button" id="payment" class="btn btn-outline-danger btn-block" onclick="return checkAgree();">결제하기</button> -->
                <button  onclick="return checkAgree();" type="submit" class="btn btn-secondary" id="resBtn">재예약하기</button>
            </div>
        </div>
    </form>
    <script >
	function checkAgree() {
		if ($("#chk").is(":checked")) {
			return true;
			}
		 else {
			alert("필수적 개인정보 수집 및 동의에 동의하십시오.");
			return false;
		} 
	}
    
    </script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>