<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<style>
	.applyResume{
		overflow: hidden;
		border: 3px solid rgb(78, 205, 196);
		border-radius: 30px;
		padding: 30px 20px;
	}
	.applyResume>div{
		float: left;
	}
	#pageNavi{
		display: flex;
		justify-content: center;
		margin: 50px 0px;
	}
	.memberBox{
			width: 300px;
			height: 250px;
			padding: 20px 30px;
			border: 1px solid gray;
			display: inline-block;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			margin-right: 50px;
			margin-bottom: 50px;
		}
		.okNo{
			text-align: center;
			padding-top: 20px;
		}
		.resumeTitle{
			width: 208px;
			text-overflow: ellipsis;
			font-size: 18px;
		}
		.certiBox{
			margin-top: 60px;
			margin-bottom: 80px;
			padding-left: 150px;
		}
		.enrollForm{
			margin-top: 10px;
		}
</style>
<script>
$(function(){
	//합격 클릭 시
	$(".enrollBtn").click(function(){
		var index = $(".enrollBtn").index(this);
		swal({
			title: "이력서 합격",
			text: "선택한 이력서를 합격하시겠습니까?",
			icon: "success",
			buttons: true,
			dangerMode: true,
		})
		.then((willDelete) => {
			if (willDelete) {
				$(".enrollForm").eq(index).submit();	
			}
		});
		
		/* 쪽지 */
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
	})

	//탈락 클릭 시
	$(".noEnrollBtn").click(function(){
		var index = $(".noEnrollBtn").index(this);
		var memberNo = $("[name=memberNo]").eq(index).val();
		var appNo = $("[name=appNo]").eq(index).val();
		var announceNo = $("[name=announceNo]").eq(index).val();
		swal({
			title: "이력서 탈락",
			text: "선택한 이력서를 탈락 처리하시겠습니까?",
			icon: "warning",
			buttons: true,
			dangerMode: true,
		})
		.then((willDelete) => {
			if (willDelete) {
				location.href="/noAnnounce.do?memberNo="+memberNo+"&appNo="+appNo+"&announceNo="+announceNo;	
			}
		});
	})
});
</script>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="container" style="margin-top:50px;margin-bottom:100px;">
			<div class="mainCate">
				<span style="font-weight:bold">지원내역</span>
			</div>
			<br><br>
			<p id="unprocessed">입사 지원 수 : <span style="color: rgb(78, 205, 196);">${count }</span> 건</p>
			
			<c:choose>
			<c:when test="${not empty list }">
				<div class="certiBox">
					<c:forEach items="${list }" var="a" varStatus="i">
						<div class="memberBox">
							
								<a href="/rView.do?resumeNo=${a.resumeNo }" target="_blank"><strong class="resumeTitle">${a.resumeTitle }</strong></a>
							
							<div class="infoBox">
								<form action="/okAnnounce.do" class="enrollForm">
									 <span class="infoTitle"><i class="bi bi-person-fill" style="font-size: 20px; color: #898989; margin-right: 5px;"></i>회원이름 : </span><span>${a.memberName }</span><br>
									 <span class="infoTitle"><i class="bi bi-envelope" style="font-size: 20px; color: #898989; margin-right: 5px;"></i>이메일 : </span><span>${a.email }</span><br>
									 <span class="infoTitle"><i class="bi bi-app" style="font-size: 20px; color: #898989; margin-right: 5px;"></i>상태 : </span><span>
									 <c:if test="${a.status eq 1 }">
									 	<span>지원중</span>
									 </c:if>
									 <c:if test="${a.status eq 2 }">
									 	<span style="color: #4876ef;">합격</span>
									 </c:if>
									 <c:if test="${a.status eq 3 }">
									 	<span style="color: red">탈락</span>
									 </c:if>
									 </span><br>
									 <input type="hidden" name="memberNo" value="${a.memberNo }">
									 <input type="hidden" name="announceNo" value="${a.announceNo }">
									 <input type="hidden" name="appNo" value="${a.appNo }">
									 
									 <!-- 쪽지 -->
									 <input type="hidden" class="receiver" value="${a.memberId }">
									 <input type="hidden" class="sender" value="admin">
									 <input type="hidden" class="dmContent" value="[구인구직] 합격하신 입사지원서가 있습니다. 마이페이지 > 입사신청 내역에서 확인하세요.">
								 </form>
								 
							</div>
							<c:choose>
								<c:when test="${a.status eq 1 }">
									<div class="okNo">
										<button class="btn btn-primary enrollBtn" style="margin-top: 20px; margin-right: 5px;">서류합격</button><button class="btn btn-secondary noEnrollBtn"  style="margin-top: 20px; margin-left: 5px;">탈락</button>
									</div>
								</c:when>
								<c:when test="${a.status eq 2 }">
									<div class="okNo">
										<!-- 합격 -->
									</div>
								</c:when>
								<c:otherwise>
									<div class="okNo">
										<!-- 탈락 -->
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</c:forEach>
				</div>
				<div id="pageNavi" style="text-align: center; margin-top:50px;"  >${pageNavi }</div>
			</c:when>
			<c:otherwise>
				<div class="noList">
					<p><i class="bi bi-chat-square-dots" style="color: #4ECDC4; font-size: 35px;"></i></p>
					<p>지원한 이력서가 없습니다.</p>
				</div>
			</c:otherwise>
		</c:choose>
			
			
			<%-- <div id="pageNavi">${pageNavi }</div> --%>
		</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>