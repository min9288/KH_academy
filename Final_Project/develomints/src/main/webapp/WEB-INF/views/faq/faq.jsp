<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/notice/noticeList.css">
<link rel="stylesheet" href="/resources/css/notice/noticeHome.css">
</head>
<style>
	.faq_a{
		display: none;
		overflow: hidden;
	}
	.faq_q{
		overflow: hidden;
		cursor: pointer;
	}
	.index{
		display: flex;
		justify-content: center;
		float: left;
	}
</style>
<body>
<script>
$(function(){
	
	$(".faq_q").click(function(){
		$(this).next().toggle();
		/* $(".faq_a").css("display","block"); */
	});
});
</script>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container" style="margin-bottom: 50px;">
		<div class="area">
			<div class="nav-sub" style="margin-top: 30px;"><a href="/" class="text-hover">홈</a><span> > </span><a href="/noticehome.do" class="text-hover">고객센터</a><span> > </span><span>공지사항</span></div>
			<div class="title"><h2 style="color: #78c2ad;font-weight: bold;">CS Center</h2></div>
			<div class="center_tap">
				<ul style="margin-bottom: 0;">
					<li><span class="">Tel. 2163-8560</span><br><span class="last-span">평일 9:00~18:00(점심 12:00~13:00)</span></li>
					<li><a href="/n_counsel.do" class="text-hover">1:1 Q&A<br><span class="last-span">질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요.</span></a></li>
					<li><a href="/faq.do?category=7" class="text-hover">자주묻는질문<br><span class="last-span">자주묻는질문</span></a></li>
				</ul>
			</div>
			<div class="contents">
				<h3 class="title_cs font-mss">FAQ <span>자주 묻는 질문</span></h3>
				<!-- 탭버튼 -->
				<div class="center_tap3">
					<ul class="mypage_type">
		                <li><a href="/faq.do?category=7">로그인관련</a></li>
						<li><a href="/faq.do?category=8">고수 안내</a></li>
						<li><a href="/faq.do?category=9">환불관련</a></li>
						<li><a href="/faq.do?category=10">공모전관련</a></li>
						<li><a href="/faq.do?category=11">구인잡관련</a></li>
						<li><a href="/faq.do?category=12">커뮤니티관련</a></li>
						<li><a href="/faq.do?category=13">이용안내</a></li>
						<li><a href="/faq.do?category=14">팀프로젝트 관련</a></li>
						<li><a href="/faq.do?category=40">기타 문의</a></li>
						<li><a href="/faq.do?category=22">신고</a></li>
						<li><a href="/faq.do?category=21">기능/작동 오류</a></li>
						<li><a href="/faq.do?category=20">이벤트</a></li>
		            </ul>
				</div>
				<!-- //탭버튼 -->
				<!-- 콘텐츠 -->
				
				<div class="t" style="background-color: rgb(78, 205, 196); color: white; font-weight: 900; font-size: 16px;  padding: 8px;">
					<span>번호</span><span style="width: 1100px; margin-left: 700px;">내용</span>
				</div>
				<div class="d">
				<!-- 로그인관련 -->
					<c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 7 }">
					   		<div class="faq_q" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
						   		<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px; font-weight: 900;">${i.count }</p>
						   		<p style="background-color: white; color: black; display: inline-block; margin-bottom: 0px; font-weight: 900;">${c.faqQ }</p>
					   		</div>
					   		<div class="faq_a" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
				   				<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px;">답변</p>
				   				<p style="background-color: white; color: black; width: 1100px; display:inline-block; margin-bottom: 0px;">${c.faqA }</p>
				   			</div>
				   		</c:if>
				   </c:forEach>
				   <!-- 고수안내 -->
					<c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 8 }">
					   		<div class="faq_q" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
						   		<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px; font-weight: 900;">${i.count }</p>
						   		<p style="background-color: white; color: black; display: inline-block; margin-bottom: 0px; font-weight: 900;">${c.faqQ }</p>
					   		</div>
					   		<div class="faq_a" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
				   				<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px;">답변</p>
				   				<p style="background-color: white; color: black; width: 1100px; display:inline-block; margin-bottom: 0px;">${c.faqA }</p>
				   			</div>
				   		</c:if>
				   </c:forEach>
				   <!-- 환불관련 -->
					<c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 9 }">
					   		<div class="faq_q" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
						   		<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px; font-weight: 900;">${i.count }</p>
						   		<p style="background-color: white; color: black; display: inline-block; margin-bottom: 0px; font-weight: 900;">${c.faqQ }</p>
					   		</div>
					   		<div class="faq_a" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
				   				<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px;">답변</p>
				   				<p style="background-color: white; color: black; width: 1100px; display:inline-block; margin-bottom: 0px;">${c.faqA }</p>
				   			</div>
				   		</c:if>
				   </c:forEach>
				   <!-- 공모전관련 -->
					<c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 10 }">
					   		<div class="faq_q" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
						   		<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px; font-weight: 900;">${i.count }</p>
						   		<p style="background-color: white; color: black; display: inline-block; margin-bottom: 0px; font-weight: 900;">${c.faqQ }</p>
					   		</div>
					   		<div class="faq_a" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
				   				<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px;">답변</p>
				   				<p style="background-color: white; color: black; width: 1100px; display:inline-block; margin-bottom: 0px;">${c.faqA }</p>
				   			</div>
				   		</c:if>
				   </c:forEach>
				   <!-- 구인잡관련 -->
					<c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 11 }">
					   		<div class="faq_q" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
						   		<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px; font-weight: 900;">${i.count }</p>
						   		<p style="background-color: white; color: black; display: inline-block; margin-bottom: 0px; font-weight: 900;">${c.faqQ }</p>
					   		</div>
					   		<div class="faq_a" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
				   				<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px;">답변</p>
				   				<p style="background-color: white; color: black; width: 1100px; display:inline-block; margin-bottom: 0px;">${c.faqA }</p>
				   			</div>
				   		</c:if>
				   </c:forEach>
				   <!-- 커뮤니티관련 -->
					<c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 12 }">
					   		<div class="faq_q" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
						   		<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px; font-weight: 900;">${i.count }</p>
						   		<p style="background-color: white; color: black; display: inline-block; margin-bottom: 0px; font-weight: 900;">${c.faqQ }</p>
					   		</div>
					   		<div class="faq_a" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
				   				<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px;">답변</p>
				   				<p style="background-color: white; color: black; width: 1100px; display:inline-block; margin-bottom: 0px;">${c.faqA }</p>
				   			</div>
				   		</c:if>
				   </c:forEach>
				   <!-- 고수관련 -->
					<c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 13 }">
					   		<div class="faq_q" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
						   		<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px; font-weight: 900;">${i.count }</p>
						   		<p style="background-color: white; color: black; display: inline-block; margin-bottom: 0px; font-weight: 900;">${c.faqQ }</p>
					   		</div>
					   		<div class="faq_a" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
				   				<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px;">답변</p>
				   				<p style="background-color: white; color: black; width: 1100px; display:inline-block; margin-bottom: 0px;">${c.faqA }</p>
				   			</div>
				   		</c:if>
				   </c:forEach>
				   <!-- 팀프로젝트관련 -->
					<c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 14 }">
					   		<div class="faq_q" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
						   		<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px; font-weight: 900;">${i.count }</p>
						   		<p style="background-color: white; color: black; display: inline-block; margin-bottom: 0px; font-weight: 900;">${c.faqQ }</p>
					   		</div>
					   		<div class="faq_a" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
				   				<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px;">답변</p>
				   				<p style="background-color: white; color: black; width: 1100px; display:inline-block; margin-bottom: 0px;">${c.faqA }</p>
				   			</div>
				   		</c:if>
				   </c:forEach>
				   <!-- 기타문의 -->
					<c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 40 }">
					   		<div class="faq_q" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
						   		<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px; font-weight: 900;">${i.count }</p>
						   		<p style="background-color: white; color: black; display: inline-block; margin-bottom: 0px; font-weight: 900;">${c.faqQ }</p>
					   		</div>
					   		<div class="faq_a" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
				   				<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px;">답변</p>
				   				<p style="background-color: white; color: black; width: 1100px; display:inline-block; margin-bottom: 0px;">${c.faqA }</p>
				   			</div>
				   		</c:if>
				   </c:forEach>
				   <!-- 신고 -->
					<c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 22 }">
					   		<div class="faq_q" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
						   		<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px; font-weight: 900;">${i.count }</p>
						   		<p style="background-color: white; color: black; display: inline-block; margin-bottom: 0px; font-weight: 900;">${c.faqQ }</p>
					   		</div>
					   		<div class="faq_a" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
				   				<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px;">답변</p>
				   				<p style="background-color: white; color: black; width: 1100px; display:inline-block; margin-bottom: 0px;">${c.faqA }</p>
				   			</div>
				   		</c:if>
				   </c:forEach>
				   <!-- 기능/작동 오류 -->
					<c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 21 }">
					   		<div class="faq_q" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
						   		<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px; font-weight: 900;">${i.count }</p>
						   		<p style="background-color: white; color: black; display: inline-block; margin-bottom: 0px; font-weight: 900;">${c.faqQ }</p>
					   		</div>
					   		<div class="faq_a" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
				   				<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px;">답변</p>
				   				<p style="background-color: white; color: black; width: 1100px; display:inline-block; margin-bottom: 0px;">${c.faqA }</p>
				   			</div>
				   		</c:if>
				   </c:forEach>
				   <!-- 이벤트 -->
					<c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 20 }">
					   		<div class="faq_q" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
						   		<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px; font-weight: 900;">${i.count }</p>
						   		<p style="background-color: white; color: black; display: inline-block; margin-bottom: 0px; font-weight: 900;">${c.faqQ }</p>
					   		</div>
					   		<div class="faq_a" style="padding: 8px 10px; border-bottom: 1px solid rgb(78, 205, 196);">
				   				<p class="index" style="background-color: white; color: black; text-align: center; width: 100px; margin-bottom: 0px;">답변</p>
				   				<p style="background-color: white; color: black; width: 1100px; display:inline-block; margin-bottom: 0px;">${c.faqA }</p>
				   			</div>
				   		</c:if>
				   </c:forEach>
				</div>
				
				
				<%-- <table class="table table-primary">
				   <colgroup>
					   <col width="8%">
					   <col width="">
				   </colgroup>
				   <thead>
					   <tr class="table-primary">
						   <th>번호</th>
						   <th style="text-align: center;">내용</th>
					   </tr>
				   </thead>
				   <tbody>
				   
				   <!-- 로그인관련 -->
				   <c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 7 }">
					   		<tr class="faq_q">
						   		<th style="background-color: white; color: black; text-align: center;">${i.count }</th>
						   		<th style="background-color: white; color: black;">${c.faqQ }</th>
					   		</tr>
					   		<tr class="faq_a">
				   				<th style="background-color: white; color: black; text-align: center;">답변</th>
				   				<th style="background-color: white; color: black; width: 1100px;">${c.faqA }</th>
				   			</tr>
				   		</c:if>
				   </c:forEach>
				   
				   <!-- 고수 안내 -->
				   <c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 8 }">
					   		<tr class="faq_q">
						   		<th style="background-color: white; color: black; text-align: center;">${i.count }</th>
						   		<th style="background-color: white; color: black;">${c.faqQ }</th>
					   		</tr>
					   		<tr class="faq_a">
				   				<th style="background-color: white; color: black; text-align: center;">답변</th>
				   				<th style="background-color: white; color: black;"><p>${c.faqA }</p></th>
				   			</tr>
				   		</c:if>
				   </c:forEach>
				   
				   <!-- 환불관련 -->
				   <c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 9 }">
					   		<tr class="faq_q">
						   		<td style="background-color: white; color: black; text-align: center;">${i.count }</td>
						   		<td style="background-color: white; color: black;">${c.faqQ }</td>
					   		</tr>
					   		<tr class="faq_a">
				   			<td style="background-color: white; color: black; text-align: center;">답변</td>
				   			<td style="background-color: white; color: black;"><p>${c.faqA }</p></td>
				   		</tr>
				   		</c:if>
				   </c:forEach>
				   
				   <!-- 공모전관련 -->
				   <c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 10 }">
					   		<tr class="faq_q">
						   		<td style="background-color: white; color: black; text-align: center;">${i.count }</td>
						   		<td style="background-color: white; color: black;">${c.faqQ }</td>
					   		</tr>
					   		<tr class="faq_a">
				   			<td style="background-color: white; color: black; text-align: center;">답변</td>
				   			<td style="background-color: white; color: black;"><p>${c.faqA }</p></td>
				   		</tr>
				   		</c:if>
				   </c:forEach>
				   
				   <!-- 구인잡관련 -->
				   <c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 11 }">
					   		<tr class="faq_q">
						   		<td style="background-color: white; color: black; text-align: center;">${i.count }</td>
						   		<td style="background-color: white; color: black;">${c.faqQ }</td>
					   		</tr>
					   		<tr class="faq_a">
				   			<td style="background-color: white; color: black; text-align: center;">답변</td>
				   			<td style="background-color: white; color: black;"><p>${c.faqA }</p></td>
				   		</tr>
				   		</c:if>
				   </c:forEach>
				   
				   <!-- 커뮤니티관련 -->
				   <c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 12 }">
					   		<tr class="faq_q">
						   		<td style="background-color: white; color: black; text-align: center;">${i.count }</td>
						   		<td style="background-color: white; color: black;">${c.faqQ }</td>
					   		</tr>
					   		<tr class="faq_a">
				   			<td style="background-color: white; color: black; text-align: center;">답변</td>
				   			<td style="background-color: white; color: black;"><p>${c.faqA }</p></td>
				   		</tr>
				   		</c:if>
				   </c:forEach>
				   
				   <!-- 고수관련 -->
				   <c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 13 }">
					   		<tr class="faq_q">
						   		<td style="background-color: white; color: black; text-align: center;">${i.count }</td>
						   		<td style="background-color: white; color: black;">${c.faqQ }</td>
					   		</tr>
					   		<tr class="faq_a">
				   			<td style="background-color: white; color: black; text-align: center;">답변</td>
				   			<td style="background-color: white; color: black;"><p>${c.faqA }</p></td>
				   		</tr>
				   		</c:if>
				   </c:forEach>
				   
				   <!-- 팀프로젝트 관련 -->
				   <c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 14 }">
					   		<tr class="faq_q">
						   		<td style="background-color: white; color: black; text-align: center;">${i.count }</td>
						   		<td style="background-color: white; color: black;">${c.faqQ }</td>
					   		</tr>
					   		<tr class="faq_a">
				   			<td style="background-color: white; color: black; text-align: center;">답변</td>
				   			<td style="background-color: white; color: black;"><p>${c.faqA }</p></td>
				   		</tr>
				   		</c:if>
				   </c:forEach>
				   
				   <!-- 기타 문의 -->
				   <c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 40 }">
					   		<tr class="faq_q">
						   		<td style="background-color: white; color: black; text-align: center;">${i.count }</td>
						   		<td style="background-color: white; color: black;">${c.faqQ }</td>
					   		</tr>
					   		<tr class="faq_a">
				   			<td style="background-color: white; color: black; text-align: center;">답변</td>
				   			<td style="background-color: white; color: black;"><p>${c.faqA }</p></td>
				   		</tr>
				   		</c:if>
				   </c:forEach>
				   
				   <!-- 신고 -->
				   <c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 22 }">
					   		<tr class="faq_q">
						   		<td style="background-color: white; color: black; text-align: center;">${i.count }</td>
						   		<td style="background-color: white; color: black;">${c.faqQ }</td>
					   		</tr>
					   		<tr class="faq_a">
				   			<td style="background-color: white; color: black; text-align: center;">답변</td>
				   			<td style="background-color: white; color: black;"><p>${c.faqA }</p></td>
				   		</tr>
				   		</c:if>
				   </c:forEach>
				   
				   <!-- 기능/작동 오류 -->
				   <c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 21 }">
					   		<tr class="faq_q">
						   		<td style="background-color: white; color: black; text-align: center;">${i.count }</td>
						   		<td style="background-color: white; color: black;">${c.faqQ }</td>
					   		</tr>
					   		<tr class="faq_a">
				   			<td style="background-color: white; color: black; text-align: center;">답변</td>
				   			<td style="background-color: white; color: black;"><p>${c.faqA }</p></td>
				   		</tr>
				   		</c:if>
				   </c:forEach>
				   
				   <!-- 이벤트 -->
				   <c:forEach items="${list }" var="c" varStatus="i">
				   		<c:if test="${category eq 20 }">
					   		<tr class="faq_q">
						   		<td style="background-color: white; color: black; text-align: center;">${i.count }</td>
						   		<td style="background-color: white; color: black;">${c.faqQ }</td>
					   		</tr>
					   		<tr class="faq_a">
				   			<td style="background-color: white; color: black; text-align: center;">답변</td>
				   			<td style="background-color: white; color: black;"><p>${c.faqA }</p></td>
				   		</tr>
				   		</c:if>
				   </c:forEach>
				   </tbody>
			  	</table> --%>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>