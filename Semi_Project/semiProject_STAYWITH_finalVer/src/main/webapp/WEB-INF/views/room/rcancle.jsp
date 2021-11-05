<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/room.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<div class="margin"></div>
<div class="bodys"><br><br>
  <h2 id="cancleR"><b>객실예약취소(Cancle Reserve)</b></h2><br><br>
  <form action="/roomCancleR" method="post">
  <div id="date">
     <h3>${res.checkIn}일  - ${res.checkOut}일</h3>
  </div>
  <div id="room">
    <h3><b>[${res.roomType}]${res.roomName}</b></h3>
  </div>
  <div id="total">
    <h3>총인원 :${res.adult+res.kid}명</h3>
  </div>
   <div id="colLine"></div><br>
 <div id="grayLine"></div><br>

  <div class="ALL">
<div class="left">
    <h3><고객정보확인 ></h3>
    <br>
    <label for="name">성명:</label>
    <input type="text" name="memberKname" id="memberKname" placeholder="성함을 입력해주세요"> <br><br>
    <label for="name">예약번호:</label>
    <input type="text" name="resNum" id="resNum" placeholder="예약번호를 입력해주세요"> 
</div>
<div class="middleL">

</div>
<div class="right">
    <h3> < 환불약정 ></h3>
    <img src="img/refund.PNG" id="refund">
</div>
  </div>
  <h3><b>관리자 승인후 취소처리 및 환불처리 됩니다.</b></h3>
     <div class="buttonBox">
        <br> 
        <input type="submit" value="취소요청" >
            </div><br><br>
  </form>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</div>
</div>
</body>
</html>