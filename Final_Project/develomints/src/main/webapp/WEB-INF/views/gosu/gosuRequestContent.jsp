<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
</head>
<style>
.container * {
	text-decoration: none;
	color: black;
}

.container {
	min-width: 1200px;
}

input:focus, textarea:focus {
	outline: none;
}

.container>h3 {
	display: flex;
	justify-content: center;
	margin-top: 50px;
	font-size: 30px;
	font-weight: 900;
}

.request li {
	list-style-type: none;
	padding: 30px;
}

.request {
	margin-top: 100px;
	margin-bottom: 100px;
}

.request, .g-center {
	display: flex;
	justify-content: center;
}

.request>div {
	border-width: 10px;
	padding: 50px;
	width: 1000px;
}

.request h3 {
	font-size: 20px !important;
	font-weight: 600;
	color: gray !important;
}

.request * {
	font-size: 30px;
	font-weight: 900;
}

.request p {
	margin-right: 50px;
}

.g-style {
	text-align: center;
	margin: 10px;
	padding: 30px;
	display: flex;
	justify-content: center;
}

.hrm-wrap {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 10000;
}

#hrm-modal {
	background-color: white;
	width: 800px;
	padding: 30px;
}

.hrm-btn-wrap {
	width: 100%;
	display: flex;
	justify-content: center;
}

.hrm-btn-wrap a {
	margin: 30px;
	margin-top: 50px;
	padding: 10px;
	width: 100px;
}

.hrm-content span {
	margin: 40px;
	font-size: 30px;
	font-weight: 900;
}

.upbtn:hover {
-webkit-transform: scale(1.03);
    transform: scale(1.03);
}
</style>


<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<h3>
			<span style="color: rgb(78, 205, 196); margin-right: 10px;">${grOne.requestWriterId}</span>님의
			요청서
		</h3>
		<div class="request">
			<div style="box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);">
				<ul style="padding: 0;">
					<li>
						<h3>어떤 플랫폼을 원하시나요?</h3> ${grOne.requestContent1Br} <br>
					</li>
					<li>
						<h3>어떤 종류의 개발을 원하시나요?</h3> ${grOne.requestContent2Br}<br>
					</li>
					<li>
						<h3>원하는 숙련도의 개발자가 있으신가요?</h3> ${grOne.requestContent3Br}<br>
					</li>
					<li>
						<h3>기획은 어느 정도 되어있나요?</h3> ${grOne.requestContent4Br}<br>
					</li>
					<li>
						<h3>개발 내용과 참고 사항에 대해 상세히 알려주세요.</h3> ${grOne.requestContent7}<br>

					</li>
					<li>
						<h3>언제까지 작업이 완료되어야 하나요?</h3> ${grOne.requestContent5Br}<br>
					</li>
					<li>
						<h3>어떻게 진행하기 원하시나요?</h3> ${grOne.requestContent6Br}<br>
					</li>

				</ul>

			</div>


		</div>
		<div class="g-center">
			<c:if test="${not empty grcOne }">
				<span style="color : red;">이미 견적서를 보낸 요청서입니다.</span>
			</c:if>
		
		</div>
		<div class="g-center">
			<a class="btn btn-info upbtn"
				style="width: 200px; margin: 100px; padding: 10px; font-weight: 900;"
				onclick="history.back();">뒤로가기</a> 
				<c:if test="${empty grcOne }">
				<a class="btn btn-primary upbtn"
				id="costSendModal"
				style="width: 200px; margin: 100px; padding: 10px; font-weight: 900;">견적보내기</a>
				</c:if>
		</div>
		<div class="hrm-wrap" style="display: none; margin: 0;">
			<div id="hrm-modal">
				<div class="hrm-content">
					<br> <span>질문자에게 보낼 내용</span>
					<p style="margin-left: 40px;">질문자에게 고수님만의 능력을 어필해보세요!</p>
					<div class="g-style">
						<textarea rows="5" cols="100" id="contentSend" class="form-control" placeholder=" 내용을 입력하세요."></textarea>

					</div>
					<br> <span>견적비용</span>
					<div class="g-style">
						<input type="text" class="form-control" name="cost" id="costSend" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" placeholder=" 숫자만 입력하세요.">&nbsp;&nbsp;
						원 <input type="hidden" value="${grOne.requestNo }"
							id="requestNoSend"> <input type="hidden"
							value="${sessionScope.m.memberNo }" id="gosuNoSend">
							<input type="hidden" value="${grOne.requestWriterId}" id="memberIdSend">
					</div>
				</div>
				<div class="hrm-btn-wrap">

					<a id="costSendAjax" class="btn btn-success upbtn">확인</a> <a
						id="hrm-close" class="btn btn-outline-success upbtn">취소</a>
				</div>
			</div>
		</div>
	</div>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		$("#hrm-close").click(function() {
			$(".hrm-wrap").css("display", "none");
		});
		$("#costSendModal").click(function() {
			$(".hrm-wrap").css("display", "flex");
		});
		$("#costSendAjax").click(function() {
			var requestNo = $("#requestNoSend").val();
			var gosuNo = $("#gosuNoSend").val();
			var cost = $("#costSend").val();
			var content = $("#contentSend").val();
			var memberId = $("#memberIdSend").val();
			
			if(cost == "" || content == ""){
				swal({
			        title: '실패',
			        text: '입력하신 내용이 올바르지 않습니다.',
			        icon: 'error'
			      })
				return false;
				
			}
			$.ajax({
				url : "/gosuRequestCostInsert.do",
				data : {
					"requestNo" : requestNo,
					"gosuNo" : gosuNo,
					"cost" : cost,
					"content" : content,
					"memberId" : memberId
				},
				success : function(data) {
					if (data > 0) {
						swal({
					        title: '성공',
					        text: "견적서를 보냈습니다!",
					        icon: 'success'
					      }).then(function(){
					    	 window.location = "/gosuMain.do"; 
					      });
						
					} else {
						swal({
					        title: '실패',
					        text: "견적서를 보내지 못했습니다. 관리자에게 문의해주세요",
					        icon: 'error'
					      }).then(function(){
					    	 window.location = "/"; 
					      });
					}

				}
			});
		});
	</script>


	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>