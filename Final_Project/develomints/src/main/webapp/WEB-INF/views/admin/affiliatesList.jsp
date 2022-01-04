<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제휴 회사 목록</title>
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
.table{
	margin-top : 30px;
	text-align: center;
}
.atag{
	text-decoration: none;
	color : #888888;
}
.atag:hover{
	color: #4ECDC4;
}
.tblTr>td{
	line-height: 40px;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container" style="margin-top:50px;margin-bottom:100px;">
		<div class="mainCate">
			<a href="/adminPage.do" class="cateAtag"><i class="bi bi-chevron-left"></i></a> 
			<span id="allMember" style="font-weight:bold">제휴 회사 목록</span>
		</div>
		<br><br><br>
		
		<%--회사 목록 테이블 --%>
		<table class="table newListTbl">
			<tr>
				<th><input type="checkbox" id="checkAll" class="form-check-input" style="zoom: 1.2;"></th>
				<th>No.</th>
				<th>회사명</th>
				<th>회사로고</th>
				<th>대표자</th>
				<th>창립일</th>
				<th>주소</th>
			</tr>
			<c:forEach items="${companyList }" var="c" varStatus="i">
				<tr class="tblTr">
					<td><input type="checkbox" class="form-check-input chk" style="zoom: 1.2;" onclick="setBgcolor(this)" value="${c.companyNo }"></td>
					<td>${start + i.index }</td>
					<td><a href="/companyInfo.do?companyNo=${c.companyNo }" class="atag">${c.companyName }</a></td>
					<td>
						<c:choose>
							<c:when test="${c.filePath == null}">
								<i class="bi bi-question-circle" style="height: 40px;"></i>
							</c:when>
							<c:otherwise>
								<img src="/resources/upload/company/${c.filePath}" width="150px;" height="40px;">						
							</c:otherwise>
						</c:choose>
						
					</td>
					<td>${c.ceo }</td>
					<td>${c.openDate}</td>
					<td>${c.address }</td>
				</tr>
			</c:forEach>
		</table>
		<button class="btn btn-secondary delBtn" style="float: right; margin-right:20px;">선택삭제</button>
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
	
	//체크박스 선택시 색바꾸기
	 function setBgcolor(t){
		 tr = t.parentNode.parentNode;
		 tr.style.backgroundColor = (t.checked) ? "rgba(78,205,196,0.1)" : "#fff";
		 
	 }
	
	 //선택회사 삭제
	 $(".delBtn").click(function(){
		var inputs = $(".chk:checked");
		var companyNo = new Array(); //회사번호 저장할 배열
		
		inputs.each(function(idx,item){
			var comNo = $(item).val();
			companyNo.push(comNo);
		});
		console.log(companyNo);
		var checkBoxCheck = $('.chk').is(":checked");
		if(!checkBoxCheck){
			swal({
	 			  title: "회사 선택",
	 			  text: "삭제할 회사를 선택해주세요.",
	 			  icon: "info",
	 			  buttons: true
	 			})
			return;
		}
		swal({
			  title: "회사 삭제",
			  text: "선택한 회사를 삭제하시겠습니까?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  location.href="/chkCompanyDel.do?companyNo="+companyNo.join("/");
			  }
			});
	 });
	 
	 
	</script>
</body>
</html>