<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 회원 처리</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<style>
.container {
   min-width: 1200px; 
}
.mainCate{
	display:flex;
}
#reportMember{
	font-size: 25px;
	line-height: 46px;
}
.bi{
	font-size:30px;
}
.reportBox{
	display: flex;
	margin-bottom: 30px;
}
.reportList>div>div{
	border: 1px solid #d9d9d9;
	box-shadow: 0px 2px 1px -1px rgb(0 0 0 / 20%), 0px 1px 1px 0px rgb(0 0 0 / 14%), 0px 1px 8px 0px rgb(0 0 0 / 12%);
	width: 550px;
	padding: 15px;
	margin-bottom: 10px;
}
.reportContent>div{
	margin-left:20px;
	border: 3px solid #f8f9fc;
	box-shadow: 0px 2px 1px -1px rgb(0 0 0 / 20%), 0px 1px 1px 0px rgb(0 0 0 / 14%), 0px 1px 8px 0px rgb(0 0 0 / 12%);
	padding: 20px;
	padding-left: 50px;
	padding-top: 30px;
	width: 725px;
}
.rc_title{
	font-weight: bold;
	font-size: 20px;
}
.reportList>div>div>p{
	font-weight: bold;
}
.reportDate{
	float: right;
	margin-right: 7px;
}
.spanBox{
	text-align: center;
	font-weight: bold;
}
.btnBox>div{
	text-align: center;
	margin-top: 15px;
	display: flex;
	justify-content : center;
}
.reportMember{
	border: 1px solid #d9d9d9;
	padding: 20px;
}
.badge-primary{
	background-color: #78c2ad;
}
.badge-secondary{
	background-color: #f3969a;
}
#noReport{
	border : 1px solid #d9d9d9;
	width: 1273px;
	margin-left : 20px;
	text-align: center;
	padding-top:250px;
}
#noReport>p{
	font-size: 25px;
	font-weight: bold;
}
.bi-person-x-fill{
	font-size: 70px;
	color : #4ECDC4;
}
.falseReportForm{
	text-align: center;
}
.selectBox{
  transition: all .2s cubic-bezier(0.77, 0, 0, 0);
}
.title{
	font-weight: bold;
	margin-bottom : 30px;
	background-color: #f8f9fc;
	height: 40px;
	padding-left: 10px;
	line-height: 40px;
	color:#1A1B3D;
}
.reportGuide{
	padding : 5px;
	box-shadow: 1px 2px 10px 0 rgb(0 0 0 / 15%);
	border-radius: 10px;
	position: fixed;
	right: 120px;
	font-weight: bold;
	font-size: 18px;
	display:flex;
	align-items: center;
	color:#4ECDC4;
	animation: motion 0.3s linear 0s infinite alternate;
}

