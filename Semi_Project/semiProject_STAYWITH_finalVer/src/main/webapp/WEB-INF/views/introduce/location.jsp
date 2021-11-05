<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=jrmcx76uns"></script>
<link rel="stylesheet" href="/css/location.css">
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
		                    <li><a href="/membership">멤버십 정보<span>&gt;</span></a></li>
		                    <li><a href="/location">오시는 길<span>&gt;</span></a></li>
		                </ul>
		            </li>
		        </ul>
		    </div>
            <div class="main-content">
                <div class="main-title">
                    <h2>오시는 길</h2>
                </div>
                <div id="map"></div>
                <div class="addr-box">
                	<p>STAYWITH호텔 주소 : 서울시 영등포구 선유로 57, 이레빌딩</p>
                	<p><span>대표전화</span> 02-1544-9970</p>
                </div>
                <div class="root-box">
                	<div>
                		<h4>버스</h4>
                		<div>
                			<p><span>선유고등학교/(구)강서세무서</span></p>
                			<p>
                				<img src="/img/sub01_06_busB.jpg"><span>7612</span>
                				<img src="/img/sub01_06_busR.jpg"><span>1000 / 1200 / 1300 / 1301 / 1302 / 1400 / 1500 / 1601 / M6628 / M6724</span>
                			</p>
                			<p><span>당산역</span></p>
                			<p>
                				<img src="/img/sub01_06_busB.jpg"><span>602 / 760 / 5620 / 5714 / 6514 / 6623 / 6631</span>
                			</p>
                		</div>
                	</div>
                	<div>
                		<h4>지하철</h4>
                		<p>지하철 2,9호선 당산역 12번 출구 400m</p>
                	</div>
                </div>
            </div>
        </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
	window.onload = function(){
		var map = new naver.maps.Map("map",{
			center : new naver.maps.LatLng(37.533837,126.896836),
			zoom : 17,
			zoomControl : true,
			zoomControlOptions : {
				position : naver.maps.Position.TOP_LEFT,
				style : naver.maps.ZoomControlStyle.SMALL
			}
		});
		var marker = new naver.maps.Marker({
			position : new naver.maps.LatLng(37.533837,126.896836),
			map : map
		});
		var contentString = [
			"<div class='iw_inner'>",
			"  <h2>STAYWITH</h2>",
			"  <p>서울시 영등포구 선유로 57</p>",
			"</div>"
		].join("");
		var infoWindow = new naver.maps.InfoWindow({
			content : contentString,
			borderWidth:2,
			disableAnchor: true,
			pixelOffset: new naver.maps.Point(0, -10)
		});
		naver.maps.Event.addListener(marker,"click",function(e){
			if(infoWindow.getMap()){
				infoWindow.close();
			}else{
				infoWindow.open(map,marker);
			}
		});
		infoWindow.open(map,marker);
		$(".subnavi>li:last>a").css("background-color","#d6c6a5");
		$(".subnavi>li:last>a").children().show();
	}
</script>
</html>