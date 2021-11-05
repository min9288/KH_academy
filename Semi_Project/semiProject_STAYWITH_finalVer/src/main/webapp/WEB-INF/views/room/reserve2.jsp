<%@page import="main.model.vo.MainRoomRes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <%
        MainRoomRes mrr = (MainRoomRes)request.getAttribute("mrr");
    %>
<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="/css/room.css">
<!-- jQuery라이브러리 추가(2개) -->
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<!-- 부트스트랩용 jQuery -->
<script type="text/javascript" src="/js/bootstrap.bundle.min.js"></script>
<style>


.body3 {
   width: 1200px;
   margin: 0 auto;
}

.main-content {
   width: 874px;
   height: 1000px;
   float: left;
}

h3 {
   text-align: center;
}

.one {
   border: 2px solid rgb(185, 169, 137);
   width: 1200px;
   height: 210px;
   margin: 0 auto;
   background-color: rgb(246, 234, 191);
}

.two {
   width: 800px;
   height: 200px;
   margin: 0 auto;
}

#one-1-0 {
   float: left;
   width: 100px;
   height: 100px;
   margin-top: 45px;
   text-align: center;
   font-weight: 800;
   margin-right: 20px;
}

#one-1-1 {
   float: left;
   width: 300px;
   height: 200px;
}

#one-1-2 {
   float: left;
   width: 400px;
   margin-left: 80px;
   height: 200px;
   font-weight: 500;
   background-color: rgb(246, 234, 191);
}

#one-2 {
   float: left;
   width: 200px;
   height: 100px;
   margin-top: 70px;
}

#rooms {
   width: 300px;
   height: 250px;
}

.clicks {
   background-color: blue;
   width: 150px;
   height: 150px;
}

.r-choose {
   width: 800px;
   height: 100px;
   margin: 0 auto;
}

.retable {
   width: 1200px;
   height: 100px;
   margin-bottom: 30px;
}

#checkInR, #checkOutR {
   width: 135px;
}

#adult, #kid {
   width: 100px;
}

#hotelName {
   width: 200px;
}

#selectRoom {
   width: 300px;
   height: 200px;
}

#search {
   background-color: rgb(185, 169, 137);
   border: none;
   height: 30px;
   font-weight: 800;
}

#selectN {
   font-weight: 800;
   font-size: 20px;
}

