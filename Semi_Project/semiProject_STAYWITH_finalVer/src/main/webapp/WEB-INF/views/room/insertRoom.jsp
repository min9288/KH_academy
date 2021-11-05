<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/room.css">
<meta charset="UTF-8">
<title>객실등록</title>

</head>
<body>
   <div>
      <%@include file="/WEB-INF/views/common/header.jsp"%>
      <div class="margin"></div>
      <div class="bodys">
         <form action="/insertRoom" method="post" name="RoomFrm"
            enctype="multipart/form-data">
            <h2 id="h_roomINFO">INSERT ROOM</h2><br><br>
            <div class="ALL">
               <div class="i-left">
               
                  <br> <label for="r_type" >객실타입: </label> 
                  <select id="roomType" name="roomType">
                     <option value="">객실타입</option>
                     <option value="스탠다드">스탠다드</option>
                     <option value="이그제큐티브">이그제큐티브</option>
                     <option value="스위트">스위트</option>
                  </select> <br>
                  <br> <label for="r_type">객실이름: </label> 
                  <input type="text" name="roomName" id="roomName" placeholder="객실이름" onfocus="this.placeholder=''"><br>
                  <br> <label for="r_type">객실이미지: </label><input type="file"
                     name="r-Img" id="r-Img" placeholder="객실이미지"> <br>
                  <br> <label for="r_type">객실설명: </label><input type="file"
                     name="roomInfo" id="roomInfo" placeholder="객실설명이미지" onfocus="this.placeholder=''"> <br>
                  <br> <label for="r_type">객실크기: </label><input type="text"
                     name="roomSize" id="roomSize" placeholder="객실사이즈" onfocus="this.placeholder=''"> <br>
                  <br> <label for="r_type">객실소개: </label><input type="text"
                     name="roomDetail" id="roomDetail" placeholder="객실소개" onfocus="this.placeholder=''"> <br>
                  <br>
               </div>
               <div class="middle"></div>
               <div class="i-right">
                  <label for="r_type">위치:</label><input type="text" name="roomLoc"
                     id="roomLoc" placeholder="객실위치" onfocus="this.placeholder=''"> <br>
                  <br> <label for="r_type">룸구성: </label><input type="text"
                     name="roomForm" id="roomForm" placeholder="룸구성" onfocus="this.placeholder=''"> <br>
                  <br> <label for="r_type">전망: </label><input type="text"
                     name="roomView" id="roomView" placeholder="전망" onfocus="this.placeholder=''"> <br>
                  <br> <label for="r_type">침대: </label><input type="text"
                     name="bed" id="bed" placeholder="침대" onfocus="this.placeholder=''"> <br>
                  <br> <label for="r_type">투숙인원수(최대): </label><input
                     type="text" name="maxNum" id="maxNum" placeholder="인원수" onfocus="this.placeholder=''">
                  <br>
                  <br> <label for="r_type">가격(1박): </label><input type="text"
                     name="roomPrice" id="roomPrice" placeholder="가격(1박)" onfocus="this.placeholder=''"> <br>
                  <br> <label for="r_type">이용여부: </label><input type="text"
                     name="roomStatus" id="roomStatus" placeholder="이용여부" onfocus="this.placeholder=''">
               </div>
            </div>

            <div class="buttonBox">
               <br> <input type="submit" value="등록하기">
            </div>
            <br>
            <br>
            <br>

         </form>
         <%@include file="/WEB-INF/views/common/footer.jsp"%>
      </div>
   </div>
</body>
</html>