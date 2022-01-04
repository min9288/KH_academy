<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공모 등록 페이지</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<style>
.container {
   min-width: 1200px; 
}
.titleBox{
		font-size: 30px;
		font-weight: bold;
		margin-bottom: 80px;
		margin-top:50px;
	}

.dateInput{
	float: left;
}
#dateTd{
	overflow: hidden;
}
#dateTd>span{
	float: left;
}
.submitBtn{
	width: 990px;
}
.prize{
	float: left;
}
#won{
	line-height: 35px;
	margin-left: 5px;
	font-size: 18px;
	font-weight: bold;
}


.insertForm>p{
	font-size: 20px;
	font-weight: bold;
	margin-right: 10px;
	margin-top: 15px;
}

.flexBox>p{
	font-size: 20px;
	font-weight: bold;
	margin-right: 10px;
	margin-top: 10px;

}
.flexBox{
	display:flex;
	align-items: center;
	margin-top: 20px;
}

</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container" style="margin-bottom: 100px; margin-left: 400px;">
		<div class="titleBox">
			<a href="/contestMain.do"><i class="bi bi-chevron-left"></i></a><span>공모전 등록</span>
		</div>
		<form action="/insertContest.do" method="post" enctype="multipart/form-data" class="insertForm">
			<div class="flexBox">
				<p><i class="bi bi-award" style="color:#4ECDC4"></i> 공모유형</p>
				<label style="margin-right:20px; font-weight: bold"><input type="radio" name="contestType" value="1" class="form-check-input" style="margin-right:5px;">기획</label> 
				<label style="margin-right:20px; font-weight: bold"><input type="radio" name="contestType" value="2" class="form-check-input" style="margin-right:5px;">개발</label> 
				<label  style="font-weight: bold"><input type="radio" name="contestType" value="3" class="form-check-input" style="margin-right:5px;">디자인</label>
				<p style="margin-left: 120px;"><i class="bi bi-check-lg" style="color:#4ECDC4"></i> 참가자격</p>
				<label style="margin-right:20px; font-weight: bold"><input type="checkbox" name="contestQualify" value="대학생" class="form-check-input" style="margin-right:5px;">대학생</label>
				<label style="margin-right:20px; font-weight: bold"><input type="checkbox" name="contestQualify" value="대학원생" class="form-check-input" style="margin-right:5px;">대학원생</label> 
				<label style="margin-right:20px; font-weight: bold"><input type="checkbox" name="contestQualify" value="고등학생"class="form-check-input" style="margin-right:5px;">고등학생</label> 
				<label style="margin-right:20px; font-weight: bold"><input type="checkbox" name="contestQualify" value="일반인" class="form-check-input" style="margin-right:5px;">일반인</label> 
				<label style="font-weight: bold"><input type="checkbox" name="contestQualify" value="제한없음" class="form-check-input" style="margin-right:5px;">제한없음</label>
			</div>
			<p><i class="bi bi-building" style="color:#4ECDC4"></i> 주최사</p><input type="text" id = "contestHost" name="contestHost" class="form-control" style="width:1000px;">
			<p><i class="bi bi-calendar-week" style="color:#4ECDC4"></i> 공모마감</p><input type="date" class="form-control" id="mindate" min="" name="contestDeadline" style="width: 1000px; height: 38px;">
			<p><i class="bi bi-trophy" style="color:#4ECDC4"></i> 1등 시상금</p><input type="text" name="contestPrize" class="form-control prize" style="width: 960px;" placeholder="숫자만 입력해주세요"><span id="won">만원</span>
			<p><i class="bi bi-envelope" style="color:#4ECDC4"></i> 담당자 이메일</p><input type="email" name="email" class="form-control" style="width:1000px;">
			<p><i class="bi bi-telephone" style="color:#4ECDC4"></i> 담당자 전화번호</p><input type="text" name="phone" class="form-control" placeholder="ex) 010-XXXX-XXXX" style="width:1000px;">
			<p><i class="bi bi-chat-square-quote" style="color:#4ECDC4"></i> 공모명</p><input type="text" id="contestTitle" name="contestTitle" class="form-control" style="width:1000px;">
			<p><i class="bi bi-pencil-square" style="color:#4ECDC4"></i> 공모요강</p>
			<textarea id="contestContent" name="contestContent" class="form-control" style="width:1000px; height: 600px;resize: none;"></textarea>
			<p><i class="bi bi-card-image" style="color:#4ECDC4"></i> 포스터 이미지</p>
			<input type="file" id="formFile" name="files" class="form-control" style="width:1000px;" accept=".gif, .jpg, .jpeg, .png">
			<p style="font-size: 16px; margin-bottom: 0px;">공모전은 관리자 승인 후 등록됩니다.</p>
			<p style="font-size: 16px; margin-top: 0px; color:#CE0000">(승인이 완료되면 삭제만 가능하니 한 번 더 확인해 주시길 바랍니다.)</p>
			<input type="button" class="btn btn-primary submitBtn" value="등록하기" style="width:1000px;">
		
			<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
		</form>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	