@keyframes motion 
{ 0% {margin-top: 0px;}
100%{margin-top:5px;}}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container" style="margin-top:50px;margin-bottom:100px;">
		<!-- 관리자 신고가이드 -->
		<div class="reportGuide" data-bs-toggle="modal" data-bs-target="#guideModal">
			<i class="bi bi-info-circle" style="font-size: 23px; margin-right: 5px;"></i>
			<p style="margin:0">신고 가이드</p>
		</div>
		
		<!-- 신고가이드 Modal -->
		<div class="modal fade" id="guideModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
		  <div class="modal-dialog">
		    <div class="modal-content" style="border-radius: 0.3rem;">
		      <div class="modal-body">
		      		<img src="/resources/img/admin/guideReport.png" width="465px;">
		      </div>
		    </div>
		  </div>
		</div>
		
		<div class="mainCate">
		<a href="/adminPage.do" class="cateAtag"><i class="bi bi-chevron-left"></i></a> 
		<span id="reportMember" style="font-weight:bold">신고 회원 처리</span>
		</div>
		<br><br><br>
		
	
		<p class="title">신고 조회/처리</p>
		<div class="reportBox">
			<div class="reportList">
				<c:choose>
					<c:when test="${totalCount != 0}">
						<div style="height: 650px;">
							<c:forEach items="${reportList }" var="r" varStatus="i">
								<c:if test="${r.reportStatus == 1 }">
									<div class="selectBox">
										<c:choose>
											<c:when test="${r.reportReason == 1 }">
												<p>영리목적/홍보성</p>
											</c:when>
											<c:when test="${r.reportReason == 2 }">
												<p>음란성/선정성</p>
											</c:when>
											<c:when test="${r.reportReason == 3 }">
												<p>불법정보</p>
											</c:when>
											<c:when test="${r.reportReason == 4 }">
												<p>같은 내용 반복 게시(도배)</p>
											</c:when>
											<c:when test="${r.reportReason == 5 }">
												<p>욕설/인신공격</p>
											</c:when>
											<c:when test="${r.reportReason == 6 }">
												<p>개인정보누출</p>
											</c:when>
											<c:when test="${r.reportReason == 7 }">
												<p>기타</p>
											</c:when>
										</c:choose>
										<span class="memId">${r.commentId }</span><span class="reportDate">${r.reportDate }</span>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<div id="pageNavi" style="text-align: center; margin-top:50px; border: 0px"  >${pageNavi }</div>
						</c:when>
						<c:otherwise>
							<div style="height: 650px;" id="noReport">
								<p><i class="bi bi-person-x-fill"></i></p>
								<p>신고된 회원이 없습니다.</p>
							</div>
						</c:otherwise>
					</c:choose>
			</div>
			<c:forEach items="${reportList }" var="r" varStatus="i">
			<div class="reportContent" style="display:none">
				<div>
					<p class="rc_title"><i class="bi bi-check2"></i> 신고회원 확인</p>
					<br>
					<p>신고자 : ${r.reporterId }</p>
					<p>신고당한 회원 : <span class="id">${r.commentId }</span></p>
					<p>신고일 : ${r.reportDate }</p>
					<br>
					<br>
					<p class="rc_title"><i class="bi bi-check2"></i> 신고사유</p>
					<br>
					<c:choose>
						<c:when test="${r.reportReason == 1 }">
							<p>영리목적/홍보성</p>
						</c:when>
						<c:when test="${r.reportReason == 2 }">
							<p>음란성/선정성</p>
						</c:when>
						<c:when test="${r.reportReason == 3 }">
							<p>불법정보</p>
						</c:when>
						<c:when test="${r.reportReason == 4 }">
							<p>같은 내용 반복 게시(도배)</p>
						</c:when>
						<c:when test="${r.reportReason == 5 }">
							<p>욕설/인신공격</p>
						</c:when>
						<c:when test="${r.reportReason == 6 }">
							<p>개인정보누출</p>
						</c:when>
						<c:when test="${r.reportReason == 7 }">
							<p>기타사유 : ${r.commentContent }</p>
						</c:when>
					</c:choose>
					<br>
					<br>
					<p class="rc_title"><i class="bi bi-check2"></i> 댓글내용</p>
					<br>
					<p>${r.commentContent }</p>
					<br><br>
					<div class="spanBox">
					<span class="rpId"></span><span> 회원은 총 </span><span class="rpCount"></span><span>번 신고를 당했습니다.</span>
					</div>
					<div class="btnBox">
					<div>
					<form action="/cancleReport.do" method="post" class="cancleReportForm">
						<button type="button" class="btn btn-secondary canselReport" style="width:250px; margin:3px">신고반려</button>
						<input type="hidden" name="reportNo" value="${r.reportNo }" class="">
					</form> 
					<form action="/reportInsert.do" method="post" class="reportBtnForm">
						<button type="button" class="btn btn-primary reportBtn" style="width:250px; margin:3px">신고 처리</button>
						<input type="hidden" name="reportNo" value="${r.reportNo }">
						<input type="hidden" name="memberId" value="${r.commentId }">
					</form>
					</div>
					<form action="/falseReport.do" method="post" class="falseReportForm">
						<button type="button" class="btn btn-outline-primary falseBtn"style="width:500px; margin-top:10px">허위 신고</button>
						<input type="hidden" name="reportNo" value="${r.reportNo }">
						<input type="hidden" name="memberId" value="${r.reporterId }">
					</form> 
					</div>
				</div>
			</div>
			<div style="display: none">
				<input type="hidden" class="receiver" value="${r.commentId }">
				<input type="hidden" class="sender" value="admin">
				<input type="hidden" class="dmContent" value="[경고] 회원님은 현재 4회 신고 처리되었습니다. 5회 누적 시 사이트 이용이 제한됩니다.">
			</div>
			</c:forEach>
		</div>	
		<p class="title" style="margin-top: 50px;">최근 처리 내역</p>
		<div class="reportMember">
				<div>
					<table class="table">
						<tr>
							<th>처리상태</th>
							<th>신고자</th>
							<th>신고당한 회원</th>
							<th>신고사유</th>
							<th>신고처리 날짜</th>
						</tr>
						<c:forEach items="${report5List }" var="r" varStatus="i">
						<tr>
							<c:choose>
								<c:when test="${r.reportStatus == 2 }">
									<td><span class="badge badge-primary">신고처리</span></td>
								</c:when>
								<c:when test="${r.reportStatus == 3 }">
									<td><span class="badge badge-secondary">신고반려</span></td>
								</c:when>
								<c:when test="${r.reportStatus == 4 }">
									<td><span class="badge badge-light" style="color:#78c2ad; border:1px solid #78c2ad">허위신고</span></td>
								</c:when>
							</c:choose>
							<td>${r.reporterId }</td>
							<td>${r.commentId }</td>
							<c:choose>
								<c:when test="${r.reportReason == 1 }">
									<td>영리목적/홍보성</td>
								</c:when>
								<c:when test="${r.reportReason == 2 }">
									<td>음란성/선정성</td>
								</c:when>
								<c:when test="${r.reportReason == 3 }">
									<td>불법정보</td>
								</c:when>
								<c:when test="${r.reportReason == 4 }">
									<td>같은 내용 반복 게시(도배)</td>
								</c:when>
								<c:when test="${r.reportReason == 5 }">
									<td>욕설/인신공격</td>
								</c:when>
								<c:when test="${r.reportReason == 6 }">
									<td>개인정보누출</td>
								</c:when>
								<c:when test="${r.reportReason == 7 }">
									<td>기타사유 : ${r.commentContent }</td>
								</c:when>
							</c:choose>
							<td>${r.enrollDate}</td>
						</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	 <script>
	 
	 	//ajax로 회원의 신고 횟수 가져오기
	 	$(".selectBox").click(function(){
	 		var index = $(".selectBox").index(this);
	 		$(".selectBox").css("border","1px solid #d9d9d9");
	 		$(".selectBox").css("background-color","#fff");
	 		$(".selectBox").eq(index).css("border","3px solid #4ECDC4");
	 		$(".selectBox").eq(index).css("background-color","rgba(78,205,196,0.05)");
	 		$(".reportContent").hide();
	 		var index = $(this).index();
	 		$(".reportContent").eq(index).css("display","block");
	 		var id = $(".id").eq(index).html();
	 		
	 		$.ajax({
	 			url : "/memberReportCount.do",
				type : 'post',
				data : {id:id},
				success : function(data){
					$(".rpId").html(id);
					$(".rpCount").html(data);
				
				}
	 		})
	 	});
	 	
	 	//페이지 들어올 때 제일 상단 신고내역 클릭
	 	$(".selectBox").eq(0).trigger("click");
	 	 
	 	//신고 반려 클릭 시
	 	$(".canselReport").click(function(){
	 		var index = $(".canselReport").index(this);
	 		swal({
	 			  title: "신고반려",
	 			  text: "해당 신고를 반려처리 하시겠습니까?",
	 			  icon: "warning",
	 			  buttons: true,
	 			  dangerMode: true,
	 			})
	 			.then((willDelete) => {
	 			  if (willDelete) {
	 				 $(".cancleReportForm").eq(index).submit();	
	 			  }
	 			});
	 	})
	 	
	 	//신고 처리 클릭 시
	 	$(".reportBtn").click(function(){
	 		var index = $(".reportBtn").index(this);
	 		var rpCount = $(".rpCount").eq(index).html();
	 		//신고 횟수가 4번일 때
	 		if(rpCount == 4){
	 			swal({
		 			  title: "신고처리(로그인차단)",
		 			  text: "해당회원을 신고처리 하시면 로그인이 차단됩니다. 신고처리 하시겠습니까?",
		 			  icon: "warning",
		 			  buttons: true,
		 			  dangerMode: true,
		 			})
		 			.then((willDelete) => {
		 			  if (willDelete) {
		 				 $(".reportBtnForm").eq(index).submit();	
		 			  }
		 			});
	 		//신고 횟수가 5번 이상일 때
	 		}else if(rpCount >= 5){
	 			swal({
		 			  title: "차단회원 신고처리",
		 			  text: "이미 차단된 회원입니다. 신고처리 하시겠습니까?",
		 			  icon: "warning",
		 			  buttons: true,
		 			  dangerMode: true,
		 			})
		 			.then((willDelete) => {
		 			  if (willDelete) {
		 			   $(".reportBtnForm").eq(index).submit();	
		 			  }
		 			});
	 		}else if(rpCount == 3){
	 			swal({
		 			  title: "신고처리",
		 			  text: "해당 회원을 신고처리 하시겠습니까? 신고 처리 후 메시지를 전송합니다.",
		 			  icon: "warning",
		 			  buttons: true,
		 			  dangerMode: true,
		 			})
		 			.then((willDelete) => {
		 			  if (willDelete) {
		 			   $(".reportBtnForm").eq(index).submit();
						
		 			  	var receiver = $(".receiver").eq(index).val();
		 				var dmContent = $(".dmContent").eq(index).val();
		 				var sender = $(".sender").eq(index).val();
		 				
		 				$.ajax({
		 					url : "/sendDm.do",
		 					data : {receiver:receiver,dmContent:dmContent,sender:sender},
		 					success : function(data) {
		 						if(data == 1){
		 							dmCount(receiver);
		 						}
		 					}
		 				});
		 				
		 			  }
		 			});
	 		}else{
	 			swal({
		 			  title: "신고처리",
		 			  text: "해당 회원을 신고처리 하시겠습니까?",
		 			  icon: "warning",
		 			  buttons: true,
		 			  dangerMode: true,
		 			})
		 			.then((willDelete) => {
		 			  if (willDelete) {
		 			   $(".reportBtnForm").eq(index).submit();	
		 			  }
		 			});
	 		}
	 	})
	 	
	 	//허위신고
	 	$(".falseBtn").click(function(){
	 		var index = $(".falseBtn").index(this);
	 		swal({
	 			  title: "허위 신고",
	 			  text: "해당 신고를 허위신고로 처리하시겠습니까?",
	 			  icon: "warning",
	 			  buttons: true,
	 			  dangerMode: true,
	 			})
	 			.then((willDelete) => {
	 			  if (willDelete) {
	 				 $(".falseReportForm").eq(index).submit();	
	 			  }
	 			});
	 	})
	 </script>
</body>
</html>