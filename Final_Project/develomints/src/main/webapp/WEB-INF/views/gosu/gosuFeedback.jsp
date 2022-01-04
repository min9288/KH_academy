<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
.container * {
	text-decoration: none;
	color: black;
}

.container {
	min-width: 1200px;
}

.container>h3 {
	display: flex;
	justify-content: center;
	margin-top: 50px;
	font-size: 45px;
	font-weight: 900;
}

.gosu, .g-content {
	display: flex;
	justify-content: center;
	margin-top: 100px;
	margin-bottom: 100px;
}

.gosu table {
	width: 100%;
}

.gosu .gosu_img {
	text-align: center;
	width: 300px;
	height: 200px;
}

.gosu td {
	padding: 10px;
	padding-right: 30px;
	padding-left: 30px;
	text-align: left;
}

.gosu hr {
	max-width: 100%;
	font-weight: bold;
	background-color: rgb(199, 199, 199);
	height: 1px;
}

.gosu button:hover {
	background-color: rgb(223, 245, 235);
}

.gosu li {
	list-style-type: none;
}

.g-content input, .g-content textarea {
	padding: 10px;
}

.g-content tr th, .g-content tr td {
	padding: 20px;
	padding-left: 40px;
	padding-right: 40px;
}

input:focus, textarea:focus {
	outline: none;
}

.g-content th {
	background-color: rgb(245, 	245, 245);
}

.gosu-mail {
	display: flex;
	justify-content: right;
}

.gosu-mail a {
	font-weight: bold;
	font-size: 20px;
}

.gosu-mail span {
	font-weight: bold;
	color: white;
	background-color: red;
	border-radius: 50%;
	text-align: center;
	width: 20px;
	margin-left: 50px;
	display: block;
	font-size: 13px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		
		<h3>
			<span style="color: rgb(78, 205, 196);">고수</span>에게 피드백 신청하기
		</h3>
		<div class="gosu">
			<button type="button" class="card border-primary mb-3"
				style="border-width: 5px; max-width: 1800rem; border-radius: 50px; padding: 30px; width: 90%;">
				<table>
					<tr>
						<c:if test="${empty gosu.gosuImg }">
							<td rowspan="4" class="gosu_img"
								style="padding: 40px; text-align: center;"><img
								src="/resources/img/gosu/g_img_basic.png"
								style="border-radius: 50%; width: 200px; height: 200px;"></td>
						</c:if>
						<c:if test="${not empty gosu.gosuImg }">
							<td rowspan="4" style="padding: 40px; text-align: center;"><img
								src="/resources/upload/member/${gosu.gosuImg }"
								style="border-radius: 50%; width: 200px; height: 200px;"></td>
						</c:if>


						<td style="width: 750px;"><a
							href="/gosuContent.do?gNo=${gosu.ggsouNo}" class="gtitle"
							style="font-weight: 900; font-size: 20px;">${gosu.gosuTitle }</a></td>
					</tr>
					<tr>
						<td><hr></td>
					</tr>
					<tr>

						<td>
							<li><b>한줄소개</b>&nbsp;&nbsp;${gosu.gosuSelf }</li> <input
							type="hidden" value="${gosu.gosuTitle }" id="gfTitle"> <input
							type="hidden" value="${gosu.ggsouNo }" id="ggsouNo">
						</td>
					</tr>
					<tr>
						<td>
							<li><b>비용</b>&nbsp;&nbsp;<b style="color: red;">
									${gosu.gosuCost }</b>&nbsp;원</li> <input type="hidden"
							value="${gosu.gosuCost }" id="gfCost">
						</td>
					</tr>
					<tr>
						<td style="text-align: center; font-weight: bold;"><span
							style="color: rgb(78, 205, 196);">고수</span> ${gosu.gosuId }</td>
						<td><c:if test="${empty gosu.reviewAvg }">
								<span style="color: gray; font-size: small;">아직 등록된 리뷰가
									없습니다.</span>

							</c:if> <c:if test="${not empty gosu.reviewAvg }">
								<span>${gosu.reviewAvg } 점 &nbsp;&nbsp;</span>
								<c:choose>
									<c:when test="${gosu.reviewAvg eq 5}">
										<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
									</c:when>
									<c:when test="${gosu.reviewAvg >= 4}">
										<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9733;&#9734;</span>
									</c:when>

									<c:when test="${gosu.reviewAvg >= 3}">
										<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9734;&#9734;</span>
									</c:when>
									<c:when test="${gosu.reviewAvg >= 2}">
										<span style="color: #ffd400;">&#9733;&#9733;&#9734;&#9734;&#9734;</span>
									</c:when>
									<c:when test="${gosu.reviewAvg>= 1}">
										<span style="color: #ffd400;">&#9733;&#9734;&#9734;&#9734;&#9734;</span>
									</c:when>


								</c:choose>
									(${gosu.reviewCount }) 

							</c:if></td>
					</tr>
				</table>
			</button>
		</div>
		<div class="g-content">
			<div>
				<table>
					<tr>
						<th>제목 <span style="color: red;">* </span></th>
						<td><input type="text" style="width: 100%;" class="form-control" placeholder=" * 제목을 적어주세요!"
							id="gosuFeedbackTitle"></td>
					</tr>
					<tr>
						<th>내용 <span style="color: red;"> * </span></th>
						<td><textarea cols="100" rows="30" id="gosuFeedbackContent" class="form-control" 
								placeholder=" * 피드백 받고 싶은 내용에 대해 자세하게 적어주세요!
                        
                        "></textarea></td>
					</tr>

				</table>
			</div>
		</div>
		<div style="display: flex; justify-content: center;">
			<button type="button" id="gRequestCostBtn" class="btn btn-primary"
				style="width: 200px; margin: 100px; padding: 10px;">
				<b style="color: white">피드백 신청하기</b>
			</button>
		</div>

		<input type="hidden" value="${sessionScope.m.memberId }" id="mId">
	</div>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		$("#gRequestCostBtn").click(function() {
			var gosuFeedbackContent = $("#gosuFeedbackContent").val();
			var gosuFeedbackTitle = $("#gosuFeedbackTitle").val();
			if (gosuFeedbackContent == "" || gosuFeedbackTitle == "") {
				swal({
					title : '실패',
					text : '제목과 내용을 올바르게 입력해주세요.',
					icon : 'error'
				})
				return false;
			}
			var IMP = window.IMP;
			IMP.init('imp37172515');
			var cost = $("#gfCost").val();
			var mId = $("#mId").val();
			var gfTitle = $("#gfTitle").val();
			IMP.request_pay({
				pg : 'kakao',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : gfTitle,
				amount : cost, //판매 가격
				buyer_name : mId
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					var icon = 'success';
					var title = '피드백을 시작하세요!';
					var ggsouNo = $("#ggsouNo").val();
					var gosuFeedbackTitle = $("#gosuFeedbackTitle").val();
					var gosuFeedbackContent = $("#gosuFeedbackContent").val();
					$.ajax({
						url : "/gosuFeedbackInsert.do",
						type : "post",
						data : {
							"ggsouNo" : ggsouNo,
							"memberId" : mId,
							"gosuFeedbackTitle" : gosuFeedbackTitle,
							"gosuFeedbackContent" : gosuFeedbackContent
						},
						success : function(data) {
							location.href = "/gosuTalk.do?fbNo=" + data;
						}
					});
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					var icon = 'error';
					var title = '관리자에게 문의해주세요';
				}
				swal({
					title : title,
					text : msg,
					icon : icon
				});

			})
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>