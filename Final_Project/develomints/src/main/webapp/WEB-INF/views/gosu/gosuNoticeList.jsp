<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
<style>
.container * {
	text-decoration: none;
	color: black;
}

.container {
	min-width: 1200px;
}

input:focus, textarea:focus {
	outline: none;
}

.container>h3 {
	display: flex;
	justify-content: center;
	margin-top: 50px;
	font-size: 45px;
	font-weight: 900;
}

.gosu-search {
	display: flex;
	justify-content: right;
	margin-top: 100px;
	margin-bottom: 50px;
}

.gosu-search * {
	padding: 10px;
}

.gosu-search input {
	width: 350px;
}

.g-gall {
	width: 100%;
	display: flex;
	justify-content: center;
}

ul#gallery {
	display: flex;
	flex-wrap: wrap;
	margin-top: 30px;
	list-style: none;
	padding: 0;
	margin: 0 auto;
	width: 1050px;
}

ul#gallery>a>li dt {
	position: relative;
	width: 330px;
	height: 300px;
	border-radius:10px;
	margin: 10px;
	overflow: hidden;
	box-shadow: rgba(0, 0, 0, 0.4) 1PX 1PX 1PX 1PX;
}

ul#gallery>a>li dt::after {
	box-sizing: border-box;
	position: absolute;
	display: block;
	top: 50%;
	left: 50%;
	width: 87%;
	height: 87%;
	padding-top: 80px;
	transform: translate(-50%, -50%);
	text-align: center;
	font-size: 35px;

	transition: 0.8s;
}

ul#gallery>a>li dt img {
	width: 100%;
	height: 100%;
	transition: 0.6s ease-in-out;
}

ul#gallery>a>li:hover img {
	transform: scale(1.18);

}


ul#gallery>a>li dd {
	padding: 5px;
	height: 30px;
	text-align:center;
	width: 330px;
	overflow: hidden;
	text-overflow: ellipsis;
}

#pageNavi {
	display: flex;
	justify-content: center;
	margin-top: 100px;
	margin-bottom: 100px;
}

.gosu-write-wrap {
	position: fixed;
	z-index: 1000;
	margin-left: 1200px;
}

.gosu-write {
	box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);
	padding: 40px;
	text-align: center;
	justify-content: right;
	background-color: white;
}
.upbtn:hover {
-webkit-transform: scale(1.03);
    transform: scale(1.03);
}


.gosu-write a {
	margin-top: 20px;
	padding: 10px;
	width: 200px;
}

.gosu-write * {
	font-weight: bold;
	line-height: 30px;
}

.gosu-mail {
	display: flex;
	justify-content: right;
}

.gosu-mail a {
	font-weight: bold;
	font-size: 20px;
}

.gosu-mail span {
	font-weight: bold;
	color: white;
	background-color: red;
	border-radius: 50%;
	text-align: center;
	width: 20px;
	margin-left: 50px;
	display: block;
	font-size: 13px;
}

.op-st:focus{outline:none;}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		
		<h3>
			<span style="color: rgb(78, 205, 196);">고수</span>의 게시판
		</h3>
		<div class="gosu-search">
			

			<input type="text" id="search-content" placeholder="내용을 입력해주세요" class="form-control">
			<select name="type" class="nav-link dropdown-toggle op-st" style="border:1px solid #78c2ad;border-radius: 10px;">
				<option  class="dropdown-item" value="" selected disabled hidden>선택</option>
				<option class="dropdown-item" value="title" style="color:#78c2ad;">제목</option>
				<option class="dropdown-item" value="content" style="color:#78c2ad;">내용</option>
			</select>
			<button type="button" class="btn btn-primary form-control"
				style="padding: 7px; margin-left: 15px; width: 50px;"
				onclick="getSearchList();">검색</button>

		</div>
		<c:if test="${sessionScope.m.memberType eq 2}">
			<div class="gosu-write-wrap">
				<div class="gosu-write card border-light mb-3">
					<h5 style="font-size: 15px; color: #3c3c3c;">
						고수님만의 노하우를<br> 알려주세요!
					</h5>
					<a href="/gosuNoticeWriteFrm.do" class="btn btn-primary form-control upbtn" style="
		box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);"
					>노하우
						작성하기</a>
				</div>
			</div>
		</c:if>
		<div>


			<div class="g-gall">
				<ul id="gallery">
					<c:forEach items="${gNoticeList }" var="gnl" varStatus="i">
						<a href="/gosuNoticeContent.do?gnn=${gnl.gnoticeNo }">
							<li>
								<dl>
									<dt>
										<img src="${gnl.gnoticePhoto }">
									</dt>
									<dd>
										<b>${gnl.gnoticeTitle }</b>
									</dd>
								
								</dl>
						</li>
						</a>
					</c:forEach>
				</ul>
			</div>

		</div>
		<div id="pageNavi">${pageNavi }</div>
	</div>

	<script>
		function getSearchList() {

			var searchContent = $("input[id=search-content]").val();
			var type = $("select[name=type]").val();

			
			location.href = "/gosuNoticeList2.do?reqPage=1&keyword=" + searchContent
					+ "&type=" + type;
		}
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>