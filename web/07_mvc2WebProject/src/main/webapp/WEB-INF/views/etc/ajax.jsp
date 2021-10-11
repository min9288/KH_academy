<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container">
		<fieldset>
			<legend>AJAX</legend>
			<div>
				<h3>1. 서버로 데이터 전송하기</h3>
				<input type="text" id="ajax1">
				<button class="btn btn-info" onclick="jsAjax();">보내기(JS)</button>
				<button class="btn btn-danger" id="jQ1">보내기(jQUery)</button>
			</div>
			<div>
				<h3>2. 서버에서 기본형 데이터 받기</h3>
				<button class="btn btn-danger" id="jQ2">데이터 받기</button>
				<p class="ajaxResult"></p>
			</div>
			<div>
				<h3>3. 서버로 기본형 데이터 보내고 기본형 데이터 받기</h3>
				<input type="text" id="firstNum">
				<input type="text" id="secondNum">
				<button class="btn btn-danger" id="jQ3">두 수의 합 받기</button>
				<p class="ajaxResult"></p>
			</div>
			<div>
				<h3>4. 서버로 객체 데이터 보내기</h3>
				<input type="text" id="name"><br>
				<input type="text" id="age"><br>
				<input type="text" id="addr"><br>
				<button class="btn btn-danger" id="jQ4">객체 보내기</button>
			</div>
			<div>
				<h3>5. 서버로 기본형 데이터보내고, 결과로 객체 받기</h3>
				<input type="text" id="ajax5"><br>
				<button class="btn btn-danger" id="jQ5">조회</button>
				<p class="ajaxResult"></p>
			</div>
			<div>
				<h3>6. 서버에서 리스트타입 결과 받기</h3>
				<button class="btn btn-danger" id="jQ6">조회</button>
				<p class="ajaxResult"></p>
			</div>
			<div>
				<h3>7. 서버에서 map타입 결과 받기</h3>
				<button class="btn btn-danger" id="jQ7">조회</button>
				<p class="ajaxResult"></p>
			</div>
			<div>
				<h3>8. 서버로 기본형 데이터보내고, 결과로 객체 받기(GSON사용)</h3>
				<input type="text" id="ajax8">
				<button class="btn btn-danger" id="jQ8">조회</button>
				<p class="ajaxResult"></p>
			</div>
			<div>
				<h3>9. 서버에서 리스트타입 결과 받기(GSON사용)</h3>
				<button class="btn btn-danger" id="jQ9">조회</button>
				<p class="ajaxResult"></p>
			</div>
			<div>
				<h3>10. 서버에서 map타입 결과 받기(GSON사용)</h3>
				<button class="btn btn-danger" id="jQ10">조회</button>
				<p class="ajaxResult"></p>
			</div>
		</fieldset>
	</div>
	<script>
		function jsAjax(){
			// 1. XMLHttpRequest 객체 생성
			var xhttp = new XMLHttpRequest();
			var msg = document.getElementById("ajax1").value;	// input 입력값(보낼 데이터)
			// 2. 요청정보 설정
			xhttp.open("GET","/ajaxTest1?msg="+msg, true);	// method, url, 비동기처리
			// 3. 데이터 처리에 따라 동작할 함수 설정
			xhttp.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){ // 서버에서 정상응답이 왔을때
					console.log("서버 전송 성공");
				}else if(this.readyState == 4 && this.status == 404) { // 요청페이지가 없는 경우
					console.log("서블릿 없음");
				}
			}
			// 4. 서버에 요청
			xhttp.send();
		}
		$("#jQ1").click(function(){
			var msg = $("#ajax1").val();
			$.ajax({
				url : "/ajaxTest1",		// 어떤 서블릿을 요청할지 매핑값
				data : {msg:msg},		// 서블릿에 전송할 데이터(object)
				type : "get",			// method 설정
				
				success : function(){	// 비동기요청 성공시 수행될 함수
					console.log("서버 요청 성공");		
				},
				error : function(){
					console.log("에러발생");	//	비동기요청 에러발생시 수행될 함수
				},
				complete : function(){	//성공 실패와 상관없이 무조건 호출될 함수
					console.log("무조건 호출");	
				}
			});
		});
		$("#jQ2").click(function(){
			var result = $(this).next();
			$.ajax({
				url : "/ajaxTest2",
				type : "get",
				success : function(data){	// 서버에서 주는 데이터는 success 함수의 매개변수로 들어옴
					result.html(data);
				},
				error : function(){
					console.log("실패");
				}
			});
		});
		$("#jQ3").click(function(){
			var result = $(this).next();
			var firstNum = $("#firstNum").val();
			var secondNum = $("#secondNum").val();
			$.ajax({
				url : "/ajaxTest3",		// 어떤 서블릿을 요청할지 매핑값
				data : {firstNum:firstNum, secondNum:secondNum},		// 서블릿에 전송할 데이터(object)
				type : "get",			// method 설정
				
				success : function(data){	// 비동기요청 성공시 수행될 함수
					result.html(data);	
				},
				error : function(){
					console.log("에러발생");	//	비동기요청 에러발생시 수행될 함수
				},
			});
		});
		$("#jQ4").click(function(){
			var name = $("#name").val();
			var age = $("#age").val();
			var addr = $("#addr").val();
			// 객체생성
			var student = {name:name, age:age, addr:addr};
			$.ajax({
				url : "/ajaxTest4",
				data : student,
				type : "get",
				
				success : function(data){	// 비동기요청 성공시 수행될 함수
					console.log("성공");
				},
				error : function(){
					console.log("에러발생");	//	비동기요청 에러발생시 수행될 함수
				},
			});
		});
		$("#jQ5").click(function(){
			var memberId = $("#ajax5").val();
			var result = $(this).next();
			$.ajax({
				url : "/ajaxTest5",
				type : "post",
				data : {memberId : memberId},
				success : function(data){
					if(data != null){
						result.empty(); // 이전 출력내용 삭제
						var memberId = data.memberId;
						result.append("아이디 : "+ memberId +"<br>");
						result.append("비밀번호 : "+ data.memberPw +"<br>");
						result.append("아이디 : "+ data.memberName +"<br>");
					} else {
						result.html("회원 정보를 조회할 수 없습니다.");
					}
				}
			});
		});
		$("#jQ6").click(function(){
			var result = $(this).next();
			$.ajax({
				url : "/ajaxTest6",
				type : "get",
				success : function(data){
					for(var i=0; i < data.length; i++){
						var html = data[i].memberNo+"/"+data[i].memberName+"/"+data[i].phone+"<br>";
						result.append(html);
					}
				}
			});
		});
		$("#jQ7").click(function(){
			var result = $(this).next();
			$.ajax({
				url : "/ajaxTest7",
				type : "get",
				success : function(data){
					// data : key : 아이디, value : object 인 object
					var keys = Object.keys(data);	// 객체의 키값을 전부 가져옴(배열)
					for(var i=0; i < keys.length; i++){
						var memberNo = data[keys[i]].memberNo;
						var memberName = data[keys[i]].memberName;
						var phone = data[keys[i]].phone;
						result.append(memberNo+"/"+memberName+"/"+phone+"<br>");
					}
				}
			});
		});
		$("#jQ8").click(function(){
			var memberId = $("#ajax8").val();
			var result = $(this).next();
			$.ajax({
				url : "/ajaxTest8",
				type : "post",
				data : {memberId : memberId},
				success : function(data){
					if(data != null){
						console.log(data);
						result.empty(); // 이전 출력내용 삭제
						var memberId = data.memberId;
						result.append("아이디 : "+ memberId +"<br>");
						result.append("비밀번호 : "+ data.memberPw +"<br>");
						result.append("이름 : "+ data.memberName +"<br>");
					} else {
						result.html("회원 정보를 조회할 수 없습니다.");
					}
				}
			});
		});
		$("#jQ9").click(function(){
			var result = $(this).next();
			$.ajax({
				url : "/ajaxTest9",
				type : "get",
				success : function(data){
					console.log(data);
					result.empty();
					for(var i=0; i < data.length; i++){
						var html = data[i].memberNo+"/"+data[i].memberName+"/"+data[i].phone+"<br>";
						result.append(html);
					}
				}
			});
		});
		$("#jQ10").click(function(){
			var result = $(this).next();
			$.ajax({
				url : "/ajaxTest10",
				type : "get",
				success : function(data){
					// data : key : 아이디, value : object 인 object
					var keys = Object.keys(data);	// 객체의 키값을 전부 가져옴(배열)
					for(var i=0; i < keys.length; i++){
						var memberNo = data[keys[i]].memberNo;
						var memberName = data[keys[i]].memberName;
						var phone = data[keys[i]].phone;
						result.append(memberNo+"/"+memberName+"/"+phone+"<br>");
					}
				}
			});
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>