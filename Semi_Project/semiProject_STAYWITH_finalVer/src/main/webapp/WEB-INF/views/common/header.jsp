<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<!-- 부트스트랩 CSS -->
	<link rel="stylesheet" href="/css/bootstrap.css">

	<!-- 기본 CSS -->
	<link rel="stylesheet" href="/css/header&footer.css">
	<link rel="stylesheet" href="/css/default.css">
	
	<!-- jQuery라이브러리 추가(2개) -->
	<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
	<!-- 부트스트랩용 jQuery -->
	<script type="text/javascript" src="/js/bootstrap.bundle.min.js"></script>
	
    <div class="s-wrapper">
        <header class="header">
            <div class="head-top">
                <ul>
                    <li class="s-main-res" id="s-main-res"><a href="#">예약하기</a></li>
                    <li class="tourguide"><a href="/tourguide">투어가이드</a></li>
                    <li style="width: 800px;"><a href="/" class="logo">STAY WITH</a></li>
                  	<c:if test="${empty sessionScope.m}">
	                    <li class="main-login-btn"><a href="/loginFrm">로그인</a></li>
	                    <li class="main-join-btn"><a href="/joinFrm">회원가입</a></li>
					</c:if>
					<c:if test="${not empty sessionScope.m && sessionScope.m.memberLevel ne 1}">
	                    <li class="main-login-btn"><a href="/myInfoFrm">마이페이지</a></li>
	                    <li class="main-join-btn"><a href="/logout">로그아웃</a></li>
	                </c:if>
					<c:if test="${not empty sessionScope.m && sessionScope.m.memberLevel eq 1}">
						<li class="main-login-btn"><a href="/adminMain">관리자</a></li>
	                    <li class="main-join-btn"><a href="/logout">로그아웃</a></li>			
					</c:if>
                </ul>
            </div>
            <div class="main-navi">
                <div class="s-main-menu">
                    <ul>
                        <li><a href="/allRoom2?reqPage=1"><span>객실</span></a>
                            <ul class="s-sub-menu" >
                                <li><a href="/allRoom2?reqPage=1"><span>전체 객실보기</span></a></li>
                                <li><a href="/selectType2?roomType=스탠다드&reqPage=1"><span>스탠다드</span></a></li>
                                <li><a href="/selectType2?roomType=이그제큐티브&reqPage=1"><span>이그제큐티브</span></a></li>
                                <li style="border-right: none;"><a href="/selectType2?roomType=스위트&reqPage=1"><span>스위트</span></a></li>
                            </ul>
                        </li>
                        <li><a href="/diningMain"><span>다이닝</span></a>
                            <ul class="s-sub-menu">
                                <li><a href="/diningTypeSel?diningType=1"><span>레스토랑</span></a></li>
                                <li><a href="/diningTypeSel?diningType=2"><span>라운지&amp;바</span></a></li>
                                <li style="border-right: none;"><a href="/diningTypeSel?diningType=3"><span >베이커리</span></a></li>
                            </ul>
                        </li>
                        <li><a href="/introHotel"><span>소개</span></a> 
                            <ul class="s-sub-menu">
                                <li><a href="/introHotel"><span>호텔소개</span></a></li>
                                <li><a href="/membership"><span>멤버십 정보</span></a></li>
                                <li style="border-right: none;"><a href="/location"><span>오시는 길</span></a></li>
                            </ul>
                        </li>
                        <li><a href="/notice?reqPage=1"><span style="border-right: none;">고객센터</span> </a>
                            <ul class="s-sub-menu">
                                <li><a href="/notice?reqPage=1"><span>공지사항</span></a></li>
                                <li><a href="/question"><span>1:1문의</span></a></li>
                                <li style="border-right: none;"><a href="/faq"><span >FAQ</span></a></li>
                            </ul>
                        </li>
                        <li><a href="/lifestyleMenu"><span style="border-right: none;"class="main-lifestyle">라이프스타일</span> </a>
                            <ul class="s-sub-menu main-lifestyle-menu" >
                                <li><a href="/lifestyleSelectInfo?lfCategory=야외수영장"><span>야외수영장</span></a></li>
                                <li><a href="/lifestyleSelectInfo?lfCategory=스파"><span>스파</span></a></li>
                                <li><a href="/lifestyleSelectInfo?lfCategory=피트니스"><span>피트니스</span></a></li>
                                <li><a href="/lifestyleSelectInfo?lfCategory=산책로"><span>산책로</span></a></li>
                                <li style="border-right: none;"><a href="/lifestyleSelectInfo?lfCategory=쇼핑"><span>쇼핑</span></a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
               
        </header>
        <div class="hrm-wrap" style="display: none;">
                <div id="hrm-modal">
                    <h3>예약하기 <button type="button" id="hrm-close"><img src="/img/shrm_layerClose.png"></button> </h3>
                    <div class="hrm-btn-wrap">
                        <button type="button" id="head-res-modal">객실예약<br><img src="/img/rsv_hotell_search_img.jpg"></button>
                        <button type="button" id="head-dining-modal">다이닝예약<br><img src="/img/rsv_dining_search_img.jpg"></button>
                        <button type="button" id="head-fitness-modal">피트니스예약<br><img src="/img/rsv_hotell_search_img.jpg"></button>    
                    </div>
                </div>
            </div>
            <script>
            $(function(){
                $("#s-main-res").click(function(){
                    $(".hrm-wrap").css("display","flex");
                });
                $("#hrm-close").click(function(){
                    $(".hrm-wrap").css("display","none");
                });
            });
            $("#head-res-modal").click(function(){
            	location.href="/allRoom2?reqPage=1";
            });
            $("#head-dining-modal").click(function(){
            	location.href="/diningResvFrm";
            });
            $("#head-fitness-modal").click(function(){
            	location.href="/lifestyleMenu";
            });
            </script>