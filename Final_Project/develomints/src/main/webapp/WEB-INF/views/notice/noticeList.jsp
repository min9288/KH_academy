<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/notice/noticeList.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container" style="margin-bottom: 50px;">
		<div class="area">
			<div class="nav-sub" style="margin-top: 30px;"><a href="/" class="text-hover">홈</a><span> > </span><a href="/noticehome.do" class="text-hover">고객센터</a><span> > </span><span>공지사항</span></div>
			<div class="title"><h2 style="color: #78c2ad;font-weight: bold;">CS Center</h2></div>
			<div class="center_tap">
				<ul>
					<li><span class="">Tel. 2163-8560</span><br><span class="last-span">평일 9:20~18:30(점심 12:20~13:30)</span></li>
					<li><a href="/n_counsel.do" class="text-hover">1:1 Q&A<br><span class="last-span">질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요.</span></a></li>
					<li><a href="/faq.do?category=7" class="text-hover">자주묻는질문<br><span class="last-span">자주묻는질문</span></a></li>
				</ul>
			</div>
			<div class="contents">
				<div class="title"><h2 style="display: inline-block;">Notice</h2>
				<c:if test="${not empty sessionScope.m && sessionScope.m.memberType eq 9}">
					<!-- <a class="btn btn-outline-dark" href="/nWriteFrm.do" style="float: right;margin-right: 10px;">공지 선택삭제</a> -->
					<a class="btn btn-outline-dark" href="/nWriteFrm.do" style="float: right;margin-right: 10px;">관리자 글쓰기</a>
				</c:if>
				</div>
				<table class="table table-hover">
					<thead>
						<tr>
					     	<th scope="col" style="width: 10%;text-indent: 1em;">번호</th>
					     	<th scope="col" style="text-align: center;">제목</th>
					     	<th scope="col" style="width: 10%;text-indent: 1em;">등록일</th>
					    </tr> 
				 	</thead>
				 	<tbody>
				 		<c:forEach items="${list  }" var="n" varStatus="i">
						<c:choose>
							<c:when test="${n.pin eq 2}">
								<tr class="table-primary" id="noticeList">
									<td style="text-indent: 5px;"><i class="bi bi-pin-angle-fill" style="color: #f3969a;"></i></td> 
									<td style="text-align: left;" >
										<span style="color: #ddd;">[주요공지] </span><a href='/noticeView.do?noticeNo=${n.noticeNo}' id="noticePin" style="color: #fff;" class="text-decoration-none"> ${n.noticeTitle }</a>
									</td>
									<td>${n.regDate }</td>
								</tr>
							</c:when>
							<c:otherwise>
							<tr class="table-light" id="noticeList" style="background-color: #bdbdbd;">
									<td style="text-indent: 1em;">${start + i.index-fixPage}</td> 
									<td style="text-align: left; ">
										<a href='/noticeView.do?noticeNo=${n.noticeNo }' style="text-decoration: none;"> ${n.noticeTitle }</a>
									</td>
									<td>${n.regDate }</td>
								</tr>
							</c:otherwise>
						</c:choose>
						</c:forEach>
				 	</tbody>
				</table>
				<div id="pageNavi" style="display:flex; justify-content: flex-end">${pageNavi }</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- <script type="text/javascript">
		$(document).ready(function() {
		    brandnewNotice();
		});
		function brandnewNotice() {
		    $.ajax({
                dataType : "json",
                url : "notice/brandnewNotice.do",
                type : "GET",
                success : function(data) {
                    var html = '';
                    html += '<td>' + data.noticeTitle + '</td>';
                    html += '<td>' + data.noticeContent + '</td>';
                    html += '<td>' + data.regDate + '</td>';
                    html += '</tr>';
                    html += '</table>';
                    $("#noticeList").html(html);
                }
            });
		}
	</script> -->
</body>
</html>