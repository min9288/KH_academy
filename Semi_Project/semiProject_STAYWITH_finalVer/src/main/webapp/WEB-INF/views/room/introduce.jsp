<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/room.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp"%>
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
        <h2 id="h_hotel">STAY WITH 호텔</h2>
        <div id="line2"></div><br>
          <img id="h_img" src="img/bg-3.jpg">
      <div class="h_introduce">
          <div class="h_left">
          <span><b>Urban Lifestyle Hotel</b></span>
          <p>한국의 세련미와 럭셔리함을 동시에 갖춘 명문호텔
                        스테이호텔은 세계최고의 어번(Urban)라이프 스타일
                         호텔로 고객들에게 최고급 Hospitality 서비스를 제공합니다.</p> 
           <p>한국을 대표하는 럭셔리 호텔로서 
           '또 다른 여행공간'이라는 컨셉을 새롭게 선보이며 휴식은 물론 고급 식문화,쇼핑,피트니스,산책로 등
                       고객의 니즈를 위한 라이프 스타일 공간을  제공하고 있습니다.</p> 
          </div>
          <div class="h_right">
           <span><b> A Leading Global Property</b></span>
          <p>세계 럭셔리 한 호텔들과 어깨를 나란히 하고 있는 스테이호텔은 고객 한분 한분 배려하는 기품있는 서비스로
          세계 각국의 수반들과 외교,경제,문화등의 분야의 명사로부터 찬사를 받고 있으며 매년 한국의 최고 호텔 중 하나로 선정되고 있습니다.</p> 
           <p>Stay With는 '함께 머문다'라는 뜻으로 공동체적인 삶을 추구하고,'내 가족이 머문다'라는 마음으로 편히 쉴수 있는 공간을 생각하며 설립되었습니다.
              내집과 같은 편안함을 추구하면서도 색다른 느낌을 더해 여행온 듯한 기분을 드리고 싶었습니다.저희 스테이 호텔에서 즐거운 휴식 보내시길 바랍니다.</p>
        </div>
      </div>

    </div>
</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
<script>
	$(function(){
		$(".subnavi>li:first>a").css("background-color","#d6c6a5");
		$(".subnavi>li:first>a").children().show();
	});
</script>
</html>