<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/lifestyle-mgr.css">
    <link rel="stylesheet" href="/css/bootstrap.css">
	<script type="text/javascript" src="/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="main">
    <div class="main-left-box">
	        <h2>관리자 페이지</h2>
	        <ul>
	            <li>
	                <span>메인 페이지</span>
	                <ul class="subnavi">
	                    <li><a href="/adminMain">관리자 개요<span>&gt;</span></a></li>	                    
	                </ul>
	            </li>
	            <li>
	                <span>시설 예약 내역</span>
	                <ul class="subnavi">
	                    <li><a href="/adminRoomResList?reqPage=1">객실 예약 내역<span>&gt;</span></a></li>
	                    <li><a href="/adminDiningList?reqPage=1">다이닝 예약 내역<span>&gt;</span></a></li>
	                    <li><a href="/adminLfList?reqPage=1">라이프스타일 예약 내역<span>&gt;</span></a></li>
	                </ul>
	            </li>
	            <li>
	                <span>고객문의 및 회원</span>
	                <ul class="subnavi">
	                    <li><a href="/adminQuestionList?reqPage=1">고객 문의 내역<span>&gt;</span></a></li>
	                    <li><a href="/adminMemberList?reqPage=1&dataType=List&data=''">회원 정보<span>&gt;</span></a></li>	                   
	                </ul>
	            </li>
	            <li>
	                <span>시설 관리</span>
	                <ul class="subnavi">
	                    <li><a href="/roomManage">객실 관리<span>&gt;</span></a></li>
	                    <li><a href="/diningList">다이닝 관리<span>&gt;</span></a></li>	
	                    <li><a href="/lifestyleList?reqPage=1" id="lf-click">라이프스타일 관리<span>&gt;</span></a></li>	                    
	                </ul>
	            </li>
	        </ul>
	    </div>
    <!-- 메인 콘텐츠 -->
    <div class="main-content">
        <h2>라이프 스타일 관리</h2>
        <table class="lf-mgr-table">
            <tr class="table-title">
                <th>NO.</th>
                <th>분류</th>
                <th>제목</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
            <c:forEach items="${list }" var = "lf" varStatus = "i">
            	<tr>
            		<td>${start + i.index }</td>
            		<td>${lf.lfCategory }</td>
            		<td><a href="/lifestyleInfo?lfNo=${lf.lfNo }">${lf.lfTitle }</a></td>
            		<td><a href="/updateLifestyle?lfNo=${lf.lfNo }" class="btn btn-light">수정하기</a></td>
            		<td><a href="/deleteLifestyle?lfNo=${lf.lfNo }" class="btn btn-light">삭제하기</a></td>
            	</tr>
            </c:forEach>
        </table>
		<div id="pageNavi">${pageNavi }</div>
        <a href="/insertLifestyle" class="btn btn-light" id="insertBtn">등록하기</a>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>