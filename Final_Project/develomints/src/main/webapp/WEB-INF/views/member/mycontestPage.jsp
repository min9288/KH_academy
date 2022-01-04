<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomints</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="/resources/css/member/viewPages.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
			<div class="page-wrap">
				<div class="page-top">
					<div class="page-topImg">
						<span style="text-align: left; font-family: NotoBold; font-size: 30px;">공모전 신청내역</span>
						<img src="/resources/img/member/podium.png" style="width: 50px; height: 50px; margin-left: 10px;">				
					</div>
					<c:choose>
						<c:when test="${sessionScope.m.memberType eq 2 }">
							<a href="/mypageGosu.do" class="btn btn-warning" style="height: 40px;">뒤로가기</a>															
						</c:when>
						<c:otherwise>
							<a href="/mypage.do" class="btn btn-warning" style="height: 40px;">뒤로가기</a>
						</c:otherwise>
					</c:choose>
				</div>
				<c:choose>
					<c:when test="${empty list }">
						<p class="notting">신청내역이 없습니다 ! </p>
						<input type="hidden" id="notting" value="0">
						<input type="hidden" id="memberType" value="${sessionScope.m.memberType }">
					</c:when>
					<c:otherwise>
						<table class="table table-hover">
							<tr class="table-primary">
								<th>번호</th><th>공모전명</th><th>마감여부</th><th>신청상태</th>
							</tr>
							<c:forEach items="${list }" var="ct" varStatus="i">
								<tr>
									<td>${start+i.index }</td>
									<td>
										<a href="/contestView.do?contestNo=${ct.contestNo }">${ct.contestTitle }</a>
									</td>
									<c:choose>
										<c:when test="${ct.contestDeadline eq '마감' }">
											<td class="text-danger">마감</td>
										</c:when>
										<c:otherwise>
											<td>${ct.contestDeadline }</td>									
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${ct.cmStatus eq 1 }">
											<td>처리중</td>
										</c:when>
										<c:when test="${ct.cmStatus eq 2 }">
											<td>신청완료</td>
										</c:when>
										<c:otherwise>
											<td>신청반려</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</table>			
					<div id="pageNavi">
						${pageNavi }
					</div>		
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script type="text/javascript">
		$(document).ready(function(){
			var memberType = $("#memberType").val();
			
			if($("#notting").val() == 0){
				swal({
			        title: '신청내역이 없습니다',
			        text: '',
			        icon: 'warning',
			        button : '돌아가기'
			      }).then(function(){
			    	  if(memberType==2){
			    	  	window.location = "/mypageGosu.do";			    		  
			    	  }else{
			    		  window.location = "/mypage.do";	  
			    	  }
                  });					
			}
		});
	</script>	
</body>
</html>