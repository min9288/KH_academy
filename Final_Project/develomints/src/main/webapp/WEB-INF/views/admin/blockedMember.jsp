<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeveloMint 차단회원 관리</title>
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
#blockedMember{
	font-size: 25px;
	line-height: 46px;
}
.bi{
	font-size:30px;
}
span{
	font-weight: bold;
	font-size: 19px;
}
#blockedCount{
	color : #4ECDC4
}
.bi-check2-square{
	font-size: 19px;
	margin-right: 5px;
}
#searchForm{
	width: 200px;
	margin-right: 10px;
	display: inline-block;
	
}
#searchBox{
	display: flex;
	justify-content: flex-end;
}
#Modaltitle{
	margin-top:20px;
	margin-bottom:20px;
	font-size: 20px;
	font-weight: bold;
}
.infoBox{
	display: flex;
}
.infoBox>img{
	margin-right: 30px;
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
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container" style="margin-top:50px;margin-bottom:100px;">
		<div class="mainCate">
		<a href="/adminPage.do" class="cateAtag"><i class="bi bi-chevron-left"></i></a> 
		<span id="blockedMember" style="font-weight:bold">차단 회원 조회</span>
		</div>
		<br><br><br>
		
		<%--총 차단회원 명 수 --%>
		<span>총 차단 회원 </span><span id="blockedCount">${totalCount }</span><span> 명</span>
		
		<%--아이디 검색창 --%>
		<div id="searchBox">
			<input type="text" name="memberId" placeholder="아이디를 입력하세요" class="form-control" id="searchForm">
			<button class="btn btn-secondary searchBtn">검색</button>
		</div>
		
		<%--차단회원 테이블 --%>

		<table class="table" style="margin-top:20px; text-align: center;"> 
			<tr>
				<th><input type="checkbox" id="checkAll" class="form-check-input" style="zoom: 1.2;"></th>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>등급</th>
				<th>차단날짜</th>
				<th>내용보기</th>
			</tr>
			<c:forEach items="${allblockedList }" var="b" varStatus="i">
				<tr>
					<td><input type="checkbox" class="form-check-input chk" style="zoom: 1.2;" onclick="setBgcolor(this)"></td>
					<td class="reId">${b.memberId }</td>
					<td class="rename">${b.memberName }</td>
					<td>${b.phone }</td>
					<td class="remail">${b.email }</td>
					<c:choose>
						<c:when test="${b.memberGrade > 0 && b.memberGrade < 21 }">
							<td><img src="/resources/img/member/rank/bronze.png" width="35px" height="35px;">브론즈</td>
						</c:when>
						<c:when test="${b.memberGrade >= 21 && b.memberGrade <= 40 }">
							<td><img src="/resources/img/member/rank/silver.png" width="35px" height="35px;">실버</td>
						</c:when>
						<c:when test="${b.memberGrade >= 41 && b.memberGrade <= 60 }">
							<td><img src="/resources/img/member/rank/gold.png" width="35px" height="35px;">골드</td>
						</c:when>
						<c:when test="${b.memberGrade >= 61 && b.memberGrade <= 80 }">
							<td><img src="/resources/img/member/rank/platinum.png" width="35px" height="35px;">플레티넘</td>
						</c:when>
						<c:when test="${b.memberGrade >= 81 && b.memberGrade <= 110 }">
							<td><img src="/resources/img/member/rank/diamond.png" width="35px" height="35px;">다이아</td>
						</c:when>
						<c:when test="${b.memberGrade >= 111 && b.memberGrade <= 140 }">
							<td><img src="/resources/img/member/rank/master.png" width="35px" height="35px;">마스터</td>
						</c:when>
						<c:when test="${b.memberGrade >= 141 && b.memberGrade <= 170 }">
							<td><img src="/resources/img/member/rank/challenger.png" width="35px" height="35px;">챌린저</td>
						</c:when>
					</c:choose>
					<td>${lastReport[i.index] }</td>
					<td><button type="button" class="btn btn-primary reportViewBtn" data-bs-toggle="modal" data-bs-target="#memberMoreModal${i.index }">자세히</button></td>
				<tr>
				
			</c:forEach>
		</table>
		<button type="button" class="btn btn-outline-primary cancelBtn"><i class="bi bi-check2-square"></i>차단 해제</button>
		<div id="pageNavi" style="text-align: center; margin-top:50px;"  >${pageNavi }</div>

		
		<!-- 내용보기 Modal -->
		<c:forEach items="${allblockedList }" var="b" varStatus="i">
		<p class="imgpath" style="display:none;">${b.filepath }</p>
		<div class="modal fade" id="memberMoreModal${i.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content" style="border-radius: 0.3rem;">
		      <div class="modal-body">
		      	
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		</c:forEach>
	</div>
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	
	<script type="text/javascript">
		//자세히 버튼 클릭시 정보 띄워주기
		$(".reportViewBtn").click(function(){
			var index = $(".reportViewBtn").index(this);
			var reId = $(".reId").eq(index).html();
			var rename = $(".rename").eq(index).html();
			var remail = $(".remail").eq(index).html();
			var imgpath = $(".imgpath").eq(index).html();
			$.ajax({
	 			url : "/memberReportView.do",
				type : 'post',
				data : {id:reId},
				success : function(data){
					$(".modal-body").empty();
					var mb = '<p id="Modaltitle">신고 누적 내용</p>';
					mb += '<p class="title">차단 회원 정보</p>'
					mb += '<div class="infoBox">';
					if(imgpath == ""){
						mb += '<img src="/resources/img/member/user.png" style="width: 120px; height:120px;">';	
					}else{
						mb += '<img src="/resources/upload/member/'+imgpath+'" style="width: 120px; height:120px;">';
					}
					mb += '<div>'
					mb += '<p>아이디 : '+reId+'</p>';
					mb += '<p>이름 : '+rename+'</p>';
					mb += '<p>이메일 : '+remail+'</p>';
					mb += '</div>'
					mb += '</div>';
					mb += '<p class="title" style="margin-top:30px; margin-bottom: 10px">신고 댓글 정보</p>'
					$(".modal-body").append(mb);
					var tbl = '<table class="table" style="margin-top: 20px;">';
					tbl += '<tr>';
					tbl += '<th>신고일</th><th>사유</th><th>댓글 내용</th>';
					tbl += '</tr>';
					for(var i = 0; i<data.length; i++){
						tbl += '<tr>';
						tbl += '<td>'+data[i].reportDate+'</td>';
						if(data[i].reportReason == 1){
							tbl += '<td>영리목적/홍보성</td>';
						}else if(data[i].reportReason == 2){
							tbl += '<td>음란성/선정성</td>';
						}else if(data[i].reportReason == 3){
							tbl += '<td>불법정보</td>';
						}else if(data[i].reportReason == 4){
							tbl += '<td>도배</td>';
						}else if(data[i].reportReason == 5){
							tbl += '<td>욕설/인신공격</td>';
						}else if(data[i].reportReason == 6){
							tbl += '<td>개인정보누출</td>';
						}else if(data[i].reportReason == 7){
							tbl += '<td>기타</td>';
						}
						if(data[i].commentContent.length > 16){
							var string = data[i].commentContent;
							var substring = string.substring(0,16);	
							tbl += '<td>'+substring+'...</td>';
						}else{
							tbl += '<td>'+data[i].commentContent+'</td>';
						}
					}
					$(".modal-body").append(tbl);
				}
	 		})
		})
		
		//아이디 검색 버튼 클릭시
		$(".searchBtn").click(function(){
			 var id = $("#searchForm").val();
			 location.href="/blockedMember.do?reqPage=1&id="+id;
		})
		
		 //체크박스 선택시 색바꾸기
		 function setBgcolor(t){
		 tr = t.parentNode.parentNode;
		 tr.style.backgroundColor = (t.checked) ? "rgba(78,205,196,0.1)" : "#fff"; 
	 	}
		
		//체크박스 전체 선택
		 $("#checkAll").click(function(){
			if($("#checkAll").prop("checked")){
		           $(".chk").prop("checked",true);
		    }else{
		           $(".chk").prop("checked",false);
		    }
		});
		
		//선택회원 차단해제
		 $(".cancelBtn").click(function(){
			var inputs = $(".chk:checked");
			var memberId = new Array(); //회원번호 저장할 배열
			
			inputs.each(function(idx,item){
				var id = $(item).parent().next().html();;
				memberId.push(id);
			});
			
			var checkBoxCheck = $('.chk').is(":checked");
			if(!checkBoxCheck){
				swal({
					  title: "회원 미선택",
					  text: "차단 해제할 회원을 선택해주세요.",
					  icon: "warning",
					  buttons: true,
					})
				return;
			}
			swal({
				  title: "차단 해제",
				  text: "선택한 회원을 차단해제 하시겠습니까?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
					  location.href="/cancelBlocked.do?memberId="+memberId.join("/");
				  }
				});
		 });
	</script>
</body>
</html>
















