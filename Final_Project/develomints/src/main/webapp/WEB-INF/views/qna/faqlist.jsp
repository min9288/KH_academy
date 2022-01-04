<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="box_faq_list">
		<header class="box_header" style="margin-bottom: 26px;">
			<p style="font-size: 20px;margin-bottom: 0;">FAQ</p>
			<span  class="mt-4">
				<c:choose>
					<c:when test="${category eq 7}">
						로그인관련
					</c:when>
					<c:when test="${category eq 8}">
						고수안내
					</c:when>
					<c:when test="${category eq 9}">
						환불관련
					</c:when>
					<c:when test="${category eq 10}">
						공모전관련
					</c:when>
					<c:when test="${category eq 11}">
						구인잡관련
					</c:when>
					<c:when test="${category eq 12}">
						커뮤니티관련
					</c:when>
					<c:when test="${category eq 13}">
						이용안내
					</c:when>
					<c:when test="${category eq 14}">
						팀프로젝트관련
					</c:when>
					<c:when test="${category eq 40}">
						기타
					</c:when>
					<c:when test="${category eq 22}">
						신고
					</c:when>
					<c:when test="${category eq 21}">
						기능/작동 오류
					</c:when>
					<c:when test="${category eq 20}">
						이벤트
					</c:when>
				</c:choose>
			 에 관련된 자주 묻는 질문</span>
			<a class="n-lick" href="/faq.do?category=${category }"><span style="float: right;padding-right: 5px;" class="text-danger btn-h">전체</span></a>
		</header>
			<!-- faq  -->
		<main>
		<div class="faq-list">
			<c:forEach varStatus="i" items="${list }" var="f">
				<%-- <div class="faq-tap">
					<div class="faq-tap tap-title">
						<p><i class="bi bi-chat-right-text"></i>${f.faqNo}<span>${f.faqQ }</span> <i class="bi bi-chevron-double-down"></i></p>
					</div>
					<div class="faqAnswer-View" style="display:none">
						<p>${f.faqA }</p>
					</div>
				</div> --%>
				<div class="accordion" id="accordionExample">
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="heading${i.index }">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${i.index }" aria-expanded="false" aria-controls="collapse${i.index }">
				       <span>${f.faqQ } #${f.faqNo }</span>
				      </button>
				    </h2>
				    <div id="collapse${i.index }" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
				      <div class="accordion-body">
				        <strong>${f.faqA }</strong>
				      </div>
				    </div>
				  </div>
				</div>
			</c:forEach>
		</div>
		</main>
	</div>
</body>
</html>