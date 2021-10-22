
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- 폰트어썸(아이콘) -->
	<link rel="stylesheet" href="/fontawesome/css/all.css">
	<script type="text/javascript" src="/fontawesome/js/all.js"></script>
	<!-- 부트스트랩 CSS -->
	<link rel="stylesheet" href="/css/bootstrap.css">

	<!-- 기본 CSS -->
	<link rel="stylesheet" href="/css/default.css">
	
	<!-- jQuery라이브러리 추가(2개) -->
	<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
	<!-- 부트스트랩용 jQuery -->
	<script type="text/javascript" src="/js/bootstrap.bundle.min.js"></script>
	<script>
            $(function(){
                $(".s-main-menu li").mouseenter(function(){
                    $(".main-content").css("margin-top","50px");
                });
                $(".s-main-menu li").mouseleave(function(){
                    $(".main-content").css("margin-top","10px");
                });
            });
    
     </script>
	
    <div class="s-wrapper">
        <header class="header">
            <div class="head-top">
                <ul>
                    <li class="s-main-res"><a href="#">예약하기</a></li>
                    <li class="tourguide"><a href="#">투어가이드</a></li>
                    <li style="width: 800px;"><a href="/" class="logo">STAY WITH</a></li>
                    <li class="main-login-btn"><a href="/WEB-INF/views/member/login.jsp">로그인</a></li>
                    <li class="main-join-btn"><a href="/join.jsp">회원가입</a></li>
                </ul>
            </div>
            <div class="main-navi">
                <div class="s-main-menu">
                    <ul>
                        <li><a href="#"><span>객실</span></a>
                            <ul class="s-sub-menu" >
                                <li><a href="#"><span>전체 객실보기</span></a></li>
                                <li><a href="#"><span>이그제큐티브</span></a></li>
                                <li style="border-right: none;"><a href="#"><span>스위트</span></a></li>
                            </ul>
                        </li>
                        <li><a href="#"><span>다이닝</span> </a>
                            <ul class="s-sub-menu">
                                <li><a href="#"><span>레스토랑</span></a></li>
                                <li><a href="#"><span>라운지&바</span></a></li>
                                <li style="border-right: none;"><a href="#"><span >베이커리</span></a></li>
                            </ul>
                        </li>
                        <li><a href="#"><span>소개</span></a> 
                            <ul class="s-sub-menu">
                                <li><a href="#"><span>호텔소개</span></a></li>
                                <li><a href="#"><span>멤버십 정보</span></a></li>
                                <li style="border-right: none;"><a href="#"><span>오시는 길</span></a></li>
                            </ul>
                        </li>
                        <li><a href="#"><span style="border-right: none;">고객센터</span> </a>
                            <ul class="s-sub-menu">
                                <li><a href="#"><span>공지사항</span></a></li>
                                <li><a href="#"><span>1:1문의</span></a></li>
                                <li style="border-right: none;"><a href="#"><span >FAQ</span></a></li>
                            </ul>
                        </li>
                        <li><a href="#"><span style="border-right: none;"class="main-lifestyle">라이프스타일</span> </a>
                            <ul class="s-sub-menu main-lifestyle-menu" >
                                <li><a href="#"><span>야외 수영장</span></a></li>
                                <li><a href="#"><span>스파</span></a></li>
                                <li><a href="#"><span>피트니스</span></a></li>
                                <li><a href="#"><span>산책로</span></a></li>
                                <li style="border-right: none;"><a href="#"><span>쇼핑</span></a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </header>
        
        