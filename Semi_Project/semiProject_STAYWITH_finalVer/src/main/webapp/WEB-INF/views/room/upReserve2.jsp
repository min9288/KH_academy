<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/room.css">
<style>
#date, #room {
	float: left;
	margin-right: 60px;
	text-align: center;
	margin-left: 120px;
}

#total {
	margin-left: 120px;
}

.ALL {
	height: 400px;
	background-color: rgb(224, 224, 224);
}

.left {
	height: 400px;
	width: 300px;
	float: left;
	background-color: rgb(246, 234, 191);
}

.middlear {
	height: 400px;
	width: 400px;
	float: left;
	background-color: rgb(246, 234, 191);
}

#time {
	height: 130px;
	width: 400px;
	margin-top: 50px;
}

#rn {
	height: 70px;
	width: 400px;
}

#to {
	height: 100px;
	width: 400px;
}

.right {
	margin-top: 200px;
	height: 200px;
	width: 200px;
	float: left;
	font-size: 20px;
	font-weight: 800;
}

.rights {
	height: 400px;
	width: 230px;
	float: left;
	background-color: rgb(246, 234, 191);
}

.right>p {
	text-align: center;
	font-weight: 800;
	float: left;
	margin-left: 20px;
}

#reserves {
	width: 200px;
	height: 200px;
	margin-left: 50px;
}

#checkIn1 {
	float: left;
	width: 150px;
	height: 50px;
	margin-top: 50px;
}

#checkOut1 {
	float: left;
	width: 150px;
	height: 50px;
	margin-left: 50px;
	margin-top: 50px;
}

#selectR {
	width: 300px;
}

#totalNum {
	width: 200px;
}

.r-click {
	margin: 0 auto;
	height: 90px;
}

#nn {
	text-align: center;
	margin-top: 50px;
	margin-bottom: 50px;
}

.body2 {
	width: 1200px;
	height: 700px;
	margin: 0 auto;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<%@include file="/WEB-INF/views/common/header.jsp"%>
		<div class="margin"></div>

		<div class="body2">
			<form action="/upReserveR" method="post">
				<h2 id="nn">
					<b>객실 예약변경(Update Reserve)</b>
				</h2>
				<br>
				<div id="date">
					<h3><${res.checkIn}일> -- <${res.checkOut}일></h3>
				</div>
				<div id="room">
					<h3>
						<b>[${res.roomType}]${res.roomName}</b>
					</h3>
				</div>
				<div id="total">
					<h3>총인원 :${res.adult+res.kid}명</h3>
				</div>
				<div id="colLine"></div>
				<br>
				<div id="grayLine"></div>
				<br>

				<div class="left">
					<h3>★MY RESERVE★</h3>
					<br>
					<div class="infoReserves">
						<p id="ths">객실이름</p>
						<p>[${res.roomType}]${res.roomName}</p>
						<p id="ths">투숙인원</p>
						<P>성인 ${res.adult}명,소인 ${res.kid}명</P>
						<p id="ths">체크인</p>
						<p>${res.checkIn}일</p>
						<p id="ths">체크아웃</p>
						<p>${res.checkOut}일</p>

					</div>
				</div>
				<div class="middlear">
					<div id="time">
						<input type="hidden" id="resNum" name="resNum"
							value="${res.resNum}">
						<div id="checkIn1">
							<span class="it_info"><b id="it">체크인</b>&emsp; <input
								type="date" value="${res.checkIn}" id=checkIn name="checkIn"></span>&emsp;

						</div>


						<div id="checkOut1">
							<span class="it_info"><b id="it">체크아웃</b>&emsp; <input
								type="date" value="${res.checkOut}" id="checkOut"
								name="checkOut"></span>&emsp;

						</div>
					</div>
					<div>
						<label for="id">객실타입: </label> <input type="text" id="roomType"
							name="roomType" value="${res.roomType}" readonly></span>&emsp;<br>
						<br>



					</div>
					<div>
						<label for="id">객실이름: </label> <input type="text" id="roomName"
							name="roomName" value="${res.roomName}" readonly></span>&emsp;<br>
						<br>



					</div>

					<div id="to">
						<div>
							<label for="id">성인인원: </label> <select id="adult" name="adult">


								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>
						</div>
						<br>
						<div>
							<label for="id">소인인원: </label> <select id="kid" name="kid">


								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select><br>

						</div>
					</div>

				</div>
				<div class="rights">
					<div class="right">
						<span class="it_info"><b id="it">총금액</b>&emsp;${res.roomPrice}원</span>&emsp;
					</div>
				</div>
		</div>
		<br>
		<h3>객실을 변경을 원하실 경우 취소하고 진행해주세요.</h3>
		<div class="r-click">
			<div class="buttonBox">
				<br> <input type="submit" value="예약변경">
			</div>

		</div>
	</div>

	</form>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>