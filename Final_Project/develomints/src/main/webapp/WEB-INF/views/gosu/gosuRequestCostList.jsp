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
</head>
<style>
.container * {
	text-decoration: none;
	color: black;
}

.container {
	min-width: 1200px;
	margin-bottom: 100px;
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

.requestList {
	display: flex;
	justify-content: center;
	margin-top: 100px;
	margin-bottom: 50px;
}

.requestList * {
	padding: 20px;
}

.requestList>table {
	width: 100%;
}

.requestList>table>tbody>tr>td {
	padding: 0;
	display: flex;
	justify-content: center;
}

.g-one-tbl img {
	border-radius: 50%;
	width: 150px;height: 150px;
	padding: 0;
	box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);
}

.g-one-tbl {
	width: 90%;
	margin-bottom: 50px;
	border: 3px solid rgb(235, 242, 235);
}

.g-one-tbl:hover {
-webkit-transform: scale(1.03);
    transform: scale(1.03);
   
}

.upbtn {
	box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);
}

.upbtn:hover {
-webkit-transform: scale(1.03);
    transform: scale(1.03);
}

.g-one-tbl th {
	width: 200px;
}

.g-one-tbl td {
	padding-right: 50px;
	text-align: center;
}

#pageNavi {
	display: flex;
	justify-content: center;
}

.g-style {
	text-align: center;
	margin: 10px;
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
	font-size: 20px;
	font-weight: 900;
}

.hrm-content input {
	border: none;
	background: transparent;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}

.hrm-content td {
	font-size: 20px;
	font-weight: 900;
	width: 600px;
}

.hrm-content th {
	font-size: 20px;
	font-weight: 900;
	width: 200px;
}

.req-wrap {
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

#req-modal {
	background-color: rgb(235, 242, 235);
	width: 800px;
	padding: 30px;
}

.req-btn-wrap {
	width: 100%;
	display: flex;
	justify-content: center;
}

.req-btn-wrap a {
	margin: 20px;
	padding: 10px;
	width: 100px;
}

.req-content span {
	font-size: 20px;
	font-weight: 900;
}

.req-content input {
	border: none;
	background: transparent;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}

.req-content td {
	font-size: 20px;
	font-weight: 900;
	width: 600px;
}

.req-content th {
	font-size: 20px;
	font-weight: 900;
	width: 200px;
}

.g-req-box {
	border: 3px solid rgb(70, 147, 127);
	background-color: white;
	border-radius: 30px;
}


.g-req-box li {
	padding: 10px;
	margin: 10px;
	list-style-type: none;
}

