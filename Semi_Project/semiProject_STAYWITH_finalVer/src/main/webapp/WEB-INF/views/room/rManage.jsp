<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/room.css">
<style>
#insertRoom{
	background-color: #b9A489;
	border:none;
     cursor: pointer;
     color:#ffffff;
     margin-left:700px;
     margin-bottom:15px;

}
</style>
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
        <h2><b>객실 관리</b></h2><br>
        <button value="객실등록" id="insertRoom"><a href="/roomFrm">객실등록</a></button>
       
          <table border="1" class="roomForm">
        <tr>
            <th>NO</th>
            <th>객실</th>
            <th>ROOM</th>
            <th>객실크기</th>
            <th>수정</th>
            <th>삭제</th>
        </tr>
        	<c:forEach items="${list}" var="r" varStatus="i">
        <tr>
            <td>${r.roomNo}</td>
            <td>[${r.roomType}]</td>
            <td>${r.roomName}</td>
            <td>${r.roomSize}</td>
            <td><button value="수정" id="modify"><a href="/updateRoomFrm?roomNo=${r.roomNo}">수정</a></button></td>
            <td><button value="삭제" id="delete"><a href="/deleteRoom?roomNo=${r.roomNo}">삭제</a></button></td>
        </tr>
        </c:forEach>
    </table>
  
    </div>
</div>
<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
<script>
	$(function(){
		$(".subnavi").eq(3).find("a").eq(0).css("background-color","#d6c6a5")
   		$(".subnavi").eq(3).find("a").eq(0).children().show();		
	});
</script>	
</html>