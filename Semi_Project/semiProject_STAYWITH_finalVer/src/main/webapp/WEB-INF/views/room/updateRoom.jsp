<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/room.css">
<meta charset="UTF-8">
<title>객실수정</title>

</head>
<body>
	<div>
		<%@include file="/WEB-INF/views/common/header.jsp"%>
		<div class="margin"></div>
		<div class="bodys">
			<form action="/updateRoom" method="post" name="RoomFrm"
				enctype="multipart/form-data">
				<h2 id="h_roomINFO">UPDATE ROOM</h2>
				<br>
				<br>
				<div class="ALL">
					<div class="i-left">

						<br> <label for="r_type">객실타입: </label> <select id="roomType"
							name="roomType">
							<c:choose>
								<c:when test="${r.roomType eq '스탠다드' }">
									<option value="${r.roomType}">객실타입</option>
									<option value="스탠다드" selected>스탠다드</option>
									<option value="이그제큐티브">이그제큐티브</option>
									<option value="스위트">스위트</option>
								</c:when>
								<c:when test="${r.roomType eq '이그제큐티브' }">
									<option value="${r.roomType}">객실타입</option>
									<option value="스탠다드">스탠다드</option>
									<option value="이그제큐티브" selected>이그제큐티브</option>
									<option value="스위트">스위트</option>
								</c:when>
								<c:when test="${r.roomType eq '스위트' }">
									<option value="${r.roomType}">객실타입</option>
									<option value="스탠다드">스탠다드</option>
									<option value="이그제큐티브">이그제큐티브</option>
									<option value="스위트" selected>스위트</option>
								</c:when>
							</c:choose>
						</select> <br> <br> <label for="r_type">객실종류: </label> <input
							type="text" name="roomName" id="roomName" value="${r.roomName}"><br>
						<br> <label for="r_type">객실이미지: </label> <input type="hidden"
							name="roomNo" value="${r.roomNo}"> <input type="hidden"
							name="status" value="1">
						<c:choose>
							<c:when test="${not empty r.getRoomImg() }">
								<img src="/img/file.png" width="16px" class="delFile">
								<span class="delFile">${r.roomImg}</span>
								<button type="button" id="delBtn"
									class="btn btn-primary btn-sm delFile">삭제</button>

								<input type="file" name="upfile" style="display: none;">
								<input type="hidden" name="oldFilename" value="${r.roomImg}"
									placeholder="객실이미지">
							</c:when>
							<c:otherwise>
								<input type="file" name="upfile">
							</c:otherwise>
						</c:choose>
						<br>
						<br> <label for="r_type">객실설명: </label> <img
							src="/img/file.png" width="16px"> <span class="roomInfo">${r.roomInfo}</span>

						<br> <br> <label for="r_type">객실크기: </label> <input
							type="text" name="roomSize" id="roomSize" placeholder="객실사이즈"
							value="${r.roomSize}"> <br> <br> <label
							for="r_type">객실소개: </label> <input type="text" name="roomDetail"
							id="roomDetail" placeholder="객실소개" value="${r.roomDetail}">
						<br> <br>
					</div>
					<div class="middle"></div>
					<div class="i-right">
						<label for="r_type">위치:</label><input type="text" name="roomLoc"
							id="roomLoc" placeholder="객실위치" value="${r.roomLoc}"> <br>
						<br> <label for="r_type">룸구성: </label> <input type="text"
							name="roomForm" id="roomForm" placeholder="룸구성"
							value="${r.roomForm}"> <br> <br> <label
							for="r_type">전망: </label> <input type="text" name="roomView"
							id="roomView" placeholder="전망" value="${r.roomView}"> <br>
						<br> <label for="r_type">침대: </label> <input type="text"
							name="bed" id="bed" placeholder="침대" value="${r.bed}"> <br>
						<br> <label for="r_type">투숙인원수(최대):</label> <input
							type="text" name="maxNum" id="maxNum" placeholder="인원수"
							value="${r.maxNum}"> <br> <br> <label
							for="r_type">가격(1박): </label> <input type="text" name="roomPrice"
							id="roomPrice" placeholder="가격(1박)" value="${r.roomPrice}">
						<br> <br> <label for="r_type">이용여부: </label> <input
							type="text" name="roomStatus" id="roomStatus" placeholder="이용여부"
							value="${r.roomStatus}">
					</div>
				</div>

				<div class="buttonBox">
					<br> <input type="submit" value="수정하기">
				</div>
				<br> <br> <br>

			</form>
			<script>
				$("#delBtn").click(function() {
					$(".delFile").hide();
					$(this).next().show();
					$("[name=status]").val(2);
				});
				$(function() {
					var roomName = '${r.roomName}';
					$("#roomName>option").each(function(index, item) {
						if ($(item).val() == roomName) {
							$(item).prop("selected", true);
						}
					});
				});
			</script>
			<%@include file="/WEB-INF/views/common/footer.jsp"%>
		</div>
	</div>
</body>
</html>