.g-req-box h6 {
	font-weight: 900;
	color: rgb(70, 147, 127);
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<h3>
			<span style="color: rgb(78, 205, 196);">고수에게 </span> &nbsp;받은 견적서
		</h3>

		<div class="requestList">
			<c:choose>
				<c:when test="${empty memberRequestCostList }">

					<div style="padding: 20px; text-align: center;">
						<img src="/resources/img/member/user.png"
							style="border-radius: 50%; width: 120px; margin-top: 70px;">
						<h2
							style="color: gray; font-size: 30px; font-weight: 900; line-height: 100px;margin-bottom: 100px;">아직
						도착한 견적서가 없어요!</h2>
					</div>
				

				</c:when>
				<c:otherwise>

					<table>



						<c:forEach items="${memberRequestCostList }" var="mrcl"
							varStatus="i">
							<tr>
								<td>
									<table class="g-one-tbl">
										<tr>
											<th rowspan="3" style="padding-right: 0;text-align: right;"><c:if test="${empty mrcl.gosuImg }">
													<img src="/resources/img/gosu/g_img_basic.png">
												</c:if> <c:if test="${not empty mrcl.gosuImg }">
													<img src="/resources/upload/member/${mrcl.gosuImg}">
												</c:if></th>
											<th><span
												style="color: rgb(78, 205, 196); padding: 0; padding-right: 10px;">고수</span>${mrcl.gosuId }</th>
											<td style="text-align: right;">${mrcl.costDate }</td>
										</tr>
										<tr>
											<td colspan="2" style="max-width: 1000px;"><span
												style="width: 100%; color: gray;">${mrcl.costContentPlus }</span></td>

										</tr>
										<tr>
											<th>비용 <span style="color: red; padding: 0;">${mrcl.cost}</span>원
											</th>
											<td style="display: flex; justify-content: right;">
												<button type="button"
													onclick="gosuRequestAjax(${mrcl.costNo});"
													class="btn btn-info upbtn"
													style="width: 150px; margin-right: 15px;">보낸 요청서</button>
												<button type="button"
													onclick="gosuProjectJSPAjax(${mrcl.costNo});"
													class="btn btn-primary upbtn" style="width: 150px;">진행하기</button>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</c:forEach>
					</table>

				</c:otherwise>
			</c:choose>
		</div>
		<div class="hrm-wrap" style="display: none; margin: 0;">
			<div id="hrm-modal">
				<div class="hrm-content">
					<br>&nbsp;&nbsp;&nbsp;&nbsp; <span
						style="color: #56cc9d; font-size: 30px;">결제하시겠습니까?</span> <br>
					<br> <br>
					<div class="g-style">
						<table>
							<tr>
								<th><span style="color: rgb(78, 205, 196);">고수</span></th>
								<td><input type="text" id="gosuIdSend" disabled></td>
							</tr>
							<tr>
								<th>날짜</th>
								<td><input type="text" id="costDateSend" disabled>
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea id="contentSend" disabled  class="form-control"
										></textarea></td>
							</tr>
							<tr>
								<th>견적비용</th>
								<td><input type="text" id="costSend"
									style="color: red; font-weight: 900; font-size: 25px;" disabled>원</td>
								<input type="hidden" id="requestNo">
								<input type="hidden" id="costNo">
								<input type="hidden" id="ggmemberId">
								<input type="hidden" id="ggcostContent">


							</tr>
						</table>
					</div>

				</div>
				<div class="hrm-btn-wrap">

					<a id="projectCostAjax" class="btn btn-success upbtn">결제 진행</a> <a
						id="hrm-close" class="btn btn-outline-success upbtn">취소</a>
				</div>
			</div>
		</div>
		<div class="req-wrap" style="display: none; margin: 0;">
			<div id="req-modal">
				<div class="req-content">

					<div class="g-style g-req-box"></div>

				</div>
				<div class="req-btn-wrap">
					<a id="req-close" class="btn btn-outline-success upbtn">확인</a>
				</div>
			</div>
		</div>

		<div id="pageNavi">${pageNavi }</div>
	</div>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		function gosuRequestAjax(costNo){
			$.ajax({
				url : "/gosuMemberRequestAjax.do",
				data : {
					"costNo" : costNo
				},
				success : function(data) {
					$(".g-req-box").empty();
					var html="";
					html+="<ul style='padding: 0;'>";
					html+="<li><h6>어떤 플랫폼을 원하시나요?</h6>"+data.requestContent1Br+"<br></li><li>";
					html+="<h6>어떤 종류의 개발을 원하시나요?</h6>"+data.requestContent2Br+"<br></li><li>";
					html+="<h6>원하는 숙련도의 개발자가 있으신가요?</h6>"+data.requestContent3Br+"<br></li><li>";
					html+="<h6>기획은 어느 정도 되어있나요?</h6>"+data.requestContent4Br+"<br></li><li>";
					html+="<h6>개발 내용과 참고 사항에 대해 상세히 알려주세요.</h6>"+data.requestContent7+"<br>";
					html+="</li><li><h6>언제까지 작업이 완료되어야 하나요?</h6>"+data.requestContent5Br+"<br></li><li>";
					html+="<h6>어떻게 진행하기 원하시나요?</h6>"+data.requestContent6Br+"<br></li></ul>";
					$(".g-req-box").append(html);
					$('body').css("overflow", "hidden");
					$('.req-wrap').css("overflow", "scroll");
					$(".req-wrap").css("display", "flex");
					
				}
	
		});
		};
		$("#req-close").click(function() {
			$(".req-wrap").css("display", "none");
			$('body').css("overflow", "scroll");
		});
		$("#hrm-close").click(function() {
			$(".hrm-wrap").css("display", "none");
		});
		function gosuProjectJSPAjax(costNo){
			$(".hrm-wrap").css("display", "flex");
			$.ajax({
				url : "/selectGosuRequestCost.do",
				data : {
					"costNo" : costNo
				},
				success : function(data) {
					$("#costSend").val(data.cost);
					$("#contentSend").val(data.costContentBr);
					$("#gosuIdSend").val(data.gosuId);
					$("#costDateSend").val(data.costDate);

					$("#costNo").val(data.costNo);
					$("#requestNo").val(data.requestNo);
					$("#ggmemberId").val(data.memberId);
					$("#ggcostContent").val(data.costContent);
				}
			});
			
			
		};

		$("#projectCostAjax").click(function(){
			
			var gfTitle = $("#ggcostContent").val();
			var mId = $("#ggmemberId").val();
			 var cost = $("#costSend").val();
			 if(gfTitle.length >= 10){
				    gfTitle = gfTitle.substr(0,10)+"...";
			};

			var IMP = window.IMP;
			  IMP.init('imp37172515');
			IMP.request_pay({
			    pg : 'kakao', 
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : gfTitle,
			    amount : cost, //판매 가격
			    buyer_name : mId
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
						var costNo = $("#costNo").val();
						var requestNo = $("#requestNo").val();
						
			   		 $.ajax({
						url : "/gosuRequestProjectSubAjax.do"
						, type : "post"
						, data : {

							"requestNo" : requestNo,
							"costNo" : costNo,
							}
						, success : function(data) {
							swal({
					            title: '성공',
					            text: '개발을 진행하세요',
					            icon: 'success'
					          });
							location.href="/gosuMain.do"
						}
				 });
			    } else {
			       
			        swal({
			            title: '실패',
			            text: '에러 : '+rsp.error_msg,
			            icon: 'error'
			          });
			    }
			    
			
			
		});
		});
		
		
	</script>

	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>