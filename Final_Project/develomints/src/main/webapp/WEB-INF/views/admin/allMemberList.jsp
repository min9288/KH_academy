<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeveloMint 전체 회원 조회</title>
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

.listTag{
	color : black;
	text-decoration: none;
	margin-right: 10px;
}

.totalBox{
	box-shadow: 0px 1px 1px -2px rgb(0 0 0 / 20%), 0px 0px 1px 0px rgb(0 0 0 / 14%), 0px 1px 8px 0px rgb(0 0 0 / 12%);
	display: flex;
	justify-content: space-evenly;
	margin-bottom: 80px;
	text-align: center;
}

.totalBox>div>p{
	font-size: 20px;
	font-weight: bold;
	margin-top:15px;
	
}
.totalBox>div>span:first-of-type {
	font-size: 20px;
	margin-top: 15px;
	margin-bottom: 15px;
	display: inline-block;
	font-weight: bold;
}
.table{
	margin-top : 30px;
	text-align: center;
}
#searchBox{
	display: flex;
	justify-content: flex-end;
	overflow: hidden;
}
#searchBox>[name="memberId"]{
	float: left;
	width: 200px;
	margin-right: 10px;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container" style="margin-top:50px;margin-bottom:100px;">
		<div class="mainCate">
			<a href="/adminPage.do" class="cateAtag"><i class="bi bi-chevron-left"></i></a> 
			<span id="allMember" style="font-weight:bold">전체 회원 조회</span>
		</div>
		<br><br><br>
	
	<%--회원 total Box --%>
	<div class="totalBox">
		<div>
			<p>총 회원</p>
			<span>${totalCount[0] }</span><span> 명</span>
		</div>
		<div>
			<p>일반 회원</p>
			<span>${totalCount[1] }</span><span> 명</span>
		</div>
		<div>
			<p>고수 회원</p>
			<span>${totalCount[2] }</span><span> 명</span>
		</div>
		<div>
			<p>기업 회원</p>
			<span>${totalCount[3] }</span><span> 명</span>
		</div>
	</div>
	
	<%--조회 카테고리 --%>
	<a href="/allMemberList.do?reqPage=1&type=0&list=1" id="newList" class="listTag">최신순</a>
	<a href="/allMemberList.do?reqPage=1&type=0&list=2" id="gradeList" class="listTag">등급순</a>
	<a href="/allMemberList.do?reqPage=1&type=1&list=1" id="memberList" class="listTag">일반회원</a>
	<a href="/allMemberList.do?reqPage=1&type=2&list=1" id="gosuList" class="listTag">고수회원</a>
	<a href="/allMemberList.do?reqPage=1&type=3&list=1" id="companyList" class="listTag">기업회원</a>
	
	<%--아이디 검색 --%>
	<div id="searchBox">
		<input type="text" name="memberId" id="idInput" placeholder="아이디를 입력하세요" class="form-control mr-sm-2">
		<input type="button" value="검색" class="btn btn-info searchBtn" style="background-color: #4ECDC4">
	</div>
	
	<%--조회 리스트 테이블 --%>
	<%--최신순(전체회원조회) --%>
	<table class="table newListTbl ">
		<tr>
			<th><input type="checkbox" id="checkAll" class="form-check-input" style="zoom: 1.2;"></th>
			<th>아이디</th>
			<th>이름</th>
			<th>등급</th>
			<th>이메일</th>
			<th>포인트</th>
			<th>회원유형</th>
			<th>가입일</th>
			<th>등급 변경</th>
		</tr>
		<c:forEach items="${memberList }" var="ml" varStatus="i">
			<tr class="tblTr">
				<td><input type="checkbox" class="form-check-input chk" style="zoom: 1.2;" onclick="setBgcolor(this)"></td>
				<td>${ml.memberId }</td>
				<td>${ml.memberName}</td>
				<c:choose>
					<c:when test="${ml.memberGrade > 0 && ml.memberGrade < 21 }">
						<td><img src="/resources/img/member/rank/bronze.png" width="35px" height="35px;">브론즈</td>
					</c:when>
					<c:when test="${ml.memberGrade >= 21 && ml.memberGrade <= 40 }">
						<td><img src="/resources/img/member/rank/silver.png" width="35px" height="35px;">실버</td>
					</c:when>
					<c:when test="${ml.memberGrade >= 41 && ml.memberGrade <= 60 }">
						<td><img src="/resources/img/member/rank/gold.png" width="35px" height="35px;">골드</td>
					</c:when>
					<c:when test="${ml.memberGrade >= 61 && ml.memberGrade <= 80 }">
						<td><img src="/resources/img/member/rank/platinum.png" width="35px" height="35px;">플레티넘</td>
					</c:when>
					<c:when test="${ml.memberGrade >= 81 && ml.memberGrade <= 110 }">
						<td><img src="/resources/img/member/rank/diamond.png" width="35px" height="35px;">다이아</td>
					</c:when>
					<c:when test="${ml.memberGrade >= 111 && ml.memberGrade <= 140 }">
						<td><img src="/resources/img/member/rank/master.png" width="35px" height="35px;">마스터</td>
					</c:when>
					<c:when test="${ml.memberGrade >= 141 && ml.memberGrade <= 170 }">
						<td><img src="/resources/img/member/rank/challenger.png" width="35px" height="35px;">챌린저</td>
					</c:when>
				</c:choose>
				<td>${ml.email }</td>
				<td>${ml.memberGrade }</td>
				<c:choose>
					<c:when test="${ml.memberType == 1 }">
						<td>일반회원</td>
					</c:when>
					<c:when test="${ml.memberType == 2 }">
						<td>고수회원</td>
					</c:when>
					<c:when test="${ml.memberType == 3 }">
						<td>기업회원</td>
					</c:when>
					<c:when test="${ml.memberType == 4 }">
						<td>차단회원</td>
					</c:when>
					<c:when test="${ml.memberType == 9 }">
						<td>관리자</td>
					</c:when>
				</c:choose>
				<td>${ml.enrollDate }</td>
				<td>
					<select class="selLevle form-control"> 
						<option>브론즈</option>
						<option>실버</option>
						<option>골드</option>
						<option>플레티넘</option>
						<option>다이아</option>
						<option>마스터</option>
						<option>챌린저</option>
					</select>
				</td>
			</tr>
		</c:forEach>
	</table>
		<button class="btn btn-secondary changeBtn" style="float: right; margin-right:20px;">등급변경</button>
		<div id="pageNavi" style="text-align: center; margin-top:50px;"  >${pageNavi }</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	 <script>
	 //체크박스 전체 선택
	 $("#checkAll").click(function(){
		if($("#checkAll").prop("checked")){
	           $(".chk").prop("checked",true);
	    }else{
	           $(".chk").prop("checked",false);
	    }
	});
	 
	 //선택회원 등급변경
	 $(".changeBtn").click(function(){
		var inputs = $(".chk:checked");
		var memberId = new Array(); //회원번호 저장할 배열
		var level = new Array(); //변경할 등급을 저장할 배열
		
		inputs.each(function(idx,item){
			var memberNo = $(item).parent().next().html();
			memberId.push(memberNo);
			var memberLevel = $(item).parent().parent().find("select").val();
			level.push(memberLevel);
		});
		var checkBoxCheck = $('.chk').is(":checked");
		if(!checkBoxCheck){
			swal({
				  title: "회원 미선택",
				  text: "등급 변경할 회원을 선택해주세요.",
				  icon: "warning",
				  buttons: true,
				})
			return;
		}
		swal({
			  title: "회원 등급 변경",
			  text: "선택한 회원의 등급을 변경하시겠습니까?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  location.href="/chkChangeLevel.do?memberId="+memberId.join("/")+"&level="+level.join("/");
			  }
			});
		
	 });
	 
	 //체크박스 선택시 색바꾸기
	 function setBgcolor(t){
		 tr = t.parentNode.parentNode;
		 tr.style.backgroundColor = (t.checked) ? "rgba(78,205,196,0.1)" : "#fff";
		 
	 }
	 
	 //아이디 검색버튼 클릭시 넘겨주기
	 $(".searchBtn").click(function(){
		 var id = $("#idInput").val();
		 location.href="/allMemberList.do?reqPage=1&type=4&list=1&id="+id;
	 });
	 
	 //카테고리 색
	 $(function(){
		 var type = '${type}';
		 var list = '${list}';
		 if(type == 0 && list == 1){
			 $(".listTag").eq(0).css("color","#4ECDC4");
		 }else if(type == 0 && list == 2){
			 $(".listTag").eq(1).css("color","#4ECDC4");
		 }else if(type == 1 && list == 1){
			 $(".listTag").eq(2).css("color","#4ECDC4");
		 }else if(type == 2 && list == 1){
			 $(".listTag").eq(3).css("color","#4ECDC4");
		 }else if(type == 3 && list == 1){
			 $(".listTag").eq(4).css("color","#4ECDC4");
		 }
	 })
	
	 
	 	
	 	
	 </script>
</body>
</html>