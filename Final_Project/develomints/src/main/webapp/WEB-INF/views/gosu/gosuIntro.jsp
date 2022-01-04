<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
</head>
<style>
.container * {
	text-decoration: none;
	color: black;
}

.container>h1 {
	display: flex;
	justify-content: center;
	margin-top: 50px;
	font-size: 55px;
	font-weight: 900;
}

.container {
	min-width: 1200px;
}

.line {
	background-color: #00c7ae;
	height: .125rem;
	width: 25rem;
	margin: 0 auto;
	margin-top: 50px;
}

.back-img {
	background: url("/resources/img/gosu/soomgo_mission.jpg");
	background-size: 100% 100%;
	background-position: center;
	background-repeat: no-repeat;
	height: 300px;
	display: flex;
	flex-direction: column;
	align-items: left;
	justify-content: center;
}

.back-img>h2 {
	color: white;
	margin: 50px;
}

.container>h3 {
	margin-top: 50px;
	font-size: 55px;
	font-weight: 900;
}

.g-center {
	display: flex;
	justify-content: center;
	margin: 50px;
	top: 200px;
}

.g-between {
	display: flex;
	justify-content: space-around;
	top: 200px;
}

.g-between>img {
	width: 50%;
}

.container-fluid{
	padding-left: 0 !important;
}
.bg-light{
	background-color: white !important;
	--bs-bg-opacity :0 !important;
}


html, body {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
}

.g-box {
	width: 100%;
	height: 100%;
	position: relative;
	padding:150px;
	padding-top: 250px;
}

.down-wrap {
	position: fixed;
	z-index: 1000;
		margin-top: 25%;
	margin-left: 1400px;
}

.down-img {
	text-align: center;
	justify-content: right;
}

.down-img>img {
	width: 30px;
	animation: motion 0.3s linear 0s infinite alternate;
	margin-top: 0;
}
.g-img{
	width: 300px;
	
	box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);
	margin:50px;
	border-radius: 30px;

}

#g-up-img:hover{

-webkit-transform: scale(1.5);
    transform: scale(1.5);
}
@keyframes motion 
{ 0% {margin-top: 0px;}
100%{margin-top:10px;}}
</style>
<body>
	<div class="container" style="margin-top: 0;">

		<div class="g-box"style="padding: 0;">
			<%@include file="/WEB-INF/views/common/header.jsp"%>

			
			<h1 style="text-align: center;margin-top:250px;font-size: 50px; font-weight: 900;"><br>
				<span
					style="color: rgb(78, 205, 196);">고수의 노하우</span>는 어떤 곳인가요?
			</h1>
				<h1 style="text-align: center; font-size: 30px; color:gray;"><br>
				고수회원과 일반회원을 위한 페이지 이용안내
			</h1>
			<div class="down-wrap">
				<div class="down-img">
					<img src="/resources/img/gosu/downdown.png">
				</div>
				<div class="down-img" style="display: none;">
					<img src="/resources/img/gosu/downdown2.png" id="g-up-img">
				</div>
			</div>
		</div>
		<div class="g-center g-box" style="padding-top:400px;">
			<div class="line"></div>
			<div  style="" >
				<h1 style="text-align: center;font-size: 50px; font-weight: 900;color: rgb(78, 205, 196);">요청서
			
			</h1>
			</div>
			<div class="line" style="margin: 0;"></div>
			

		</div>
		<div class="g-center g-box" >
			<div  style="" ><br><br><br>
				<h3 style=" width: 100%;  font-size: 35px;color:rgb(78, 205, 196);font-weight: 900;">01<br><br>
				<span>고객의 요청을 무료로 보내드려요.</span></h3><br><br>
				<ul>
					<li>고객은 도움이 필요한 서비스에 대해서 요청서를 작성해요.</li>
					<li>요청을 고수님께 무료로 보내드려요.</li>
				</ul>
			</div>
			<div><br><br><br>
					<img class="g-img" src="/resources/img/gosu/gosu_img1.PNG">
			</div>

		</div>

	<div class="g-center g-box" >
			<div  style="" ><br><br><br>
				<h3 style=" width: 100%;  font-size: 35px;color:rgb(78, 205, 196);font-weight: 900;">02<br><br>
				<span>답변을 보낼 고객을 선택하세요.</span></h3><br><br>
				<ul>
				<li>고객의 개발 요청을 알려드려요.</li>
					<li>고객에게 견적을 보낸 후 고용의 기회를 잡아보세요.</li>
					
				</ul>
			</div>
			<div><br><br><br>
					<img class="g-img" src="/resources/img/gosu/gosu_img2.JPG">
			</div>

		</div>

	<div class="g-center g-box" >
			<div  style="" ><br><br><br>
				<h3 style=" width: 100%;  font-size: 35px;color:rgb(78, 205, 196);font-weight: 900;">03<br><br>
				<span>맞춤 견적을 보내세요.</span></h3><br><br>
				<ul>
				<li>고객의 개발 요청에 맞춰 견적금액과 견적설명을 적으세요.</li>
					<li>고객은 내 프로필과 견적을 볼 수 있습니다.</li>
					
				</ul>
			</div>
			<div><br><br><br>
					<img class="g-img" src="/resources/img/gosu/gosu_img3.JPG">
			</div>

		</div>
		<div class="g-center g-box" >
			<div  style="" ><br><br><br>
				<h3 style=" width: 100%;  font-size: 35px;color:rgb(78, 205, 196);font-weight: 900;">04<br><br>
				<span>고객과 빠르게 연락하세요.</span></h3><br><br>
				<ul>
				<li>채팅으로 고객과 상담하세요.</li>
					<li>고객이 쓴 개발 요청서 정보를 꼼꼼히 확인하고 상담에 활용하면 더욱 좋습니다.</li>
					<li>개발이 끝난 후 고수가 채팅을 마치면 후기를 남겨주세요.</li>
					
				</ul>
			</div>
			<div><br><br><br>
					<img class="g-img" src="/resources/img/gosu/gosu_img4.JPG">
			</div>

		</div>
		<div class="g-center g-box" style="padding-top:400px;">
			<div class="line"></div>
			<div  style="" >
				<h1 style="text-align: center;font-size: 50px; font-weight: 900;color: rgb(78, 205, 196);">피드백
			
			</h1>
			</div>
			<div class="line" style="margin: 0;"></div>
			

		</div>
