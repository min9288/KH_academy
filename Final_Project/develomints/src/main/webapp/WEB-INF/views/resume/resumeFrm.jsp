<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Develomint</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<style>
	.contain{
		width: 1000px;
		margin: 0 auto;
		margin-top: 100px;
		margin-bottom: 100px;
	}
	.grayBox{
		width: 1000px;
		margin: 0 auto;
		background-color: rgb(250, 250, 250);
		padding: 30px;
		overflow: hidden;
		margin-top: 15px;		
		margin-bottom: 80px;
	}
	em{
		float: left;
		font-style: normal;
		font-weight: 900;
		font-size: 20px;
		margin-bottom: 15px;
	}
	b{
		color: rgb(51, 51, 51);
		float: left;
		font-size: 14px;
		line-height: 40px;
		margin-left: 10px;
		width: 80px;
	}
	span{
		color: red;
	}
	#name{
		color: black;
		font-weight: 900;
		font-size: 24px;
		padding-left: 20px;
		padding-bottom: 10px;
		
	}
	.infoType{
		float: left;
		margin-right: 100px;
	}
	.infoType>pre, .info>pre{
		color: rgb(51, 51, 51);
		font-weight: 900;
		font-size: 17px;
	}
	.info{
		float: left;
	}
	.selfIntro{
		margin: 15px 0px;
	}
	.selfIntroTitle{
		text-align: center;
	}
	.textInput{
		width: 700px;
		height: 40px;
		padding-left: 5px;
		outline: none;
		margin-left: 50px;
	}
	.selfIntroContent{
		text-align: center;
	}
	.smallTextInput{
		width: 300px;
		height: 40px;
		padding-left: 5px;
		outline: none;
		margin-left: 50px;
	}
	.selectInput{
		margin-left: 50px;
		width: 300px;
		height: 40px;
		color: rgb(51, 51, 51);
		outline: none;
		font-size: 14px;
	}
	.dateInput{
		width: 142px;
		height: 40px;	
		padding-left: 5px;
		color: rgb(51, 51, 51);
		font-size: 14px;
	}
	.firstDateInput{
		margin-left: 50px;
	}
	.aducation{
		text-align: center;
	}
	.schoolInfo{
		width: 800px;
		float: left;
		margin-top: 25px;
	}
	.schoolInfo>div, .activityInfo>div, .certiInfo>div, .benefitInfo>div{
		margin-bottom: 20px;
	}
	.txt_check{
		color: #888;
	}
	.schoolRadio{
		display: none;
	}
	.aducation>label{
		width: 200px;
		height: 50px;
		line-height: 50px;
		border: 1px solid #dfdfdf;
		margin-bottom: 20px;
	}
	.carrerRadio{
		display: none;
	}
	.carrerLabel{
		width: 200px;
		height: 50px;
		line-height: 50px;
		border: 1px solid #dfdfdf;
		text-align: center;
	}
	.selfIntroContentTextarea{
		padding: 10px;
		width: 700px;
		border-top: none;
		outline: none;
		font-size: 14px;
	}
	
	.conditionData, .moneyData{
		margin-bottom: 20px;
	}
	
	.selectBtn{
		text-align: center;
	}
	.backBtn{
		background-color: orange;
		color: white;
		width: 150px;
		height: 60px;
		font-size: 20px;
		font-weight: 900;
		border: none;
		border-radius: 10px;
		transition: background-color 1s;
	}
	.backBtn:hover{
		background-color: red;
	}
	.resumeBtn{
		background-color: rgb(78, 205, 196);
		color: white;
		width: 150px;
		height: 60px;
		font-size: 20px;
		font-weight: 900;
		border: none;
		border-radius: 10px;
		transition: background-color 1s;
	}
	.resumeBtn:hover{
		background-color: rgb(0, 174, 255);
	}
	.schoolMajorData{
		display: none;
	}
	.memberImg{
		float: left;
		display: inline-block;
		margin-left: 50px;
		margin-right: 20px;
	}
