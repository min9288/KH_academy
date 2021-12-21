<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomints</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/member/certification.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
			<div class="certi-wrap">
				<div class="certi-top">
					<span>내 회사 인증</span><img src="/resources/img/member/condo.png">
				</div>
				<div class="certi-middle">
					<div class="profiles-l">
						<c:choose>
							<c:when test="${sessionScope.m.filepath eq null }">
								<img src="/resources/img/member/user.png" style="width: 60px; height:60px;">				
							</c:when>
							<c:otherwise>
								<img src="/resources/upload/member/${sessionScope.m.filepath }" style="width: 80px; height:80px; border-radius:7px;">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="profiles-m">
						<div>
							<span>[${sessionScope.m.memberName}]님</span>
						</div>
						<div>
							<span>이메일:${sessionScope.m.email }</span>
						</div>
					</div>
					<div class="profiles-r">
						<p class="text-muted">* 사원증 사진을 첨부해주시면, 관리자가 확인 후, 인증해 드립니다.</p>
					</div>					
				</div>
				<div class="certi-bottom">
					<form action="/certificationWrite.do" method="post" enctype="multipart/form-data">
					    <div class="form-group">
					      <label for="formFile" class="form-label mt-4 text-info">* 빛이 반사되지 않는곳에서 사진을 찍으면 승인 될 확률이 높습니다.</label>
					      <input class="form-control" type="file" id="formFile" name="files" multiple> 
					      <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
					    </div>
					    <button type="submit" class="btn btn-primary" data-bs-toggle="tooltip" data-bs-placement="top" title="사진은 한장만 첨부가능">인증하기</button>
					</form>
				</div>
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
		var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
		  return new bootstrap.Tooltip(tooltipTriggerEl)
		})
		var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
		var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  		return new bootstrap.Popover(popoverTriggerEl)
		})
	</script>
</body>
</html>