<div class="g-center g-box" >
			<div  style="" ><br><br><br>
				<h3 style=" width: 100%;  font-size: 35px;color:rgb(78, 205, 196);font-weight: 900;">01<br><br>
				<span>고수 소개 글에서 신청하세요.</span></h3><br><br>
				<ul>
					<li>고수 소개 글 아래에서 피드백 신청을 할 수 있어요.</li>
					<li>결제를 진행해야 해요.</li>
				</ul>
			</div>
			<div><br><br><br>
					<img class="g-img" src="/resources/img/gosu/gosu_img5.JPG">
			</div>

		</div>

	<div class="g-center g-box" >
			<div  style="" ><br><br><br>
				<h3 style=" width: 100%;  font-size: 35px;color:rgb(78, 205, 196);font-weight: 900;">02<br><br>
				<span>결제를 통해 피드백을 신청하세요.</span></h3><br><br>
				<ul>
					<li>고객은 도움이 필요한 서비스에 대해서 제목과 내용을 작성해요.</li>
					<li>결제를 하면 고수와 매칭되어 피드백이 시작됩니다.</li>
					
				</ul>
			</div>
			<div><br><br><br>
					<img class="g-img" src="/resources/img/gosu/gosu_img6.JPG">
			</div>

		</div>

	<div class="g-center g-box" >
			<div  style="" ><br><br><br>
				<h3 style=" width: 100%;  font-size: 35px;color:rgb(78, 205, 196);font-weight: 900;">03<br><br>
				<span>채팅으로 연락하세요.</span></h3><br><br>
				<ul>
				<li>상단에 피드백내용을 확인할 수 있어요.</li>
				<li>피드백이 끝난 후 고수가 채팅을 마치면 별점리뷰를 남겨주세요.</li>
				</ul>
			</div>
			<div><br><br><br>
					<img class="g-img" src="/resources/img/gosu/gosu_img7.JPG">
			</div>

		</div>
		


		<div class="g-box">
			<br> <br> <br> <br> <br> <br>
			<h1 style="font-size: 50px; line-height: 90px; ">
				당신에게 맞는<br>고수를 찾아보세요! 
			</h1>
		</div>

		<div class="g-box">
			<div class="line" style="margin-bottom: 50px;"></div>
			<h1 style="font-size: 50px; line-height: 90px;text-align: center;">
				<a href="/gosuMain.do" style="color:rgb(78, 205, 196);font-weight: 900;">고수의 노하우</a> 바로가기
			</h1><div class="line"style="margin-bottom: 50px;"></div>
		</div>
	</div>
	<script>
	
	$(function(){
		 $('#g-up-img').bind('click', function() {
			    $('html, body').animate({scrollTop: '0'}, 300);
		  });
		
	})
		$(".g-box").each(function() {

			// 개별적으로 Wheel 이벤트 적용 mousewheel(IE/chrome/opera) DOMMouseScroll(FF)
			$(this).on("mousewheel DOMMouseScroll", function(e) {
				e.preventDefault();
				var delta = 0;
				/* IE */
				if (!event)
					event = window.event;
				//휠에 대한 정보 얻기 파이어폭스 외 IE/Chrome/Opera = wheelDelta
				if (event.wheelDelta) {
					delta = event.wheelDelta / 50;
					//평균 50~120 사이로 요소의 인식높이에 따라 다름(한 화면(height100%)기준일떄는 120
					if (window.opera)
						delta = -delta;
					//휠에 대한 정보 얻기 Mozilla FF = detail
				} else if (event.detail)
					delta = -event.detail / 3;
				var moveTop = null;
				// 마우스휠을 위에서 아래로
				if (delta < 0) {
					if ($(this).next().length == 0) {
						$(".down-img").eq(0).css("display","none");
						$(".down-img").eq(1).css("display","flex");
						moveTop = 0;
						return;
					}
					if ($(this).next() != undefined) {

						$(".down-img").eq(0).css("display","flex");
						$(".down-img").eq(1).css("display","none");
						moveTop = $(this).next().offset().top;
					}
					
					// 마우스휠을 아래에서 위로
				} else {

					if ($(this).prev() != undefined) {

						moveTop = $(this).prev().offset().top;
						$(".down-img").eq(0).css("display","flex");
						$(".down-img").eq(1).css("display","none");
					}
				}

				// 화면 이동 0.8초(800)
				$("html,body").stop().animate({
					scrollTop : moveTop + 'px'

				}, {
					duration : 100,
					complete : function() {
					}
				});

			});
		});
	</script>
</body>
</html>