<script>
	
	//글자수 제한
	$('#contestContent').keydown(function(){
		 var length = $("#contestContent").val().length;

		 if($(this).val().length > 1000) {
			swal({
			  title: "글자수 초과",
			  text: "초과 입력 할 수 없습니다. 초과된 내용은 자동으로 삭제됩니다.",
			  icon: "warning",
			  buttons: true,
			})
        $(this).val($(this).val().substring(0, 1000));
			
		 }

	 })
	 
	 $('#contestTitle').keydown(function(){
		 var length = $("#contestTitle").val().length;
		 if($(this).val().length > 36) {
			swal({
			  title: "글자수 초과",
			  text: "초과 입력 할 수 없습니다. 초과된 내용은 자동으로 삭제됩니다.",
			  icon: "warning",
			  buttons: true,
			})
        $(this).val($(this).val().substring(0, 36));
			
		 }

	 })
	 
	 $('#contestHost').keydown(function(){
		 var length = $("#contestHost").val().length;
		 if($(this).val().length > 36) {
			swal({
			  title: "글자수 초과",
			  text: "초과 입력 할 수 없습니다. 초과된 내용은 자동으로 삭제됩니다.",
			  icon: "warning",
			  buttons: true,
			})
        $(this).val($(this).val().substring(0, 36));
			
		 }

	 })

	//접수기간 데드라인 선택은 오늘날짜부터 선택 가능
	$(function(){
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1;
		var yyyy = today.getFullYear();
		 if(dd<10){
		        dd='0'+dd
		    } 
		    if(mm<10){
		        mm='0'+mm
		    } 
		today = yyyy+'-'+mm+'-'+dd;
		document.getElementById("mindate").setAttribute("min", today);
	});

	//모두 입력해야 등록가능
	$(".submitBtn").click(function(){
		var radioCheck = $('input[name=contestType]').is(":checked");
		if(!radioCheck){
			swal({
				  title: "미입력 항목이 있습니다.",
				  text: "공모유형을 체크해주세요.",
				  icon: "warning",
				  buttons: true,
				})
			return;
		}
		var checkBoxCheck = $('input[name=contestQualify]').is(":checked");
		if(!checkBoxCheck){
			swal({
				  title: "미입력 항목이 있습니다.",
				  text: "참가자격을 체크해주세요.",
				  icon: "warning",
				  buttons: true,
				})
			return;
		}
		if($('input[name=contestHost]').val() == ""){
			swal({
				  title: "미입력 항목이 있습니다.",
				  text: "주최사를 입력해주세요.",
				  icon: "warning",
				  buttons: true,
				})
			return;
		}
		if($('input[name=contestDeadline]').val() == ""){
			swal({
				  title: "미입력 항목이 있습니다.",
				  text: "공모 마감 날짜를 선택해주세요.",
				  icon: "warning",
				  buttons: true,
				})
			return;
		}
		if($('input[name=contestPrize]').val() == ""){
			swal({
				  title: "미입력 항목이 있습니다.",
				  text: "시상금을 입력해주세요.",
				  icon: "warning",
				  buttons: true,
				})
			return;
		}
		
		//1등 시상금 유효성검사
		var numCheck = /^[0-9]*$/;
		if(!numCheck.test($('input[name=contestPrize]').val())){
			swal({
				  title: "잘못 입력하셨습니다.",
				  text: "시상금은 숫자만 입력 가능합니다.",
				  icon: "warning",
				  buttons: true,
				})
			return;
		}
		
		//이메일 유효성검사
		var emailReg = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/;
		if(!emailReg.test($('input[name=email]').val())){
			swal({
				  title: "잘못 입력하셨습니다.",
				  text: "이메일을 올바른 형태로 입력해주세요.",
				  icon: "warning",
				  buttons: true,
				})
			return;
		}
		
		if($('input[name=email]').val() == ""){
			swal({
				  title: "미입력 항목이 있습니다.",
				  text: "담당자 이메일을 입력해주세요.",
				  icon: "warning",
				  buttons: true,
				})
			return;
		}
		
		//전화번호 유효성 검사
		var phoneCheck = /^([0-9]{2,3})-([0-9]{3,4})-([0-9]{4})$/;
		if(!phoneCheck.test($('input[name=phone]').val())){
			swal({
				  title: "잘못 입력하셨습니다.",
				  text: "전화번호를 올바르게 입력해주세요.",
				  icon: "warning",
				  buttons: true,
				})
			return;
		}
		
		if($('input[name=contestTitle]').val() == ""){
			swal({
				  title: "미입력 항목이 있습니다.",
				  text: "공모명을 입력해주세요.",
				  icon: "warning",
				  buttons: true,
				})
			return;
		}
		
		if($('input[name=contestContent]').val() == ""){
			swal({
				  title: "미입력 항목이 있습니다.",
				  text: "공모요강을 입력해주세요.",
				  icon: "warning",
				  buttons: true,
				})
			return;
		}
		if($('input[name=files]').val() == ""){
			swal({
				  title: "포스터 미등록",
				  text: "공모전 포스터를 등록해주세요.",
				  icon: "warning",
				  buttons: true,
				})
			return;
		}
		
		//전부 입력됐으면 form data 전송
		$("form").submit();
	})
</script>
</body>
</html>