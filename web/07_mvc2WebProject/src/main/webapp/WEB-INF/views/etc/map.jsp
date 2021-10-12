<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=auntzn5l42&submodules=geocoder"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container">
		<h3>1. 다음 주소찾기 API</h3>
		<div>
			<input type="text" id="postCode" class="short form-control" readonly>
			<button onclick="addrSearch();" class="btn btn-primary">주소검색</button>
		</div>
		<div>
			<input type="text" id="roadAddr" class="form-control" placeholder="도로명주소">
		</div>
		<div>
			<input type="text" id="jibunAddr" class="form-control" placeholder="지번주소">
		</div>
		<div>
			<input type="text" id="detailAddr" class="form-control" placeholder="상세주소">
		</div>
		<hr>
		<h3>2. 네이버지도 API</h3>
		<div id="map" style="width:100%; height:500px;"></div>
	</div>
	<script>
	window.onload = function(){
		// 아무 설정없이 지도 객체를 만드는 경우 서울시청이 중심
		// var map = new naver.maps.Map("map");	
		var map = new naver.maps.Map("map", {
			center : new naver.maps.LatLng(37.5399775,126.847459),
			zoom : 17,
			zoomControl : true,
			zoomControlOptions : {
				position : naver.maps.Position.TOP_RIGHT,
				style : naver.maps.ZoomControlStyle.SMALL
			}
		});
		var marker = new naver.maps.Marker({
			position : new naver.maps.LatLng(37.5399775,126.847459),
			map : map
		});
		var contentString = [
			"<div class='iw_inner'>",
			"	<h3>집</h3>",
			"	<p>서울시 강서구 초록마을로18길 25-16</p>",
			"</div>"
		].join("");
		var infoWindow = new naver.maps.InfoWindow();
		naver.maps.Event.addListener(marker, "click", function(e){
			if(infoWindow.getMap()){	// infoWindow가 지도에 존재하면
				infoWindow.close();		// infoWindow 닫기
			} else {	// infoWindow가 지도에 존재하지 않으면
				// 미리 만들어둔 주소로 infoWindow를 새로 생성
				infoWindow = new naver.maps.InfoWindow({
					content : contentString
				});
				// 생성된 infoWindow를 map의 marker위치에 생성
				infoWindow.open(map, marker);
			}
		});
		naver.maps.Event.addListener(map,"click",function(e){
			marker.setPosition(e.coord);		// 마커위치를 클릭한 위치로 이동
			if(infoWindow.getMap()){
				infoWindow.close();
			}
			naver.maps.Service.reverseGeocode({
				location : new naver.maps.LatLng(e.coord.lat(), e.coord.lng())
			}, function(status,response){
				if(status != naver.maps.Service.Status.OK){
					return alert("주소를 찾을 수 없습니다.");
				}
				var result = response.result;
				var items = result.items;
				var address = items[1].address;
				contentString = [
					"<div class='iw_inner'>",
					"<p>"+address+"</p></div>"
				].join("");
			});
		});
	}
	function addrSearch(){
		new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            $("#postCode").val(data.zonecode);
	            $("#roadAddr").val(data.roadAddress);
	            $("#jubunAddr").val(data.jibunAddress);
	            $("#detailAddr").focus();
	        }
	    }).open();
	}
</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>