<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
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
/* ---------------------------------------------------------------------- */
/* .community-wrap {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 10000;
}

#community-modal {
	background-color: rgb(235, 242, 235);
	width: 800px;
}

.community-btn-wrap {
	width: 100%;
	display: flex;
	justify-content: center;
}

.community-btn-wrap2 {
	background-color: rgb(70, 147, 127);
	width: 100%;
	height: 50px;
	line-height: 50px;
	text-align: right;
}

.community-content>h2 {
	font-weight: 900;
	text-align: center;
	margin: 30px;
	line-height: 60px;
	font-size: 35px;
	color: rgb(70, 147, 127);
}

.community-content h4 {
	font-weight: 900;
	font-size: 25px;
	margin-top: 10px;
	margin-bottom: 20px;
}

.community-content h4>img {
	width: 25px;
	margin-right: 10px;
}

.community-btn-wrap a {
	margin: 20px;
	padding: 10px;
	width: 100px;
} */
</style>
<body>
	<footer class="footer" style="border-top: solid 1px black">
		<div class="container" style="overflow:hidden;margin-bottom: 30px;">
			<div style="overflow:hidden;" class="row">
				
				<div style="text-align: right;" >
					<ul class="list-unstyled pe-5" style="float: left;font-size: large;">고객센터
						<li ><a href="/noticeList.do?reqPage=1" style="color:#737373;font-size:15px;">공지사항</a></li>
						<li><a href="/n_counsel.do" style="color:#737373;font-size: 15px;">1:1문의</a></li>
						<li><a href="/faq.do?category=7" style="color:#737373;font-size: 15px;">자주묻는 질문</a></li>
						<li><a href="/develomintIntro.do" style="color:#737373;font-size: 15px;">회사소개</a></li>
					</ul>
					<ul class="list-unstyled pe-5" style="float: left;font-size: large;">
						<li ><a href="/recruitTeamMember_mainPage.do?reqPage=1" style="color:black;">팀프로젝트 팀원모집</a></li>
						<li><a href="/gosuMain.do" style="color:black;">'고수'의 노하우</a></li>
						<li><a href="/shareList.do?reqPage=1&type=1" style="color:black;">개발지식공유</a></li>
						<li><a href="/jobSearchList.do?reqPage=1" style="color:black;">구인구직</a></li>
						<li><a href="/contestMain.do" style="color:black;">공모전</a></li>
					</ul>
					<a href="/"><img src="/resources/img/logo/Develomint_logo.png"></a><br>
					<span><a href="javascript:void(0);" style="color:black;">이용약관</a> <a href="javascript:void(0);" style="color:black;">개인정보취급방침</a> <a href="javascript:void(0);" style="color:black;">사업자 정보확인</a></span>
					<p>대표이사 | 이윤수</p>
					<p>대표주소 | 서울특별시 영등포구 선유동2로 57 이레빌딩 (구관) 19F, 20F</p>
					<p>전화번호 | 02-2163-8560</p>
					<p>Copyrightⓒ 2021.<span style="color: #4ecdc4;"><span style="color: #2980b9;">Develo</span>Mint</span> .All right reserved</p>
				</div>
			</div>
			<!-- <div class="community-wrap" style="display: none; margin: 0;">
			<div id="community-modal">
				<div class="community-content">
					<br>
		
					<h2>
						디벨로민트를 이용하는 <br> <span style="color: black;">회원을 위한 </span>
						커뮤니티 가이드
					</h2>
					<div class="g-style c-style">
		
						<div style="text-align: left;">
							<h4>
								<img src="/resources/img/gosu/cum_chk.png">스팸 및 현혹 행위
							</h4>
							디벨로민트 커뮤니티는 신뢰를 바탕으로 구축된 커뮤니티입니다. 다른 사용자를 상대로 사기, 현혹, 스팸, 사취하려는
							의도가 있는 댓글은 디벨로민트에서 허용되지 않습니다.<br> <br>
							<h4>
								<img src="/resources/img/gosu/cum_chk.png">잘못된 정보
							</h4>
							오해의 소지가 있거나 사기성 정보로 큰 피해를 입힐 심각한 위험이 있는 특정 유형의 게시글 혹은 댓글은 디벨로민트에서
							허용되지 않습니다. 여기에는 유해한 치료제나 치료법을 홍보하는 게시글 혹은 댓글, 기술적으로 조작된 특정 유형의
							게시글, 민주적 절차를 방해하는 댓글 등 실제적인 위험을 초래할 수 있는 특정 유형의 잘못된 정보가 포함됩니다.<br>
							<br>
							<hr>
							다음 규칙을 반드시 준수해 주시기 바랍니다. 디벨로민트 플랫폼 안팎에서 회원의 행위가 디벨로민트 사용자, 커뮤니티,
							직원이나 생태계에 해를 끼치는 경우 디벨로민트는 회원 행위의 과실이 얼마나 심각한지, 유해한 행위에 패턴이 존재하는지
							여부를 포함하나 이에 국한되지 않는 다양한 요소를 고려하여 대처할 수 있습니다. 디벨로민트는 회원의 권한 정지부터 계정
							해지에 이르기까지 다양한 조치를 취합니다.
		
						</div>
					</div>
				</div>
				<div class="community-btn-wrap">
					<a id="community-close" class="btn btn-outline-success">확인</a>
				</div>
				<div class="community-btn-wrap2">
					<span style="color: white; margin: 20px;">2021.12.19</span>
				</div>
			</div>
			</div> -->
		</div>
		<script type="text/javascript">
			$("#community-guide").click(function() {
	
				$(".community-wrap").css("display", "flex");
	
			});
			$("#community-close").click(function() {
	
				$(".community-wrap").css("display", "none");
	
			});
		</script>
</footer>
</body>
</html>