#reserveR {
   background-color: rgb(185, 169, 137);
   border: none;
   font-weight: 800;
   margin-left: 20px;
   height: 30px;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div>
      <%@include file="/WEB-INF/views/common/header.jsp"%>
      <div class="margin"></div>
      <div class="body3">
         <h3 id="selectN">◎호텔,날짜,인원 선택◎</h3>
         <br>
         <hr>
         <form action="/selectName2" method="post" name="RoomFrm">
            <input type="hidden" name="roomNo" value="${r.roomNo}">
            <table border="1" class="retable">
               <tr>

                  <td id="hotelName"><b>호텔</b></td>
                  <td><b>체크인</b></td>

                  <td><b>체크아웃</b></td>
                  <td><b>객실이름</b></td>
                  <td><b>침대</b></td>
                  <td><b>성인</b></td>
                  <td><b>소인</b></td>


               </tr>
               <tr>
                  <td><span>스테이위드호텔</span></td>
                  
              <c:if test="${empty reserve}">
                  <td><span><input type='date' id="checkInR"
                        name="checkInR" 
                        <% if(mrr != null) {%>
                        value="<%=mrr.getCheckin()%>" >
                           <%} %>
                        </span></td>
                  <td><span><input type='date' id="checkOutR"
                        name="checkOutR" 
                        <% if(mrr != null) {%>
                        value="<%=mrr.getCheckout()%>">
                        <%} %>
                        </span></td>
                  <td><span> <input type="text" id="roomName" name="roomName"  value="${r.roomName}" ></span></td>
                  <td><span><select id="bed" name="bed">
                           <option value=""><침대></option>
                           <option value="트윈">트윈</option>
                           <option value="더블">더블</option>

                     </select></span></td>
                 <td><span><select id="adult" name="adult" >
                     <% if(mrr != null) {%>
                     <option value="<%=mrr.getAdult()%>"selected="selected" hidden="hidden"><%=mrr.getAdult()%>명</option>
                     <%} %>
                           <option value="1">1명</option>
                           <option value="2">2명</option>
                           <option value="3">3명</option>
                           <option value="4">4명</option>
                           <option value="5">5명</option>
                           <option value="5">6명</option>

                     </select></span></td>
                  <td><span><select id="kid" name="kid"  >
                        <% if(mrr != null) {%>
                        <option value="<%=mrr.getKid()%>"selected="selected" hidden="hidden"><%=mrr.getKid()%>명</option>
                        <%} %>
                      <option value="0">0명</option>
                           <option value="1">1명</option>
                           <option value="2">2명</option>
                           <option value="3">3명</option>
                           <option value="4">4명</option>
                           <option value="5">5명</option>

                     </select></span></td>
               </c:if>
               
               <c:if test="${not empty reserve}">
               <td><span><input type='date' id="checkInR"
                        name="checkInR" 
                        value="${reserve.checkIn}" >
                        </span></td>
                  <td><span><input type='date' id="checkOutR"
                        name="checkOutR" 
                        value="${reserve.checkOut}">
                        
                        </span></td>
                  <td><span> <input type="text" id="roomName" name="roomName"  value="${reserve.roomName}" ></span></td>
                  <td><span><select id="bed" name="bed">
                           <option value=""><침대></option>
                            <option value="${reserve.bed}"selected="selected" hidden="hidden">${reserve.bed}</option>
                     
                           <option value="트윈">트윈</option>
                           <option value="더블">더블</option>

                     </select></span></td>
                 <td><span><select id="adult" name="adult" >
                    
                     <option value="${reserve.adult}"selected="selected" hidden="hidden">${reserve.adult}명</option>
                     
                           <option value="1">1명</option>
                           <option value="2">2명</option>
                           <option value="3">3명</option>
                           <option value="4">4명</option>
                           <option value="5">5명</option>
                           <option value="5">6명</option>

                     </select></span></td>
                  <td><span><select id="kid" name="kid"  >
              
                        <option value="${reserve.kid}"selected="selected" hidden="hidden">${reserve.kid}명</option>

                      <option value="0">0명</option>
                           <option value="1">1명</option>
                           <option value="2">2명</option>
                           <option value="3">3명</option>
                           <option value="4">4명</option>
                           <option value="5">5명</option>

                     </select></span></td>
               </c:if>
                  <td rowspan="2"><input type="submit" value="search"
                     id="search"></td>


               </tr>

            </table>
         </form>
         <h3 style=color:blue;>★이미 예약되어 있는 객실은 검색되지 않습니다.★</h3>
      <c:forEach items="${list}" var="r" varStatus="i">

                        <div class="one">

                     <div id="one-1-0">
                        <p>ROOM NO</p>
                        <p>${r.roomNo}</p>
                     </div>
                     <div id="one-1-1">
                        <img id="selectRoom" src="upload/room/${r.roomImg}">
                     </div>
                     <div id="one-1-2">

                        <h4>[${r.roomName}]</h4>
                        <p>${r.roomSize}</p>
                        <p>${r.bed}</p>
                        <p>${r.roomForm}</p>
                        <p>${r.roomLoc}</p>


                     </div>
                     <div id="one-2">
                        <span><b>${r.roomPrice}원</b></span>&emsp;
                        <button value="예약하기" id="reserveR">
                           <a href="/reserveRoom?roomNo=${r.roomNo}&checkIn=${reserve.checkIn}&checkOut=${reserve.checkOut}&adult=${reserve.adult}&kid=${reserve.kid}">예약하기</a>
                        </button>
                     </div>
                  </div>
            <br>
         </c:forEach>
      </div>

   </div>
   <%@include file="/WEB-INF/views/common/footer.jsp"%>

   </div>
</body>
</html>