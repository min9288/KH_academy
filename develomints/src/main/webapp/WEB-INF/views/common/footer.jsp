<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#footer {
    margin: 5em 0;
}

.row span {
  position: relative;
  margin: 0;
  font-size: 20px;
  line-height: 20px;
}
.row span::before,
.row span::after {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  content: attr(data-text);
}
.row span::before {
  color: purple;
  z-index: -1;
  animation: glitch01 3s ease infinite;
}
.row span::after {
  color: cyan;
  z-index: -2;
  animation: glitch02 3s ease infinite reverse;
}
@keyframes glitch01 {
  0% {
    transform: translate(-2px, 2px);
  }
  25% {
    transform: translate(-4px, 4px);
  }
  50% {
    transform: translate(2px, 2px);
  }
  75% {
    transform: translate(2px, -4px);
  }
  100% {
    transform: translate(-2px, 2px);
  }
}
@keyframes glitch02 {
  0% {
    transform: translate(-2px, 2px);
  }
  25% {
    transform: translate(-4px, 4px);
  }
  50% {
    transform: translate(2px, 2px);
  }
  75% {
    transform: translate(2px, -4px);
  }
  100% {
    transform: translate(-2px, 2px);
  }
}
.row p{
	margin-bottom: 0;
	color: #737373;
	font-size: small;
}
.list-unstyled li a{
	text-decoration: none;
}
</style>
<body>
	<footer class="footer" style="border-top: solid 1px black">
		<div class="container" style="overflow:hidden;margin-bottom: 30px;">
			<div style="overflow:hidden;" class="row">
				
				<div style="text-align: right;" >
					<ul class="list-unstyled pe-5" style="float: left;font-size: large;">고객센터
						<li ><a href="/noticeList.do?reqPage=1" style="color:#737373;font-size:15px;">공지사항</a></li>
						<li><a href="/n_counsel.do" style="color:#737373;font-size: 15px;">1:1문의</a></li>
						<li><a href="/develomintIntro.do" style="color:#737373;font-size: 15px;">회사소개</a></li>
					</ul>
					<ul class="list-unstyled pe-5" style="float: left">
						<li ><a href="/recruitTeamMember_mainPage.do?reqPage=1" style="color:black;">팀프로젝트 팀원모집</a></li>
						<li><a href="/gosuMain.do" style="color:black;">'고수'의 노하우</a></li>
						<li><a href="/shareList.do?reqPage=1&type=1" style="color:black;">개발지식공유</a></li>
						<li><a href="/jobSearchList.do" style="color:black;">구인구직</a></li>
						<li><a href="/contestMain.do" style="color:black;">공모전</a></li>
					</ul>
					<a href="/"><img src="/resources/img/logo/Develomint_logo.png"></a><br>
					<span><a href="#" style="color:black;">이용약관</a> <a href="#" style="color:black;">개인정보취급방침</a> <a href="#" style="color:black;">사업자 정보확인</a></span>
					<p>대표이사 | 이윤수</p>
					<p>대표주소 | 서울특별시 영등포구 선유동2로 57 이레빌딩 (구관) 19F, 20F</p>
					<p>전화번호 | 02-2163-8560</p>
					<p>Copyrightⓒ 2021.<span>DeveloMint</span> .All right reserved</p>
				</div>
			</div>
		</div>
</footer>
</body>
</html>