</style>
</head>
<script>
	$(function(){
		$(".univSchoolLabel").css("background-color","rgb(78, 205, 196)");			/* 처음에 학력선택 대학 선택되어있게 설정 */
		$(".univSchoolLabel").css("border","none");
		$(".univSchoolLabel>span").css("color","white");
		$(".schoolMajorData").css("display","block");
		
		$(".schoolRadio").change(function(){
			/* 선택된 라디오 민트색으로 변경 */
	         $(this).parent().css("background-color","rgb(78, 205, 196)");
	         $(this).parent().css("border","1px solid rgb(78, 205, 196)");
	         $(this).parent().css("border","none");
	         $(this).next().css("color","white");
	         $("schoolMajorData").css("display","none");
	         /* 선택 안된 라디오 기존색으로 변경 */
	         $(this).parent().siblings().css("background-color","rgb(250, 250, 250)");
	         $(this).parent().siblings().css("border" ,"1px solid #dfdfdf");
	         $(this).parent().siblings().find("span").css("color","#888");
		});
	         
			
	    /* 선택된 라디오가 초,중,고졸일 경우 major div display: none */
		$(".schoolRadio").eq(0).click(function(){
 			$(".schoolMajorData").css("display","none");	        	 
         });
		$(".schoolRadio").eq(1).click(function(){
 			$(".schoolMajorData").css("display","none");	        	 
         });
		$(".schoolRadio").eq(2).click(function(){
 			$(".schoolMajorData").css("display","none");	        	 
         });
		
	    /* 선택된 라디오가 대학이상일 경우 major div display: block */
	    $(".schoolRadio").eq(3).click(function(){
			$(".schoolMajorData").css("display","block");	        	 
	    });
		
		$(".carrerRadio").change(function(){
			$(this).parent().css("border","1px solid rgb(78, 205, 198)");
			$(this).next().css("color","rgb(78, 205, 198)");
			
			$(this).parent().siblings("label").css("border","1px solid #dfdfdf");
			$(this).parent().siblings("label").find("span").css("color","#888");
		});
		
		
		/* not null데이터가 입력되지 않은 상태로 저장하기 버튼을 누를 시 페이지 이동기능 멈추고 값을 입력하라는 메세지 출력 */
		$(".resumeBtn").click(function(e){
			if($("#title").val=="" || $("#school").val()=="" ||  $("#start").val=="" || $("#end").val()=="" || $("#local").val()=="" || $("#workForm").val()=="" || $("#money").val=="" || $("#workPlace").val()=="") {
				e.preventDefault();
				alert("필수정보를 입력해주세요.");
				window.scrollTo(0,0);
				/*
				swalMsg 쓰고싶은데 어캐쓰는지 모르겄다..ㅁㅇ.ㅁㄴㅇ.ㅁㄴㅇ.ㄴㅁㅇ..
				$.ajax({
					url : "/noData.do",
					data : {
						icon : "error",
						title : "필수정보를 입력해주세요"
					},
					success : function(data) {
						
					}
				}); */
			}
		});
		
		document.addEventListener('keydown', function(event) {
			  if (event.keyCode === 13) {
			    event.preventDefault();
			  };
			}, true);

	});
