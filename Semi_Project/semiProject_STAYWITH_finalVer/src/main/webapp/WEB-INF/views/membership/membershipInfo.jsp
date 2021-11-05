<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/membership-info.css">
    <link rel="stylesheet" href="/css/bootstrap.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="main">
    <div class="main-left-box">
        <h2>호텔 소개</h2>
        <ul>
            <li>
                <span>소개</span>
                <ul class="subnavi">
                    <li><a href="/introHotel">STAYWITH 소개<span>&gt;</span></a></li>
                    <li><a href="/membership" id="lf-click">멤버십 정보<span>&gt;</span></a></li>
                    <li><a href="/location">오시는 길<span>&gt;</span></a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- 메인 콘텐츠 -->
    <div class="main-content">
        <table id="membership-table" >
            <h2>회원 특전</h2>
            <br>
            <tr>
                <th>Brown</th>
                <th>Silver</th>
                <th>Gold</th>
                <th>Diamond</th>
            </tr>
            <tr>
                <td><p class="big">Brown</p><br>회원가입시<hr></td>
                <td><p class="big">Silver</p><br>100포인트 적립시<hr></td>
                <td><p class="big">Gold</p><br>5만 포인트 적립시<hr></td>
                <td><p class="big">Diamond</p><br>20만 포인트 적립시<hr></td>
            </tr>
            <tr>
                <td>회원 전용 패키지<br>포인트 적립<p class="small-info">객실3%, 식품 1%</p></td>
                <td>회원 전용 패키지<br>포인트 적립<p class="small-info">객실3%, 식품 1%</p>
                    앱 쿠폰<p class="small-info">객실 1만p(연 1회/총 2매)</p>
                </td>
                <td>회원 전용 패키지<br>포인트 적립<p class="small-info">객실4%, 식품 1.5%</p>
                    앱 쿠폰<p class="small-info">객실 3만p(연 1회/총 1매)</p><p class="small-info">객실 업그레이드(등급 유효기간내 3회)</p>
                    <p class="small-info">3회중 1회는 스위틑 객실 제공</p>할인<p class="small-info">식음 할인 5%</p>기타<p class="small-info">
                        투숙 중 무료 세탁 서비스</p><p class="small-info">72시간 예약 개런티</p>
                    </td>
                <td>회원 전용 패키지<br>포인트 적립<p class="small-info">객실5%, 식품 2%</p>
                    앱 쿠폰<p class="small-info">객실 10만p(연 1회/총 1매)</p><p class="small-info">객실 업그레이드(등급 유효기간내 5회)</p>
                    <p class="small-info">3회중 1회는 스위틑 객실 제공</p>할인<p class="small-info">식음 할인 10%</p>기타<p class="small-info">
                        투숙 중 무료 세탁 서비스</p><p class="small-info">48시간 예약 개런티</p><p class="small-info">Early Check-in(12시)</p>
                        <p class="small-info">late Check-out(15시) (호텔 예약상황에 따라 다름)</p><p class="small-info">라운지 무료 이용(최대2인)</p>
                        <p class="small-info">초과 숙박 실적 이월</p>
                    </td>
            </tr>
        </table>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>