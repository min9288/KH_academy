<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.container * {
	text-decoration: none;
	color: black;
}

.container {
	min-width: 1200px;
	margin-bottom: 100px;
}

input:focus, textarea:focus {
	outline: none;
}

.container>h3 {
	display: flex;
	justify-content: center;
	margin-top: 50px;
	font-size: 30px;
	font-weight: 900;
}

.requestList {
	display: flex;
	justify-content: center;
	margin-bottom: 50px;
}

.requestList * {
	padding: 20px;
}

.requestList>table {
	width: 100%;
}

.requestList>table>tbody>tr>td {
	padding: 0;
}

.requestList a {
	display: flex;
	justify-content: center;
}

.g-one-tbl img {
	border-radius: 50%;
	width: 150px;
}

.g-one-tbl {
	width: 70%;
	border: 3px solid #78c2ad;
	box-shadow: rgba(0, 0, 0, 0.4) 2PX 2PX 2PX 2PX;
   
}

.g-one-tbl:hover {
	border: 3px solid rgb(235, 242, 235);
}

.g-one-tbl th {
	width: 200px;
}

.g-one-tbl td {
	padding-right: 50px;
	text-align: center;
}

#pageNavi {
	display: flex;
	justify-content: center;
}

.talk-sub {
	display: flex;
	justify-content: center;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<h3>
			<span style="color: rgb(78, 205, 196);">디벨로민트</span>에서 연결된 요청리스트
		</h3>
		<div
			style="display: flex; justify-content: center; margin-top: 100px;">
			<div style="padding: 20px; width: 1150px;">
				<span style="font-weight: 900;"><a
					href="/gosuRequestList.do?reqPage=1" class="card-link">전체보기</a><a
					href="/gosuRequestListGosuNo.do?reqPage=1&gosuNo=${sessionScope.m.memberNo }&type=in"
					class="card-link">보낸 요청서</a><a
					href="/gosuRequestListGosuNo.do?reqPage=1&gosuNo=${sessionScope.m.memberNo }&type=notin"
					class="card-link">보내지 않은 요청서</a></span>
			</div>
		</div>
		
			<c:choose>
				<c:when test="${empty memberRequestList }">
					<div class="talk-sub" style="margin-bottom: 100px;">
						<div style="text-align: center;">
							<img src="/resources/img/member/user.png"
								style="border-radius: 50%; width: 70px; margin-top: 70px;">
							<h2 style="font-weight: 900; color: #cacaca; margin: 30px; ">요청서를 
								찾을 수 없습니다.</h2>
						</div>
					</div >

				</c:when>
				<c:otherwise>
				<div class="requestList">
					<table>
						<c:forEach items="${memberRequestList }" var="mrl" varStatus="i">
							<tr>
								<td><a href="/gosuRequestContent.do?mrn=${mrl.requestNo }" style="padding-top: 40px;">
										<table class="g-one-tbl">
											<tr>
												<th rowspan="2" style="padding-bottom: 0;padding-top: 0;"><c:if
														test="${empty mrl.requestWriterImg }">
														<img src="/resources/img/gosu/g_img_basic.png">
													</c:if> <c:if test="${not empty mrl.requestWriterImg }">
														<img
															src="/resources/upload/member/${mrl.requestWriterImg }">
													</c:if></th>
												<th style="height:18px;padding-bottom: 0;"><span style="color: rgb(78, 205, 196); padding: 0;font-size: 20px;">${mrl.requestWriterId }</span></th>
												<td style="text-align: right;padding-bottom: 0;">${mrl.requsetDate}</td>
											</tr>
											<tr>
												<td colspan="2" style="padding-top: 0;">
													
													<p style=" border: 3px solid rgb(223, 245, 235);border-radius: 30px;margin: 0;">${mrl.requestContent7Plus}</p></td>
											</tr>
										
										</table>
								</a></td>
							</tr>
						</c:forEach>

					</table>
					</div>
				</c:otherwise>
			</c:choose>



		

		<div id="pageNavi" style="margin-bottom: 100px;">${pageNavi }</div>

		<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>