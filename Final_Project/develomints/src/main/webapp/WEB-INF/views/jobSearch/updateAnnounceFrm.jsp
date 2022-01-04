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
		width: 1200px;
		margin: 0 auto;
		margin-bottom: 100px;
	}
	.grayBox{
		width: 900px;
		margin: 0 auto;
		background-color: rgb(250, 250, 250);
		padding: 30px;
		overflow: hidden;
		margin-top: 15px;		
		margin-bottom: 80px;
	}
	.step2Box{
		width: 900px;
		margin: 0 auto;
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
	
	.infoType{
		float: left;
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
		font-size: 14px;
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
	}
	.firstDateInput{
		margin-left: 50px;
	}
	.category{
		text-align: center;
	}

	.txt_check{
		color: #888;
	}
	
	

	.carrerLabel{
		width: 200px;
		height: 50px;
		line-height: 50px;
		border: 1px solid #dfdfdf;
		text-align: center;
	}
	.selfIntroContentTextarea{
		padding-top: 10px;
		padding-left: 10px;
		width: 700px;
		border-top: none;
		outline: none;
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
	.announceBtn{
		background-color: rgb(78, 205, 196);
		color: white;
		width: 150px;
		height: 60px;
		font-size: 20px;
		font-weight: 900;
		border: none;
		border-radius: 10px;
		transition: background-color 1s;
		float: right;
		margin-right: 100px;
	}
	.announceBtn:hover{
		background-color: rgb(0, 174, 255);
	}
	
	.announceData{
		width: 1100px;
		float: right;	
		position: relative;
	}
	.step{
		position: relative;
		bottom: -330px;
		left: -50px;
	}
	.step>ul{
		list-style: none;
	}
	.step>ul>li{
		font-size: 18px;
		margin-bottom: 5px;
		color: gray;
		
	}
	/* 주요 업무 카테고리 */
	.category>div{
		display: inline-block;
		position: relative;	
	}
	.category>div>label{
		width: 200px;
		height: 150px;
		border: 1px solid #dfdfdf;
		margin-bottom: 20px;
	}
	.categoryLabel>img, .categoryLabel>span{
		position: relative;
		top: 45px;
	}
	.categoryLabel>img{
		height: 45px;
	}
	.category>div>input{
		display: none;
	}
	
	/* 분야 */
	.fields{
		overflow: hidden;
		margin-left: 15px;
	}
	.fields>div{
		float: left;
		margin-left: 15px;
	}
	.fields>div>input{
		display: none;
	}
	
	.fieldsLabel{
		background-color: #dfdfdf;
		padding: 5px 15px;
		color: gray;
		border-radius: 15px;
		font-size: 14px;
	}
	.announContent{
		text-align: center;
	}
	.announContentTextarea{
		outline-style: none;
		padding: 10px;
		font-size: 14px;
		margin-top: 30px;
	}
	.step2Box>p{
		font-size: 13px;
		margin-left: 20px;
	}
	.step1{
		
	}
	.step2{
		display: none;
	}
	.step3{
		display: none;		
	}
	.nextBtn1, .nextBtn2{
		background-color: rgb(78, 205, 196);
		color: white;
		width: 150px;
		height: 60px;
		font-size: 20px;
		font-weight: 900;
		border: none;
		border-radius: 10px;
		transition: background-color 1s;
		float: right;
		margin-right: 100px;
	}
	.nextBtn1:hover, .nextBtn2:hover{
		background-color: rgb(0, 174, 255);
	}
	.backBtn1, .backBtn2{
		color: gray;
		font-size: 20px;
		font-weight: 900;
		float: left;
		background-color: white;
		border: none;
		margin-left: 100px;
	}
	
</style>
</head>
<script>
	$(function(){
		/* 사이드바 1번 민트색으로 */
		$(".step>ul>li").eq(0).css("color","rgb(78,205,198)");
		$(".step>ul>li").eq(0).css("font-weight","900");
		/* 주요업무 카테고리 선택된거 효과 */
		$(".categoryCheckBox").change(function(){
			$(this).next().css("border","1px solid rgb(78,205,196)");
			$(this).next().find("span").css("font-weight","900");
			$(this).next().find("span").css("color","rgb(78,205,196)");
			$(this).parent().siblings().find("label").css("border","1px solid #dfdfdf");
			$(this).parent().siblings().find("label").find("span").css("font-weight","normal");
			$(this).parent().siblings().find("label").find("span").css("color","#888");
		});
		/* 2페이지로 이동 : 공고모집 1페이지에서 다음버튼 누르면 1페이지 안보이게, 2페이지 보이게 */
		$(".nextBtn1").click(function(){
			if($("#companyTitle").val()=="" || $(".categoryCheckBox").val() =="" || $(".fieldsCheckBox").val()=="" || $("#school").val()=="" || $("#workform").val()=="") {
				alert("값을 입력해주세요.");
			} else {			
				$(".step1").css("display","none");
				$(".step2").css("display","block");
				/* 사이드바 페이지에 맞추기 */
				$(".step>ul>li").eq(1).css("color","rgb(78,205,198)");
				$(".step>ul>li").eq(1).css("font-weight","900");
				$(".step>ul>li").eq(0).css("color","gray");
				$(".step>ul>li").eq(0).css("font-weight","normal");				
			}
		});
		/* 2페이지에서 1페이지로 이동 : 이전버튼 누르면 2페이지는 안보이고 1페이지 보이게 */
		$(".backBtn1").click(function(){
			$(".step1").css("display","block");
			$(".step2").css("display","none");
			/* 사이드바 페이지에 맞추기 */
			$(".step>ul>li").eq(0).css("color","rgb(78,205,198)");
			$(".step>ul>li").eq(0).css("font-weight","900");
			$(".step>ul>li").eq(1).css("color","gray");
			$(".step>ul>li").eq(1).css("font-weight","normal");
		});
		/* 2페이지에서 3페이지로 이동 : 2페이지에서 다음버튼 누르면 2페이지 안보이고 3페이지 보이게  */
		$(".nextBtn2").click(function(){
		if($("#announTitle").val()=="" || $(".announContentTextarea").val()=="" || $("#skills").val()=="") {
			alert("값을 입력해주세요.");
		} else {
			$(".step2").css("display","none");
			$(".step3").css("display","block");
			$(".step>ul>li").eq(2).css("color","rgb(78,205,198)");
			$(".step>ul>li").eq(2).css("font-weight","900");
			$(".step>ul>li").eq(1).css("color","gray");
			$(".step>ul>li").eq(1).css("font-weight","normal");
		}
		});
		/* 3페이지에서 2페이지로 이동 : 3번째 페이지에서 이전버튼 누르면 3페이지는 안보이고 2페이지 보이게 */
		$(".backBtn2").click(function(){
			$(".step2").css("display","block");
			$(".step3").css("display","none");
			$(".step>ul>li").eq(1).css("color","rgb(78,205,198)");
			$(".step>ul>li").eq(1).css("font-weight","900");
			$(".step>ul>li").eq(2).css("color","gray");
			$(".step>ul>li").eq(2).css("font-weight","normal");
		});
		
		/* 분야 */		
		$(".fieldsCheckBox").change(function() {
			/* 선택되었을 때 색변경 */
		    if(this.checked) {
		    	$(this).next().css("background-color","rgb(78,205,198)");
				$(this).next().css("color","white");
				/* 선택이 취소되었을 때 원래대로 돌아오기 */
		    } else {
		    	$(this).next().css("background-color","#dfdfdf");
				$(this).next().css("color","gray");
		    }
		});
		
		var ta = $("#ta").val();
		$(".announContentTextarea").html(ta);
		
	});
</script>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="contain">
		<div class="step">
			<ul>
				<li>1. 기본정보</li>
				<li>2. 구인공고 상세</li>
				<li>3. 급여 및 근무</li>
				<li>4. 구인공고 등록</li>
			</ul>
		</div>
		<div class="announceData">
			<form action="updateAnnounce.do" method="post">
			<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">		<!-- 멤버번호 가져오기 위해서 히든으로 전송 -->
			<input type="hidden" name="announceNo" value="${a.announceNo }">
				<div class="step1">
					<em>기본정보</em>
					<br><br><br>
					<hr>
					<br><br>
					<div class="grayBox">
						<em>회사명</em>
						<br><br>
						<b>회사명</b>
						<input type="text" class="textInput" id="companyTitle" name="companyName" value="${a.companyName }" readonly>
					</div>
					
		
					<div class="grayBox">
						<em>주요 업무 카테고리</em>
						<br><br>
						<p>해당하는 주요 업무의 카테고리를 선택해 주세요.</p>
						<div class="category">
							<div class="develop">
				                <input name="category" class="categoryCheckBox" id="develop" type="radio" value=1>
				                <label class="categoryLabel" for="develop">
				                    <img src="/resources/img/company/develop.PNG"><br>
				                    <span class="txt_check">개발</span>
				                </label>
				                
							</div>
							<div class="design">
				                <input name="category" class="categoryCheckBox" id="design" type="radio" value=2>
				                <label class="categoryLabel" for="design">
				                    <img src="/resources/img/company/design.PNG"><br>
				                    <span class="txt_check">디자인</span>
				                </label>
			                </div>
			                <div class="plan">
				                <input name="category" class="categoryCheckBox" id="plan" type="radio" value=3>
				                <label class="categoryLabel" for="plan">
				                    <img src="/resources/img/company/plan.PNG"><br>
				                    <span class="txt_check">기획</span>
				                </label>
			                </div>
			            </div>
					</div>
					
					<div class="grayBox">
						<em>분야</em>
						<br><br>
						<div class="fields">
							<div class="web">
				                <input name="fields" class="fieldsCheckBox" id="web" type="checkBox" value=1>
				                <label class="fieldsLabel" for="web">웹</label>  
							</div>
							<div class="app">
				                <input name="fields" class="fieldsCheckBox" id="app" type="checkBox" value=2>
				                <label class="fieldsLabel" for="app">어플리케이션</label>
			                </div>
			                <div class="com">
				                <input name="fields" class="fieldsCheckBox" id="com" type="checkBox" value=3>
				                <label class="fieldsLabel" for="com">커머스, 쇼핑몰</label>
			                </div>
			                <div class="com">
				                <input name="fields" class="fieldsCheckBox" id="sw" type="checkBox" value=4>
				                <label class="fieldsLabel" for="sw">일반 소프트웨어</label>
			                </div>
			                <div class="com">
				                <input name="fields" class="fieldsCheckBox" id="pub" type="checkBox" value=5>
				                <label class="fieldsLabel" for="pub">퍼블리싱</label>
			                </div>
			                <div class="com">
				                <input name="fields" class="fieldsCheckBox" id="im" type="checkBox" value=6>
				                <label class="fieldsLabel" for="im">임베디드</label>
			                </div>
			                <div class="com">
				                <input name="fields" class="fieldsCheckBox" id="game" type="checkBox" value=7>
				                <label class="fieldsLabel" for="game">게임</label>
			                </div>
			                <div class="com">
				                <input name="fields" class="fieldsCheckBox" id="etc" type="checkBox" value=8>
				                <label class="fieldsLabel" for="etc">기타</label>
			                </div>
			            </div>
					</div>
					
					<div class="grayBox">
						<em>학력</em>
						<br><br>
						<div class="school">
							<b>최종학력</b>
						</div>
						<div class="schoolInput">
							<select class="selectInput" id="school" name="school">	
								<option value=1>초졸</option>
								<option value=2>중졸</option>
								<option value=3>고졸</option>
								<option value=4 selected="">대졸이상</option>
								<option value=5>학력무관</option>
							</select>
						</div>		
					</div>
					
					<div class="grayBox">
						<em>근무형태</em>
						<br><br>
						<div class="workform">
							<b>근무형태</b>
						</div>
						<div class="workformInput">
							<select class="selectInput" id="workform" name="workForm">	
								<option value=1>정규직</option>
								<option value=2>계약직</option>
								<option value=3>아르바이트</option>
								<option value=4>인턴</option>
								<option value=4>프리랜서</option>
							</select>
						</div>		
					</div>
					
					
					<div class="grayBox">
						<em>경력</em>
						<br><br>
						<div class="career">
							<b>경력선택</b>
						</div>
						<div class="careerInput">
							<select class="selectInput" id="career" name="career">	
								<option value=1>신입</option>
								<option value=2>경력</option>
								<option value=3>경력무관</option>
							</select>
						</div>		
					</div>
					
					<div class="selectBtn">
						<input type="button" onclick="window.scrollTo(0,0);" class="nextBtn1" value="다음">
					</div>
					<!-- 다음버튼 -->
					
				</div>
				
				<div class="step2">
					<em>상세정보</em>
					<br><br><br>
					<hr>
					<br><br>
					<div class="step2Box">
						<h5 style="color: black; font-weight: 900;">공고 제목</h5><br>
						<div class="announTitle">
							<b>공고 제목</b>
						</div>
						<input type="text" class="textInput" id="announTitle" style="width: 810px; margin-left: 0px;" name="announceTitle" value="${a.announceTitle }"><br>
					</div>
					
					<div class="step2Box">
						<h5 style="color: black; font-weight: 900;">상시 업무 내용</h5>
						<p style="color: rgb(108, 108, 108);">
							업무 내용을 상세하게 작성해주실수록, 더 적합한 파트너를 만날 수 있습니다.<br>
							파트너가 알아야 할 유의사항(필수 사항, 전문 경험 등)도 함께 작성해 주세요.
						</p>
			            <div class="announContent">
			            	<input type="hidden" id="ta" value="${a.announceContent }">
			                <textarea cols="120" rows="30" name="announceContent" class="announContentTextarea" value="${a.announceContent }"></textarea>
			        	</div>  
			    	</div>
			    	
			    	<div class="step2Box">
						<h5 style="color: black; font-weight: 900; margin-bottom: 0px;">관련기술</h5>
						<t style="font-size: 13px;">더 적합한 파트너가 프로젝트를 찾고 지원할 수 있도록 프로젝트와 관련된 기술을 입력해주세요.</t>
						<br><br>
						<div class="workform">
							<b>관련기술</b>
						</div>
						<input type="text" class="textInput" id="skills" style="width: 810px; margin-left: 0px;" name="skills" value="${a.skills }"><br>
						<t style="font-size: 13px; margin-left: 30px; color: rgb(108,108,108);"><!-- 기술명을 입력한 후, 엔터키를 눌러 추가해 주세요. --></t>
					</div>
					
					<!-- 이전, 다음버튼 -->
					<div class="selectBtn">
						<input type="button" onclick="window.scrollTo(0,0);" class="nextBtn2" value="다음">
						<input type="button" onclick="window.scrollTo(0,0);" class="backBtn1" value="< 이전">
					</div>
				</div>
				
				<div class="step3">
					<em>급여 및 근무</em>
					<br><br><br>
					<hr>
					<br><br>
					<div class="grayBox">
						<em>급여</em>
						<br><br>
						<b>급여</b>
						<input type="text" class="smallTextInput" name="money" value="${a.money }">
					</div>
					
					<div class="grayBox">
						<em>근무 지역</em>
						<br><br>
						<div class="workplace">
							<b>근무 지역</b>
						</div>
						<div class="activityInput">
							<select class="selectInput" name="workPlace">	
								<option value=1>서울</option>
								<option value=2>경기</option>
								<option value=3>인천</option>
								<option value=4>강원</option>
								<option value=5>충남</option>
								<option value=6>충북</option>
								<option value=7>경북</option>
								<option value=8>부산</option>
								<option value=9>경남</option>
								<option value=10>전북</option>
								<option value=11>전남</option>
								<option value=12>제주</option>
							</select>
						</div>		
					</div>
					
					
					
					<div class="grayBox">
						<em>지원자 모집 마감일</em>
						<br><br>
						<div class="endDateData">
							<div class="endDate">
								<b>마감일</b>
							</div>
							<div class="endDateInput">
								<input type="date" class="dateInput" id="endDate" name="endDate" value="${a.endDate }">				
							</div>
						</div>
					</div>
					
					
					<div class="grayBox">
						<em>우대사항</em>
						<br><br>
						<div class="veterans">
							<b>보훈대상</b>
						</div>
						<div class="veteransInput">
							<select class="selectInput" id="veterans" name="veterans">	
								<option value=1>비대상</option>
								<option value=2>대상</option>
							</select>
						</div><br><br>
						<div class="military">
							<b>병역대상</b>
						</div>
						<div class="militaryInput">
							<select class="selectInput" id="military" name="military">	
								<option value=1>군필</option>
								<option value=2>상관없음</option>
							</select>
						</div>	
					</div>
					
					<!-- 이전, 등록하기 버튼 -->
					<div class="selectBtn">
						<input type="submit" class="announceBtn" value="등록">
						<input type="button" onclick="window.scrollTo(0,0);" class="backBtn2" value="< 이전">
					</div>
				</div>
				
				
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>