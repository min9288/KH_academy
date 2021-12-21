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
					<div>
						<span style="text-align: left; font-family: NotoBold; font-size: 30px;">고수의 노하우 작성글</span>
						<img src="/resources/img/member/notes.png" style="width: 50px; height: 50px; margin-left: 10px;">					
					</div>
					<a href="/mypageGosu.do" class="btn btn-warning" style="height: 40px;">뒤로가기</a>			
				</div>
				<c:if test="${empty list }">
					<div>
						<input type="hidden" id="notting" value="0">
						<input type="hidden" id="memberType" value="${sessionScope.m.memberType }">									
					</div>
				</c:if>
					<table class="table table-hover">
						<tr class="table-primary">
							<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th>
						</tr>
						<c:forEach items="${list }" var="gn" varStatus="i">
							<tr>
								<td>${start+i.index }</td>
								<td>
									<a href="/gosuNoticeContent.do?gnn=${gn.gnoticeNo }">${gn.gnoticeTitle }</a>
								</td>
								<td>${gn.writeId }</td>
								<td>${gn.gnoticeDate }</td>
							</tr>
						</c:forEach>
					</table>			
				<div id="pageNavi">
					${pageNavi }
				</div>
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script type="text/javascript">
		$(document).ready(function(){
			var memberType = $("#memberType").val();
			
			if($("#notting").val() == 0){
				swal({
			        title: '작성글이 없습니다',
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