<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 인증 처리</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<style>
.container {
   min-width: 1200px; 
}
#allMember{
	font-size: 25px;
	line-height: 46px;
}
.bi{
	font-size:30px;
}
.certiBox{
	display: flex;
	flex-wrap: wrap;
}
.memberBox{
	margin-left: 20px;
	width: 400px;
	border-radius: 3px;
	margin-bottom: 40px;
	text-align: center;
	padding : 20px;
	box-shadow: 1px 2px 10px 0 rgb(0 0 0 / 15%);
	transform: perspective(1px) translateZ(0);
}
.memberBox::before{
	content: "";
    position: absolute;
    z-index: -1;
    left: 0;
    right: 100%;
    top: 0;
    background: #4ECDC4;
    height: 4px;
    transition-property: right;
    transition-duration: 0.3s;
    transition-timing-function: ease-out;
}
.memberBox:hover:before{
	right: 0;
}

.imgBox{
	width: 160px;
	height: 160px;
	text-align: center;
	margin : 0 auto;
}
.imgBox>img{
	width: 60%;
	height: 60%;
	border-radius: 50%;
	margin-top: 17px;
}

.imgBox>p{
	font-weight: bold;
	font-size: 18px;
	margin-top: 5px;
}

.infoBox{
	padding: 10px;
	margin-top: px;
}

.infoTitle{
	font-size: 17px;
	font-weight: bold;	
}
.certiBtn{
	margin-bottom : 20px;
}
.noList{
	width: 1200px;
	border: 1px solid #d9d9d9;
	height: 400px;
	text-align: center;
	padding-top: 130px;
}
.noList>p{
	font-size: 25px;
	font-weight: bold;
}

</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container" style="margin-top:50px;margin-bottom:100px;">
		<div class="mainCate">
			<a href="/adminPage.do" class="cateAtag"><i class="bi bi-chevron-left"></i></a> 
			<span id="allMember" style="font-weight:bold">회사 인증 처리</span>
		</div>
		<br><br><br>
		
		<c:choose>
			<c:when test="${not empty list }">
				<div class="certiBox">
					<c:forEach items="${list }" var="c" varStatus="i">
						<div class="memberBox">
							<div class="imgBox">
								<c:choose>
									<c:when test="${not empty memlist[i.index].filepath }">
										<img src="/resources/upload/member/${memlist[i.index].filepath }">
									</c:when>
									<c:otherwise>
										<img src="/resources/img/member/user.png">
									</c:otherwise>
								</c:choose>
								<p> ${memlist[i.index].memberId }<p>
							</div>
							<div class="infoBox">
								<div class="certiBtn"><button class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#certiModal${i.index }">인증 사진 확인</button></div>
								 <span class="infoTitle"><i class="bi bi-person-fill" style="font-size: 20px; color: #898989; margin-right: 5px;"></i>회원이름 : </span><span>${memlist[i.index].memberName }</span><br>
								 <span class="infoTitle"><i class="bi bi-envelope" style="font-size: 20px; color: #898989; margin-right: 5px;"></i>이메일 : </span><span>${memlist[i.index].email }</span><br>
								 
								 <div class="inputBox">
									 <form action="/enrollMemberCompany.do" class="enrollForm">
										<span><i class="bi bi-briefcase" style="font-size: 20px; color: #898989; margin-right: 5px;"></i></span><span class="infoTitle" style="margin-top: 20px; margin-ridisplay: inline-block; margin-right: 5px;">회사 선택 : </span>
										<select class="form-control selectForm" style="margin-top:7px; width: 200px; display: inline-block;" name="companyNo" > 
											<option value="no">회사를 선택하세요.</option>
											<c:forEach items="${companyList }" var="com">
												<option value="${com.companyNo }">${com.companyName }</option>
											</c:forEach>
										</select>
										<input type="hidden" name="memberNo" value="${memlist[i.index].memberNo }">
									</form>
								</div>
							</div>
							<div>
								<button class="btn btn-primary enrollBtn" style="margin-top: 20px; margin-right: 5px;">인증</button><button class="btn btn-secondary noEnrollBtn"  style="margin-top: 20px; margin-left: 5px;">반려</button>
							</div>
						</div>
					</c:forEach>
				</div>
				<div id="pageNavi" style="text-align: center; margin-top:50px;"  >${pageNavi }</div>
				
				<!-- 내용보기 Modal -->
				<c:forEach items="${list }" var="c" varStatus="i">
				<div class="modal fade" id="certiModal${i.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content" style="border-radius: 0.3rem;">
				      <div class="modal-body">
				      	<img src="/resources/upload/certification/${c.filepath }" width="470">
				      </div>
				    </div>
				  </div>
				</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="noList">
					<p><i class="bi bi-chat-square-dots" style="color: #4ECDC4; font-size: 35px;"></i></p>
					<p>회사 인증을 요청한 회원이 없습니다.</p>
				</div>
			</c:otherwise>
		</c:choose>
		
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	<script>
	
		//회사 인증 클릭 시
		$(".enrollBtn").click(function(){
			var index = $(".enrollBtn").index(this);
			if($('.selectForm option:selected').eq(index).val() == 'no'){
				swal({
		 			  title: "회사 선택",
		 			  text: "인증할 회사를 선택해주세요.",
		 			  icon: "info",
		 			  buttons: true
		 			})
				return;
			}
			swal({
	 			  title: "회사 인증",
	 			  text: "선택한 회사로 인증하시겠습니까?",
	 			  icon: "warning",
	 			  buttons: true,
	 			  dangerMode: true,
	 			})
	 			.then((willDelete) => {
	 			  if (willDelete) {
	 				 $(".enrollForm").eq(index).submit();	
	 			  }
	 			});
		})
		
		//회사 인증 반려 클릭 시
		$(".noEnrollBtn").click(function(){
			var index = $(".noEnrollBtn").index(this);
			var memberNo = $("[name=memberNo]").eq(index).val();
			swal({
	 			  title: "회사 인증 반려",
	 			  text: "선택한 회원을 반려 처리하시겠습니까?",
	 			  icon: "warning",
	 			  buttons: true,
	 			  dangerMode: true,
	 			})
	 			.then((willDelete) => {
	 			  if (willDelete) {
	 				 location.href="/noEnrollMemberCompany.do?memberNo="+memberNo;	
	 			  }
	 			});
		})
	</script>
</body>
</html>