</script>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<form action="insertResume.do" method="post">
		<div class="contain">
			<em>기본정보</em>
			<div class="grayBox">
				<h3 id="name" style="margin-left: 45px;">${sessionScope.m.memberName}</h3>
				<div class="memberImg">
					<c:choose>
						<c:when test="${sessionScope.m.filepath eq null }">
							<img src="/resources/img/member/user.png" style="width: 100px;height: 100px;border-radius: 30px;margin-right: 50px;">				
						</c:when>
						<c:otherwise>
							<img src="/resources/upload/member/${sessionScope.m.filepath }" style="width: 100px;height: 100px;border-radius: 30px;margin-right: 50px;">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="infoType">
					<p style="font-style: normal;">
						<span><img alt="" src="/resources/img/favicon.ico" style="width: 17px; height: 17px;"> </span><span style="color: black;">아이디 : </span><br>
						<span><img alt="" src="/resources/img/resume/mail.PNG" style="width: 17px; height: 17px;"> </span><span style="color: black;">이메일 : </span><br>
						<span><img alt="" src="/resources/img/resume/phone.PNG" style="width: 17px; height: 17px;"> </span><span style="color: black;">휴대폰 : </span><br>
						
					</p>
				</div>
				<div class="info">
					<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">		<!-- 멤버번호 가져오기 위해서 히든으로 전송 -->
					<p>
						<span style="color: black;">${sessionScope.m.memberId}</span><br>
						<span style="color: black;">${sessionScope.m.email}</span><br>
						<span style="color: black;">${sessionScope.m.phone}</span><br>
					</p>
				</div>
			</div>
			<em>이력서 제목</em>
			<div class="grayBox">
				<b>제목<span>*</span></b>
				<input type="text" class="textInput" id="title" name="resumeTitle" placeholder="이력서 제목 입력">
			</div>
			
			<em>학력사항</em>
			<div class="grayBox">
				<em>최종학력 정보 입력</em>
				<br><br>
				<div class="aducation">			<!-- radio버튼 display none해주고 라벨로 선택해서 선택시 뒷배경 mint 글씨 흰색으로 변경 -->
	                <label class="primarySchoolLabel" for="school_type_primary">
	                    <input name="aducation" class="schoolRadio" id="school_type_primary" type="radio" value="1">	<!-- value=1 //초졸 -->
	                    <span class="txt_check tx1">초등학교 졸업</span>
	                </label>
	                <label class="middleSchoolLabel" for="school_type_middle">
	                    <input name="aducation" class="schoolRadio" id="school_type_middle" type="radio" value="2">		<!-- value=2 //중졸 -->
	                    <span class="txt_check tx2">중학교 졸업</span>
	                </label>
	                <label class="highSchoolLabel" for="school_type_high">
	                    <input name="aducation" class="schoolRadio" id="school_type_high" type="radio" value="3">		<!-- value=3 //고졸 -->
	                    <span class="txt_check tx3">고등학교 졸업</span>
	                </label>
	                <label class="univSchoolLabel" for="school_type_univ">
	                    <input name="aducation" class="schoolRadio" id="school_type_univ" type="radio" value="4" checked="">		<!-- value=4 //대졸 -->
	                    <span class="txt_check tx4">대학·대학원 이상 졸업</span>
	                </label>
	            </div>
	            <hr>
				<div class="schoolInfo">
					<div class="schoolNameData">
						<div class="schoolName">
							<b>학교명<span>*</span></b>
						</div>
						<div class="schoolNameInput">
							<input type="text" class="smallTextInput" id="school" name="schoolName" placeholder="학교명 입력">
						</div>
					</div>
					<div class="schoolDateData">
						<div class="schoolDate">
							<b>재학기간<span>*</span></b>
						</div>
						<div class="schoolDateInput">
							<input type="month" class="dateInput firstDateInput" id="start" name="schoolStart"> ~ <input type="month" class="dateInput maxDate" id="end" name="schoolEnd">				
						</div>
					</div>
					<div class="schoolLocalData">
						<div class="schoolLocal">
							<b>지역<span>*</span></b>
						</div>
						<div class="schoolLocalInput">
							<input type="text" class="smallTextInput" id="local" name="schoolLocal" placeholder="지역 선택">					
						</div>
					</div>
					<div class="schoolMajorData">		<!-- if value=4(대학생일 경우에만) 전공등록 input이 나오도록 -->
						<div class="schoolMajor">
							<b>전공</b>
						</div>
						<div class="schoolNameInput">
							<select class="selectInput" name="major">
								<option value="0">전공 선택</option>
								<option value="1">전기/전자/정보통신공학</option>
								<option value="2">컴퓨터/시스템공학</option>
								<option value="3">외 공학계열</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<em>경력사항</em>
			<div class="grayBox">
				<div class="careerData">			<!-- radio버튼 display none해주고 라벨로 선택해서 선택시 뒷배경 mint 글씨 흰색으로 변경 -->
					<div class="career">
						<b>경력<span>*</span></b>
					</div>
	                <label class="carrerLabel" for="junior">
	                    <input name="career" class="carrerRadio" id="junior" type="radio" value="1">	<!-- value=1 //주니어(신입) -->
	                    <span class="careerText" style="color: gray;">신입</span>
	                </label>
	                <label class="carrerLabel" for="senior">
	                    <input name="career" class="carrerRadio" id="senior" type="radio" value="2">		<!-- value=2 //시니어(경력) -->
	                    <span class="careerText" style="color: gray;">경력</span>
	                </label>
	           </div>
			</div>
			<em>대외활동</em>
			<div class="grayBox">
				<div class="activityInfo">
					<div class="activityData">
						<div class="activity">
							<b>활동구분</b>
						</div>
						<div class="activityInput">
							<select class="selectInput" name="activity">	
								<option value="0">활동구분 선택</option>
								<option value="1">교내활동</option>
								<option value="2">인턴</option>
								<option value="3">자원봉사</option>
								<option value="4">아르바이트</option>
								<option value="5">해외연수</option>
							</select>
						</div>
					</div>
					
					<div class="activityNameData">
						<div class="activityPlace">
							<b>기관/장소</b>
						</div>
						<div class="activityNameInput">
							<input type="text" class="smallTextInput" name="activityPlace" placeholder="기관/장소 입력">
						</div>
					</div>
					<div class="activityDateData">
						<div class="activityDate">
							<b>활동기간</b>
						</div>
						<div class="activityDateInput">
							<input type="month" class="dateInput firstDateInput" name="activityStart"> ~ <input type="month" class="dateInput" name="activityEnd">				
						</div>
					</div>
					<div class="activityContentData">
						<div class="activityContent">
							<b>활동내용</b>
						</div>
						<div class="activityContentInput">
							<input type="text" class="textInput" name="activityContent" placeholder="활동내용 입력">					
						</div>
					</div>
					
				</div>
			</div>
			<em>자격증/어학/수상내역</em>
			<div class="grayBox">
				<div class="certiInfo">
					<div class="certiNameData">
						<div class="activityName">
							<b>자격증명</b>
						</div>
						<div class="certiNameInput">
							<input type="text" class="smallTextInput" name="certiName" placeholder="자격증명 입력">
						</div>
					</div>
					<div class="certiIssueData">
						<div class="certiIssue">
							<b>발행처</b>
						</div>
						<div class="certiIssueInput">
							<input type="text" class="smallTextInput" name="certiIssue" placeholder="발행처/기관 입력">					
						</div>
					</div>
					<div class="certiPassData">
						<div class="certiPass">
							<b>합격구분</b>
						</div>
						<div class="certiPassInput">
							<select class="selectInput" name="certiPass">	
								<option value="0">합격구분 선택</option>
								<option value="1">필기합격</option>
								<option value="2">실기합격</option>
								<option value="3">최종합격</option>
							</select>
						</div>
					</div>
					<div class="certiDateData">
						<div class="certiDate">
							<b>취득일</b>
						</div>
						<div class="certiDateInput">
							<input type="month" class="dateInput firstDateInput" name="certiDate">			
						</div>
					</div>
				</div>
			</div>
			
			<em>보유기술 및 능력</em>
			<div class="grayBox">
				<!-- 여기 소원누나가 전에 했던 엔터키로 값 받는거 넣기 -->
				<!-- 우선 임시 인풋 -->
				<div class="mytech">
					<b>보유기술</b>
				</div>
				<div class="mytechInput">
					<input type="text" class="textInput" name="myTech" placeholder="보유기술 입력 (ex. 문서작성능력, 비즈니스영어, java등)">
				</div>
			</div>
			
			<em>취업 우대사항</em>
			<div class="grayBox">
				<div class="benefitInfo">
					<div class="benefitData">
						<div class="veterans">
							<b>보훈대상</b>
						</div>
						<div class="veteransInput">
							<select class="selectInput" name="veterans">	
								<option value="1">비대상</option>
								<option value="2">대상</option>
							</select>
						</div>
					</div>
					<div class="militaryData">
						<div class="military">
							<b>병역대상</b>
						</div>
						<div class="militaryInput">
							<select class="selectInput" name="military">	
								<option value="1">대상아님</option>
								<option value="2">미필</option>
								<option value="3">군필</option>
								<option value="4">면제</option>
								<option value="5">복무중</option>
							</select>
						</div>
					</div>
					
				</div>
			</div>
			
			<em>자기소개서</em>
			<div class="grayBox">
				<div class="selfIntro">
	              	<div class="selfIntroTitle">
	                    <input type="text" name="selfintroName" class="textInput" style="margin: 0;" placeholder="자기소개서 제목">
	                </div>
	               
	                <div class="selfIntroContent">
	                    <textarea cols="80" rows="10" name="selfintroContent" class="selfIntroContentTextarea" placeholder="자기소개서 내용"></textarea>
	                </div>
	                
	           </div>
			</div>
			
			<em>희망 근무조건 선택</em>
			<div class="grayBox">
				<div class="conditionData">
					<div class="condition">
						<b>근무 형태<span>*</span></b>
					</div>
					<div class="workForm">
						<select class="selectInput" id="workFrom" name="workForm">	
							<option value="1">정규직</option>
							<option value="2">계약직</option>
							<option value="3">아르바이트</option>
							<option value="4">인턴</option>
							<option value="5">프리랜서</option>
						</select>
					</div>
				</div>
				<div class="moneyData">
					<div class="money">
						<b>연봉<span>*</span></b>
					</div>
					<div class="moneyInput">
						<select class="selectInput" id="money" name="money">	
							<option value="1">회사내규에 따름</option>
							<option value="2">2000만 ~ 2400만</option>
							<option value="3">2400만 ~ 2800만</option>
							<option value="4">2800만 ~ 3200만</option>
							<option value="5">3200만 ~ 3600만</option>
							<option value="6">3600만 ~ 4000만</option>
							<option value="7">4000만 이상</option>
						</select>
					</div>
				</div>
				<div class="workPlaceData">
					<div class="workPlace">
						<b>근무 지역<span>*</span></b>
					</div>
					<div class="workPlaceInput">
						<input type="text" class="textInput" id="workPlace" name="workPlace" placeholder="근무지역">
					</div>
				</div>
			</div>
			<div class="selectBtn">
				<input type="button" onclick="history.go(-1)" class="backBtn" value="돌아가기">
				<input type="submit" class="resumeBtn" value="저장하기">
			</div>
		</div>
	</form>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>