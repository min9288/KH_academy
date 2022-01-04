<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공모전 등록 상세보기</title>
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
#allMember{
	font-size: 25px;
	line-height: 46px;
}
.bi{
	font-size:30px;
}
#imgBox{
	text-align: center;
	
}
#imgBox>img{
	width: 450px;
	height: 600px;
	box-shadow: 0px 1px 5px -2px rgb(0 0 0 / 20%), 0px 0px 4px 0px rgb(0 0 0 / 14%), 0px 1px 10px 0px rgb(0 0 0 / 12%);
}
.titleBefore{
    border-radius: 2px;
    width: 800px;
    margin : 0 auto;
    margin-top: 20px;
    
}
.titleBefore>span:first-child{

	font-size: 20px;
	font-weight: bold;
}
.titleBefore>span:nth-of-type(2){
	margin-left: 40px;
	font-size: 20px;

}
#infoBox{
	margin-top: 100px;
}
.contestContent{
	 width: 800px;
	 margin : 0 auto;
	 margin-top: 30px;
	 background-color: rgba(78,205,196,0.05);
	 padding: 20px;
	 font-size: 17px;
	 border-radius: 4px;
}
.btnBox{
	width: 800px;
	 margin : 0 auto;
	 margin-top: 30px;	 
	 display: flex;
	 justify-content: space-around;
}
.btnBox>form>button{
	width: 300px;
	font-weight: 600;
}

</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
		<div class="container" style="margin-top:50px;margin-bottom:100px;">
			<div class="mainCate">
				<a href="/adminPage.do" class="cateAtag"><i class="bi bi-chevron-left"></i></a> 
				<span id="allMember" style="font-weight:bold">공모전 등록 내역</span>
			</div>
		<br><br><br>
		
		<%--공모전 이미지 --%>
		<div id="imgBox">
			<img src="/resources/img/contest/${c.contestImg }">
		</div>
		
		<%--공모전 상세 내역 --%>
		<div id="infoBox">
			<div class="titleBefore">
				<span><i class="bi bi-check2" style="color : #4ECDC4"></i> 주최</span> 
				<span>${c.contestHost }</span>
			</div>
			<div class="titleBefore">
				<span><i class="bi bi-check2" style="color : #4ECDC4"></i> 공모유형</span> 
				<c:choose>
					<c:when test="${c.contestType == 1 }">
						<span>기획</span>
					</c:when>
					<c:when test="${c.contestType == 2 }">
						<span>개발</span>
					</c:when>
					<c:when test="${c.contestType == 3 }">
						<span>디자인</span>
					</c:when>
				</c:choose>
			</div>
			<div class="titleBefore">
				<span><i class="bi bi-check2" style="color : #4ECDC4"></i> 참가자격</span> 
				<span>${c.contestQualify }</span>
			</div>
			<div class="titleBefore">
				<span><i class="bi bi-check2" style="color : #4ECDC4"></i> 접수 기간</span> 
				<span>${c.contestDate } ~ ${c.contestDeadline }</span>
			</div>
			<div class="titleBefore">
				<span><i class="bi bi-check2" style="color : #4ECDC4"></i> 1등 시상금</span> 
				<span>${c.contestPrize } 만원</span>
			</div>
			<div class="titleBefore">
				<span><i class="bi bi-check2" style="color : #4ECDC4"></i> 담당자 이메일</span> 
				<span>${c.email } </span>
			</div>
			<div class="titleBefore">
				<span><i class="bi bi-check2" style="color : #4ECDC4"></i> 담당자 전화번호</span> 
				<span>${c.phone } </span>
			</div>
			<div class="titleBefore">
				<span><i class="bi bi-check2" style="color : #4ECDC4"></i> 공모명</span> 
				<span>${c.contestTitle } </span>
			</div>
			<div class="titleBefore">
				<span><i class="bi bi-check2" style="color : #4ECDC4"></i> 공모요강</span> 
			</div>
			<div class="contestContent">
				<span>${c.contestContentBr }</span> 
			</div>
			<div style="text-align: center; margin-top: 10px; font-size: 18px; font-weight: bold; color:#EA0000">
				<p>※ 공모 승인시 공모전 게시판에 등록됩니다.</p>
			</div>
			<div class="btnBox">
				<form action="/contestOK.do" id="contestOKFrm">
					<button type="button" class="btn btn-primary btn-lg conOK">공모 승인</button>
					<input type="hidden" name="contestNo" value="${c.contestNo }">
				</form>
				<form action="/contestNO.do" id="contestNOFrm">
				 	<button type="button" class="btn btn-secondary btn-lg conNo">공모 반려</button>
				 	<input type="hidden" name="contestNo" value="${c.contestNo }">
				</form>
			</div>
		</div>
		
		
		
		
		
		</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	<script>
		$(".conOK").click(function(){
	 		swal({
	 			  title: "공모 승인",
	 			  text: "해당 공모를 승인하시겠습니까?",
	 			  icon: "warning",
	 			  buttons: true,
	 			  dangerMode: true,
	 			})
	 			.then((willDelete) => {
	 			  if (willDelete) {
	 				 $("#contestOKFrm").submit();	
	 			  }
	 			});
	 	})
	 	
	 	$(".conNo").click(function(){
	 		swal({
	 			  title: "공모 반려",
	 			  text: "해당 공모를 반려하시겠습니까?",
	 			  icon: "warning",
	 			  buttons: true,
	 			  dangerMode: true,
	 			})
	 			.then((willDelete) => {
	 			  if (willDelete) {
	 				 $("#contestNOFrm").submit();	
	 			  }
	 			});
	 	})
	
	</script>
</body>
</html>