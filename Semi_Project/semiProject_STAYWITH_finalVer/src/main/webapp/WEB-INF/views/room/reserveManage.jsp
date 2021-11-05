<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/room.css">

<meta charset="UTF-8">
<title>객실관리</title>

</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp"%>
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
	                    <li><a href="/lifestyleList?reqPage=1">라이프스타일 관리<span>&gt;</span></a></li>	                    
	                </ul>
	            </li>
	        </ul>
	    </div>
    <!-- 메인 콘텐츠 -->
      <div class="main-content">
        <h3>객실 수정/삭제</h3><br>
         <table border="1" class="roomForm">
        <tr>
            <th>예약번호</th>
            <th>객실번호</th>
            <th>객실이름<th>
            <th>예약자</th>
             <th>예약내역확인</th>
             <th>예약수정</th>
              <th>예약삭제</th>
            
          
        </tr>
        	<c:forEach items="${list}" var="res" varStatus="i">
        <tr>
            <td>${res.resNum}</td>
            <td>[${res.roomNo}]</td>
            <td>${res.roomName}</td>
            <td>${res.memberKname}</td>
           
            <td><button value="예약내역" id="modify"><a href="/reserveConfirm?resNum=${res.resNum}">예약내역</a></button></td>
             <td><button value="수정" id="modify"><a href="/upReserveFrm?resNum=${res.resNum}">예약수정</a></button></td>
               <td><button value="수정" id="modify"><a href="/roomCancleFrm?resNum=${res.resNum}">예약취소</a></button></td>
     
        </tr>
        </c:forEach>
    </table>
  
    </div>
</div>
<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>